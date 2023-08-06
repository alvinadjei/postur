import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

List<String> parseLatLng(String resultsString) {
  String initialSubstring = 'geometry: {location: {lat: ';
  int initialSubstringIndex = resultsString.indexOf(initialSubstring);

  String firstSpliceSubstring =
      resultsString.substring(initialSubstringIndex + initialSubstring.length);
  String secondSpliceSubstring =
      firstSpliceSubstring.substring(0, firstSpliceSubstring.indexOf('}'));

  String latString = secondSpliceSubstring
      .substring(0, secondSpliceSubstring.indexOf(', '))
      .trim();
  //print(latString);

  String markerString = ', lng:';
  int markerIndex = secondSpliceSubstring.indexOf(markerString);

  String lngString = secondSpliceSubstring
      .substring(markerIndex + markerString.length + 1)
      .trim();

  //Note: we dont really need the trim at the end, so remove if need be or for
  //efficiency reasons.
  //print(lngString);

  return [latString, lngString];
}

class PlaceAutoComplete {
  final String address;
  final String placeId;

  PlaceAutoComplete(this.address, this.placeId);

  static PlaceAutoComplete fromJson(dynamic json) {
    final String address = json['description'];
    final String placeId = json['place_id'];
    return PlaceAutoComplete(address, placeId);
  }
}

class PlacesRepository {
  final String key = 'AIzaSyDGT20OxGoAgAv-GuzqIdPN533xcl0dOOU';
  final String types = 'establishment';

  Future<LatLng?> getCoordsFromPlaceId(String placeId) async {
    print(placeId);
    final String url =
        'https://maps.googleapis.com/maps/api/geocode/json?place_id=$placeId&key=$key';
    try {
      var response =
          await http.get(Uri.parse(url)); //test this with introduced delays...
      //print(response.body);
      var json = convert.jsonDecode(response.body);
      print(json.runtimeType);
      var status = json['status'];

      if (status == 'OK') {
        //print('status is OK!');
        var resultsString = json['results'].toString();
        List<String> latLngStringList = parseLatLng(resultsString);
        double lat = double.parse(latLngStringList[0]);
        double lng = double.parse(latLngStringList[1]);

        return LatLng(lat, lng);
      } else {
        print('Something went wrong with the place ID (presumably)');
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<PlaceAutoComplete>?> getAutoComplete(String? input) async {
    final String url =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&components=country:us&language=en&location=42.3732%2C-71.1202&radius=50000&types=$types&key=$key";
    try {
      var response = await http.get(Uri.parse(url));
      var json = convert.jsonDecode(response.body);
      var status = json['status'];

      if (status == 'OK') {
        var results = json['predictions'] as List;
        return results
            .map((place) => PlaceAutoComplete.fromJson(place))
            .toList();
      } else {
        print(status);
        return [];
      }
    } catch (e) {
      print('Error fetching search results: $e');
      return [];
    }
  }
}
