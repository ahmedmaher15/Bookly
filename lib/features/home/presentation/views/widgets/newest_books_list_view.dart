import 'package:bookly/features/home/domain/entites/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';

class NewestBooksListView extends StatefulWidget {
  const NewestBooksListView({super.key, required this.books});
  final List<BookEntity>books;

  @override
  State<NewestBooksListView> createState() => _NewestBooksListViewState();
}

class _NewestBooksListViewState extends State<NewestBooksListView> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      itemCount: widget.books.length,
      itemBuilder: (context, index) =>  Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: BookListViewItem(books:widget.books[index],),
      ),
    );
  }
}
