import 'package:bookly/features/home/presentation/views/widgets/books_details_sectioni.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
SliverFillRemaining(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Column(
      children: [
        const CustomBookDetailsAppBar(),
        BookDetailsSection(),
        Expanded(
          child: SizedBox(
            height: 50,
          ),
        ),
        SimilarBooksSection(),
        SizedBox(
          height: 40,
        ),
      ],
    ),
  ),
)
      ],
    );
  }
}
