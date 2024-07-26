import 'package:booklykian/core/errors/server_error.dart';
import 'package:booklykian/core/utils/api_service.dart';
import 'package:booklykian/features/home/data/models/books/books.dart';
import 'package:booklykian/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImple implements HomeRepo {
  final ApiService apiService;
  HomeRepoImple({required this.apiService});
  @override
  Future<Either<String, List<Books>>> getBestSellerBooks() async {
    try {
      List<Books> books = [];
      var response = await apiService.fetchBooks(
          url: 'volumes?Filtering=free-ebooks&q=programming');

      for (var item in response['items']) {
        books.add(Books.fromJson(item));
      }
      return Right(books);
    } on DioException catch (dioError) {
      return Left(ServerError.fromDioError(dioError).message);
    } catch (e) {
      return Left('Unexpected error: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, List<Books>>> getFeaturedBooks() async {
    try {
      List<Books> books = [];
      var response = await apiService.fetchBooks(
          url:
              'volumes?Filtering=free-ebooks&q=subject:programming&Sorting=relevance');
      for (var item in response['items']) {
        books.add(Books.fromJson(item));
      }
      return Right(books);
    } on DioException catch (dioError) {
      return Left(ServerError.fromDioError(dioError).message);
    } catch (e) {
      return Left('Unexpected error: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, List<Books>>> getNewestBooks() async {
    try {
      List<Books> books = [];
      var response = await apiService.fetchBooks(
          url:
              'volumes?Filtering=free-ebooks&q=computer science&Sorting=newest');
      for (var item in response['items']) {
        books.add(Books.fromJson(item));
      }
      return Right(books);
    } on DioException catch (dioError) {
      return Left(ServerError.fromDioError(dioError).message);
    } catch (e) {
      return Left('Unexpected error: ${e.toString()}');
    }
  }
}
