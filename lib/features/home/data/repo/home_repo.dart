import 'package:booklykian/features/home/data/models/books/books.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<String, List<Books>>> getBestSellerBooks();
  Future<Either<String, List<Books>>> getFeaturedBooks();
  Future<Either<String, List<Books>>> getNewestBooks();
}
