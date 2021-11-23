import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';

// Request type
enum RequestType { post, get }

// Convert response in result [Success] and [Error]
class Result<T> {
  Result._();

  factory Result.success(T value) = Success<T>;

  factory Result.error(T message) = Error<T>;
}

class Error<T> extends Result<T> {
  Error(this.message) : super._();
  final T message;
}

class Success<T> extends Result<T> {
  Success(this.value) : super._();
  final T value;
}

// Request type not found exception
class RequestTypeNotFoundException implements Exception {
  String cause;
  RequestTypeNotFoundException(this.cause);
}

class HttpService {
  final Client _instance;

  String _baseUrl = 'jsonplaceholder.typicode.com';

  HttpService() : _instance = Client();

  Future<Result> request({
    required RequestType? requestType,
    required String? path,
    dynamic parameter,
  }) async {
    print('$_baseUrl/$path : $parameter');
    Uri uri = Uri.https(_baseUrl, path!);

    try {
      switch (requestType) {

        // Send a POST request with the given parameter.
        case RequestType.post:
          final Response response = await _instance.post(uri, body: parameter);

          log('${response.statusCode} ${response.request} : ${response.body}');

          if (response.statusCode == 200) {
            Result result = Result.success(json.decode(response.body));
            return result;
          } else {
            return Result.error(_exception);
          }

        // Send a GET request with the given parameter.
        case RequestType.get:
          final Response response = await _instance.get(uri);
          log('${response.request} --> ${response.body}');

          if (response.statusCode == 200) {
            Result result = Result.success(json.decode(response.body));
            return result;
          } else {
            return Result.error(_exception);
          }

        default:
          return throw RequestTypeNotFoundException(
              _requestTypeNotFoundException);
      }
    } on SocketException {
      return Result.error(_socketException);
    } on FormatException {
      return Result.error(_formatException);
    } on HttpException {
      return Result.error(_httpException);
    } catch (e) {
      return Result.error(_exception);
    }
  }

  // Exception messages
  String _exception = 'Something went wrong! Please try again in a moment!';

  String _socketException =
      'Unable to reach the internet! Please try again in a moment.';

  String _formatException = 'Invalid Request';

  String _httpException =
      'Invalid data received from the server! Please try again in a moment.';

  String _requestTypeNotFoundException =
      'The HTTP request mentioned is not found';
}
