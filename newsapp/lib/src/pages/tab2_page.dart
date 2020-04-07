import 'package:flutter/material.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatefulWidget {
  @override
  _Tab2PageState createState() => _Tab2PageState();
}

class _Tab2PageState extends State<Tab2Page> {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            _ListaCategorias(),
            if (!newsService.isLoading)
              Expanded(child: ListaNoticias(newsService.articlesByCategory)),
            if (newsService.isLoading)
              Expanded(
                  child: Center(
                child: CircularProgressIndicator(),
              ))
          ],
        ),
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;
    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final cName = categories[index].name;
          return GestureDetector(
            onTap: () {
              final newsService =
                  Provider.of<NewsService>(context, listen: false);
              newsService.selectedCategory = categories[index].name;
            },
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  _CategoryButton(
                    categories[index],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${cName[0].toUpperCase()}${cName.substring(1)}',
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category category;

  const _CategoryButton(this.category);

  @override
  Widget build(BuildContext context) {
    String selectedCategory =
        Provider.of<NewsService>(context).selectedCategory;
    return Container(
      width: 40,
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Icon(
        category.icon,
        color: (selectedCategory == category.name)
            ? Theme.of(context).accentColor
            : Colors.black54,
      ),
    );
  }
}
