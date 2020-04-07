import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/theme/theme.dart';
import 'package:provider/provider.dart';

class ListaNoticias extends StatefulWidget {
  final List<Article> noticias;


  ListaNoticias(this.noticias);

  @override
  _ListaNoticiasState createState() => _ListaNoticiasState();
}

class _ListaNoticiasState extends State<ListaNoticias> {
  int currentPage = 1;
  final _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.47,
  );

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
            currentPage++;
            newsService.getTopHeadlines(page: currentPage);
            setState(() {});
      }
    });
    return PageView.builder(
      controller: _pageController,
      pageSnapping: false,
      scrollDirection: Axis.vertical,
      itemCount: this.widget.noticias.length,
      itemBuilder: (
        BuildContext context,
        int index,
      ) {
        return _Noticia(
          noticia: this.widget.noticias[index],
          index: index,
        );
      },
    );
  }
}

class _Noticia extends StatelessWidget {
  final Article noticia;
  final int index;

  const _Noticia({@required this.noticia, @required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _TarjetaTopBar(noticia, index),
          _TarjetaTitulo(noticia),
          _TarjetaImagen(noticia),
          _TajetaBody(noticia),
          _TarjetaBotones(noticia),
          Divider(),
        ],
      ),
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  final Article noticia;

  const _TarjetaBotones(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {},
            fillColor: miTema.accentColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.star_border),
          ),
          SizedBox(
            width: 10,
          ),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.more_horiz),
          ),
        ],
      ),
    );
  }
}

class _TajetaBody extends StatelessWidget {
  final Article noticia;

  const _TajetaBody(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        (noticia.description != null) ? noticia.description : '',
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Article noticia;

  const _TarjetaImagen(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ClipRRect(
        child: FadeInImage(
          fit: BoxFit.fill,
          height: 150,
          width: double.infinity,
          placeholder: AssetImage('assets/giphy.gif'),
          image: (noticia.urlToImage == null)
              ? AssetImage('assets/no-image.png')
              : NetworkImage(noticia.urlToImage),
        ),
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  final Article noticia;

  const _TarjetaTitulo(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        noticia.title,
        textAlign: TextAlign.left,
        maxLines: 2,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, wordSpacing: 0.2),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;

  const _TarjetaTopBar(this.noticia, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        children: <Widget>[
          Text('${index + 1} ', style: TextStyle(color: miTema.accentColor)),
          Text('${noticia.source.name}'),
        ],
      ),
    );
  }
}
