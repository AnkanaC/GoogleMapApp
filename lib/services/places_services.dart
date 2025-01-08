import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:myapp/models/places_search.dart';

class PlacesServices {
  final key = 'AIzaSyDtNrQSq-Uc8nmqY2nfn67sPQtMo-WDZm8';
  Future<List<PlacesSearch>> getAutoComplete(String search) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=(cities)&key=$key';
    var response = await http.get(url as Uri);
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['predictions'] as List;
    return jsonResults.map((place) => PlacesSearch.fromJson(place)).toList();
  }
}
