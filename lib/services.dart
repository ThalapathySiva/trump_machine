import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/quote.dart';

class Services extends ChangeNotifier {
  List<Quote> quoteList = [];
  List tagList = [];
  List faveList = [];
  int votes = 0;
  String api = 'https://api.tronalddump.io/search/quote?query=';

  String _searchterm;
  get searchTerm => _searchterm;
  set setSearchTerm(term) {
    _searchterm = term;
    notifyListeners();
  }

  int _currentIndex = 0;
  get getIndex => _currentIndex;

  set setIndex(value) {
    _currentIndex = value;
    notifyListeners();
  }

  Map<String, String> requestHeaders = {
    'Content-type': 'application/hal+json',
    'Accept': 'application/hal+json',
  };

  incrementVotes() {
    votes++;
    notifyListeners();
  }

  Future<Null> callApi(api, List quoteList) async {
    await http.get(api + searchTerm, headers: requestHeaders).then((response) {
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        if (res['count'] == 0) {
          print('found nothing');
        } else {
          for (var item in res['_embedded']['quotes']) {
            quoteList.add(Quote.fromJson(item));
          }
        }
      }
    });
  }

  Future<List> callApiTag(List tagList) async {
    await http.get('https://api.tronalddump.io/tag').then((response) {
      if (response.statusCode == 200) {
        var blob = jsonDecode(response.body);
        var list = blob["_embedded"];
        for (var tag in list) {
          tagList.add(tag);
        }
      }
    });
    return tagList;
  }
}
