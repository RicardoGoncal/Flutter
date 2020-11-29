import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://rocky-chamber-61088.herokuapp.com";

class API {
  static Future getUsers() {
    var url = baseUrl + "/corredores";
    return http.get(url);
  }
}
