import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';
import 'package:formvalidation/src/preferencias_usuario/preferencias_usuario.dart';

import 'package:formvalidation/src/models/producto_model.dart';

class ProductosProvider {
  final String _url = 'https://flutter-varios-4db4a.firebaseio.com';
  final _prefs = PreferenciasUsuario();

  Future<bool> crearProducto(ProductoModel producto) async {
    final url = '$_url/productos.json?auth=${_prefs.token}';
    final res = await http.post(url, body: productoModelToJson(producto));
    final decodedData = json.decode(res.body);
    print(decodedData);
    return true;
  }

  Future<bool> editarProducto(ProductoModel producto) async {
    final url = '$_url/productos/${producto.id}.json?auth=${_prefs.token}';
    producto.id = null;
    final res = await http.put(url, body: productoModelToJson(producto));
    final decodedData = json.decode(res.body);
    print(decodedData);
    return true;
  }

  Future<List<ProductoModel>> obtenerProductos() async {
    final url = '$_url/productos.json?auth=${_prefs.token}';
    final res = await http.get(url);
    final Map<String, dynamic> decodedData = json.decode(res.body);
    if (decodedData == null) {
      return [];
    }
    if (decodedData['error'] != null) {
      return [];
    }
    final List<ProductoModel> productos = [];
    decodedData.forEach((id, prod) {
      final ProductoModel productoTemp = ProductoModel.fromJson(prod);
      productoTemp.id = id;
      productos.add(productoTemp);
    });
    return productos;
  }

  Future<bool> eliminarProducto(String id) async {
    final url = '$_url/productos/$id.json?auth=${_prefs.token}';
    final res = await http.delete(url);
    return true;
  }

  Future<String> subirImagen(File imagen) async {
    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dzk5e5wtw/image/upload?upload_preset=i2dqxyji');
    final mimetype = mime(imagen.path).split('/');

    final imageUploadRequest = http.MultipartRequest('POST', url);

    final file = await http.MultipartFile.fromPath(
      'file',
      imagen.path,
      contentType: MediaType(
        mimetype[0],
        mimetype[1],
      ),
    );

    imageUploadRequest.files.add(file);
    final streamResponse = await imageUploadRequest.send();
    final res = await http.Response.fromStream(streamResponse);
    if (res.statusCode != 200 && res.statusCode != 201) {
      print('Algo salio mal');
      print(res.body);
      return null;
    }
    final resData = json.decode(res.body);
    print(resData);
    return resData['secure_url'];
  }
}
