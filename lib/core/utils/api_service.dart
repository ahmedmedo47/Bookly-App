import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  ApiService({required this.dio});
  final String baseUrl = 'https://www.googleapis.com/books/v1/';
  Future<Map <String, dynamic>> fetchBooks(String url) async {
    var response = await dio.get('$baseUrl$url');
    return response.data;
  }
}
