import 'package:booklykian/features/home/data/models/books/books.dart';
import 'package:booklykian/features/home/presentation/view_models/book_view_model.dart';
import 'package:booklykian/features/home/presentation/views/widgets/image_container.dart';
import 'package:booklykian/features/home/presentation/views/widgets/rating.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/custom_bottom.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, this.book});
  final Books? book;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff100B20),
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: height * 0.1),
              child: ImageContainer(
                heroTag: book!.id.toString(),
                book: book,
                onTap: () {},
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                book!.volumeInfo!.title!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              book!.volumeInfo!.authors![0],
              style: const TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 10),
            const Rating(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38.0),
              child: Row(
                children: [
                  Expanded(
                    child: CustomBottom(
                      text:
                          '${book!.volumeInfo!.pageCount.toString()} \u{20AC}',
                      textColor: Colors.black,
                      backgroundColor: Colors.white,
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: CustomBottom(
                      text: 'Free Preview',
                      textColor: Colors.white,
                      backgroundColor: Color(0xFFEF8262),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'You can also like',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Consumer<BookViewModel>(
              builder: (context, bookViewModel, child) {
                return SizedBox(
                height: height * 0.2,
                child: ListView.builder(
                  itemCount:bookViewModel.featuredBooks.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final relatedBook = bookViewModel.featuredBooks[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ImageContainer(
                        heroTag: relatedBook.id.toString(),
                        book: relatedBook,
                        onTap: () {},
                      ),
                    );
                  },
                ),
              );
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
