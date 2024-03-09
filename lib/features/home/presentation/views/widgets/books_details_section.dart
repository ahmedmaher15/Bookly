import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/domain/entites/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_action.dart';
import 'package:flutter/material.dart';

import 'custom_book_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookData});

  final BookEntity bookData;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * .2,
          ),
          child: CustomBookImage(
            image: bookData.image ?? '',
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          bookData.title ?? 'The Jungle Book',
          style: Styles.textStyle25.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            bookData.authorName ?? 'Rudyard Kipling',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          ratting: bookData.rating != null ? '${bookData.rating}' : '5',
        ),
        const SizedBox(
          height: 37,
        ),
        BooksAction(
          price: bookData.price != null ? '${bookData.price}' : '0',
        ),
      ],
    );
  }
}
