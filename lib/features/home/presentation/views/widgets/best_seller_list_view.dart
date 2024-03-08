import 'package:bookly/features/home/domain/entites/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key, required this.bookEntity});
  final List<BookEntity>bookEntity;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      itemCount: bookEntity.length,
      itemBuilder: (context, index) =>  Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: BookListViewItem(bookEntity:bookEntity[index],),
      ),
    );
  }
}
