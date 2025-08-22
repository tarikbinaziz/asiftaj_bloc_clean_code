import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:asiftaj_bloc_clean_code/data/exeptions/app_exeptions.dart';
import 'package:asiftaj_bloc_clean_code/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkServicesApi implements BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException("");
    } on TimeoutException {
      throw FetchDataException("Time out try again");
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: jsonEncode(data));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException("");
    } on TimeoutException {
      throw FetchDataException("Time out try again");
    }
    return responseJson;
  }

  @override
  Future<dynamic> putApi(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http.put(Uri.parse(url), body: jsonEncode(data));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException("");
    } on TimeoutException {
      throw FetchDataException("Time out try again");
    }
    return responseJson;
  }

  @override
  Future<dynamic> deleteApi(String url) async {
    dynamic responseJson;
    try {
      final response = await http.delete(Uri.parse(url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException("");
    } on TimeoutException {
      throw FetchDataException("Time out try again");
    }
    return responseJson;
  }
}

dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = jsonDecode(response.body);
      return responseJson;
    case 400:
      var responseJson = jsonDecode(response.body);
      return responseJson;
    case 404:
      var responseJson = jsonDecode(response.body);
      return responseJson;
    case 500:
      var responseJson = jsonDecode(response.body);
      return responseJson;
    default:
      throw FetchDataException("Something went wrong, please try again");
  }
}
