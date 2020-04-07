import 'dart:convert';

List<MenuModel> menuModelFromJson(String str) => List<MenuModel>.from(json.decode(str).map((x) => MenuModel.fromJson(x)));

String menuModelToJson(List<MenuModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MenuModel {
    String widget;
    String icono;
    String route;

    MenuModel({
        this.widget,
        this.icono,
        this.route,
    });

    factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        widget: json["widget"],
        icono: json["icono"],
        route: json["route"],
    );

    Map<String, dynamic> toJson() => {
        "widget": widget,
        "icono": icono,
        "route": route,
    };
}