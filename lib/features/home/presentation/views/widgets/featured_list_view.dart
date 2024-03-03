import 'package:bookly/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

import '../../../domain/entites/book_entity.dart';

class FeatureBooksListView extends StatelessWidget {
  const  FeatureBooksListView({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          print('dsfghlkdngmf ${books[index].image}');
          return Padding(
          padding: const EdgeInsets.only(right: 8,left: 8),
          child: CustomBookImage(image: books[index].image??'',),
        );
        },
      ),
    );
  }
}
