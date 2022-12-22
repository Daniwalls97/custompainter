import 'dart:developer';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../models/hero.dart';

class PinterestPageUI with ChangeNotifier {
  final String _baseUrl = "https://akabab.github.io/superhero-api/api/";
  final String _allHeros = "all.json";
  final List<SuperHero> _listHeroes = <SuperHero>[];

  PinterestPageUI() {
    getAllHeroesAPI();
  }

  List<SuperHero> get listHeroes => _listHeroes;
  set listHeroes(List<SuperHero> list) {
    _listHeroes.addAll(list);
    notifyListeners();
  }

  getAllHeroesAPI() async {
    try {
      var url = Uri.parse(_baseUrl + _allHeros);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var heroes = heroFromJson(response.body);
        listHeroes = heroes;
        return listHeroes;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
