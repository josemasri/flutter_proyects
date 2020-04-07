import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/models/news_models.dart';

final _URL_NEWS = 'https://newsapi.org/v2';
final _API_KEY = '149995f744454ede94925fec82dcea72';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  List<Article> articlesByCategory = [];
  String _selectedCategory = 'business';
  bool _isLoading = false;

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.footballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  NewsService() {
    this.getTopHeadlines();
    this.getArticlesByCategory();
  }

  String get selectedCategory => this._selectedCategory;

  bool get isLoading => this._isLoading;

  set selectedCategory(String category) {
    this._selectedCategory = category;
    this.articlesByCategory = [];
    this.getArticlesByCategory(category: category);
    notifyListeners();
  }

  getTopHeadlines({int page = 1, String country = 'us'}) async {
    if (_isLoading) {
      return;
    }
    this._isLoading = true;
    final url =
        '$_URL_NEWS/top-headlines?apiKey=$_API_KEY&country=$country&page=$page';
    final resp = await http.get(url);
    print(resp.body);
    print(json.decode(resp.body));
    final newsResponse = newsResponseFromJson(resp.body);
    headlines.addAll(newsResponse.articles);
    this._isLoading = false;
    notifyListeners();
  }

  getArticlesByCategory(
      {String category = 'business',
      String country = 'mx',
      int page = 1}) async {
    _isLoading = true;
    final url =
        '$_URL_NEWS/top-headlines?apiKey=$_API_KEY&country=$country&sortBy=publishedAt&category=$category&page=$page';
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    articlesByCategory.addAll(newsResponse.articles);
    _isLoading = false;
    notifyListeners();
  }
}
