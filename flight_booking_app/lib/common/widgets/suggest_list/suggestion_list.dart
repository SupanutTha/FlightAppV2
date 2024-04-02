// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../utilities/database_helper.dart';

class SuggestionList {
  final String? controller;
  SuggestionList({
    required this.controller,
  });
  final dbHelper = DatabaseHelper.instance;

  Future<List<String>> suggestionsCallback (String pattern)  async {
  final airports = await dbHelper.retrieveAirports();
  final filteredAirports = airports.where((airport) {
    return airport.iata.contains(pattern.toUpperCase()) ||
      airport.city.toUpperCase().contains(pattern.toUpperCase()) ||
      airport.country.toUpperCase().contains(pattern.toUpperCase());
    }).toList();
    return filteredAirports.map((airport) {
      return '${airport.city}, ${airport.country} - ${airport.iata}';
    }).toList();
  }

  }

class SuggestResult {
      late TextEditingController suggestResult;
      void saveResult(TextEditingController  _controller){
          suggestResult = _controller;
      }
      
      TextEditingController get getResutl{
        return suggestResult;
      }


  }
