import 'package:flutter/material.dart';
import 'best_tile.dart';
import 'package:booklykian/features/home/data/models/books/books.dart';

class BestTileListView extends StatelessWidget {
  final List<Books> books;

  const BestTileListView({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return BestTile(book: book, relatedBooks: books);
      },
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
