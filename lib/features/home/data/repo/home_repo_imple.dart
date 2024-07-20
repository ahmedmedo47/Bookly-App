import 'package:booklykian/core/utils/api_service.dart';
import 'package:booklykian/features/home/data/models/books/books.dart';
import 'package:booklykian/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepoImple implements HomeRepo {
  final ApiService apiService;
  HomeRepoImple({required this.apiService});
  @override
  Future<Either<String, List<Books>>> getBestSellerBooks() async {
    try {
      List<Books> books = [];
      var response = await apiService.fetchBooks('volumes?Filtering=free-ebooks');
      for (var item in response['items']) {
        books.add(Books.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Books>>> getFeaturedBooks() async{
    try {
      List<Books> books = [];
      var response = await apiService.fetchBooks('volumes?q=computer%20science');
      for (var item in response['items']) {
        books.add(Books.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
