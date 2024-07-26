import 'package:booklykian/features/home/data/models/books/books.dart';
import 'package:booklykian/features/home/presentation/views/book_details_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BestTile extends StatelessWidget {
  const BestTile({super.key, required this.book, required this.relatedBooks});
  final Books book;
  final List<Books> relatedBooks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  BookDetailsView(book: book),
            ),
          );
        },
        child: Row(
          children: [
            Image.network(
              book.volumeInfo!.imageLinks!.thumbnail!,
              height: 120,
            ),
            const SizedBox(width: 30),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      book.volumeInfo!.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    book.volumeInfo!.authors![0],
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${book.volumeInfo!.pageCount.toString()} \u{20AC}',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 24,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            book.volumeInfo!.pageCount.toString(),
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '(${book.volumeInfo!.pageCount.toString()})',
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
