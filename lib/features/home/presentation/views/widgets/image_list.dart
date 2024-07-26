import 'package:booklykian/features/home/data/models/books/books.dart';
import 'package:booklykian/features/home/presentation/views/book_details_view.dart';
import 'package:booklykian/features/home/presentation/views/widgets/image_container.dart';
import 'package:flutter/material.dart';

class ImageList extends StatelessWidget {
  const ImageList({super.key, required this.books});
  final List<Books> books;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.3,
      child: ListView.builder(
        itemCount: books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final book = books[index];
          return ImageContainer(
            book: book,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailsView(
                    book: book,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
