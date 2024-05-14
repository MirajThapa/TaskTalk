import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiBaseHelper{
  final String baseUrl = "https://gist.githubusercontent.com/saniyusuf/406b843afdfb9c6a86e25753fe2761f4/raw/523c324c7fcc36efab8224f9ebb7556c09b69a14/Film.JSON";

  Future<dynamic> get(String url) async{
    var responseJson;
    try{
      final response = await http.get((baseUrl+ url) as Uri);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('No Internet Connection');
    }

  }

  dynamic _returnResponse(http.Response response){
    switch (response.statusCode){
      case 200:
      var responseJson = json.decode(response.body.toString());
      print(responseJson);
      return responseJson;
    case 400:
      throw Exception(response.body.toString());
    case 401:
    case 403:
      throw Exception(response.body.toString());
    case 500:
    default:
      throw Exception(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  

    }
  }


}