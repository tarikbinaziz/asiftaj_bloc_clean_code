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


// With dio 

// class NetworkServicesApi implements BaseApiServices {
//   final Dio _dio = Dio(
//     BaseOptions(
//       connectTimeout: const Duration(seconds: 10),
//       receiveTimeout: const Duration(seconds: 15),
//       sendTimeout: const Duration(seconds: 10),
//       headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//     ),
//   );

//   @override
//   Future<dynamic> getApi(String url) async {
//     try {
//       final response = await _dio.get(url);
//       return _handleResponse(response);
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     } on SocketException {
//       throw NoInternetException("No Internet connection");
//     }
//   }

//   @override
//   Future<dynamic> postApi(String url, dynamic data) async {
//     try {
//       final response = await _dio.post(url, data: data);
//       return _handleResponse(response);
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     } on SocketException {
//       throw NoInternetException("No Internet connection");
//     }
//   }

//   @override
//   Future<dynamic> putApi(String url, dynamic data) async {
//     try {
//       final response = await _dio.put(url, data: data);
//       return _handleResponse(response);
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     } on SocketException {
//       throw NoInternetException("No Internet connection");
//     }
//   }

//   @override
//   Future<dynamic> deleteApi(String url) async {
//     try {
//       final response = await _dio.delete(url);
//       return _handleResponse(response);
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     } on SocketException {
//       throw NoInternetException("No Internet connection");
//     }
//   }

//   /// Handle successful response
//   dynamic _handleResponse(Response response) {
//     if (response.statusCode != null &&
//         response.statusCode! >= 200 &&
//         response.statusCode! < 300) {
//       return response.data;
//     } else {
//       throw FetchDataException(
//           "Unexpected status code: ${response.statusCode}");
//     }
//   }

//   /// Map Dio errors to custom App Exceptions
//   AppException _handleDioError(DioException error) {
//     switch (error.type) {
//       case DioExceptionType.connectionTimeout:
//       case DioExceptionType.sendTimeout:
//       case DioExceptionType.receiveTimeout:
//         return FetchDataException("Request timeout, please try again");

//       case DioExceptionType.badResponse:
//         final statusCode = error.response?.statusCode;
//         final message = error.response?.data?['message'] ??
//             "Something went wrong (${error.response?.statusCode})";

//         if (statusCode == 400) {
//           return BadRequestException(message);
//         } else if (statusCode == 401 || statusCode == 403) {
//           return UnauthorisedException(message);
//         } else if (statusCode == 404) {
//           return NotFoundException(message);
//         } else if (statusCode == 500) {
//           return InternalServerException(message);
//         }
//         return FetchDataException(message);

//       case DioExceptionType.cancel:
//         return FetchDataException("Request cancelled");

//       case DioExceptionType.unknown:
//         if (error.error is SocketException) {
//           return NoInternetException("No Internet connection");
//         }
//         return FetchDataException("Unexpected error occurred");

//       default:
//         return FetchDataException("Something went wrong");
//     }
//   }
// }
