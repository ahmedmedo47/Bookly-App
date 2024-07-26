import 'package:booklykian/features/home/data/models/books/books.dart';
import 'package:booklykian/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class BookViewModel with ChangeNotifier {
  final HomeRepo homeRepo;

  BookViewModel({required this.homeRepo});

  List<Books> _bestSellers = [];
  List<Books> get bestSellers => _bestSellers;

  List<Books> _featuredBooks = [];
  List<Books> get featuredBooks => _featuredBooks;

  List<Books> _newestBooks = [];
  List<Books> get newestBooks => _newestBooks;

  bool _isLoadingBestSellers = false;
  bool get isLoadingBestSellers => _isLoadingBestSellers;

  bool _isLoadingFeaturedBooks = false;
  bool get isLoadingFeaturedBooks => _isLoadingFeaturedBooks;

  bool _isLoadingNewestBooks = false;
  bool get isLoadingNewestBooks => _isLoadingNewestBooks;

  String _errorBestSellers = '';
  String get errorBestSellers => _errorBestSellers;

  String _errorFeaturedBooks = '';
  String get errorFeaturedBooks => _errorFeaturedBooks;

  String _errorNewestBooks = '';
  String get errorNewestBooks => _errorNewestBooks;

  Future<void> fetchBestSellers() async {
    await _fetchBooks(
      loaderSetter: (loading) => _isLoadingBestSellers = loading,
      errorSetter: (error) => _errorBestSellers = error,
      booksSetter: (books) => _bestSellers = books,
      fetchFunction: homeRepo.getBestSellerBooks,
    );
  }

  Future<void> fetchFeaturedBooks() async {
    await _fetchBooks(
      loaderSetter: (loading) => _isLoadingFeaturedBooks = loading,
      errorSetter: (error) => _errorFeaturedBooks = error,
      booksSetter: (books) => _featuredBooks = books,
      fetchFunction: homeRepo.getFeaturedBooks,
    );
  }

  Future<void> fetchNewestBooks() async {
    await _fetchBooks(
      loaderSetter: (loading) => _isLoadingNewestBooks = loading,
      errorSetter: (error) => _errorNewestBooks = error,
      booksSetter: (books) => _newestBooks = books,
      fetchFunction: homeRepo.getNewestBooks,
    );
  }

  Future<void> _fetchBooks({
    required Function(bool) loaderSetter,
    required Function(String) errorSetter,
    required Function(List<Books>) booksSetter,
    required Future<Either<String, List<Books>>> Function() fetchFunction,
  }) async {
    loaderSetter(true);
    notifyListeners();

    final result = await fetchFunction();
    result.fold(
      (error) {
        errorSetter(error);
      },
      (books) {
        booksSetter(books);
      },
    );

    loaderSetter(false);
    notifyListeners();
  }

  Future<void> initialFetch() async {
    await fetchBestSellers();
    await fetchFeaturedBooks();
    await fetchNewestBooks();
  }
}
