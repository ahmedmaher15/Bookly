import 'package:bookly/features/home/presentation/manger/featured_books/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entites/book_entity.dart';

class FeatureBooksListView extends StatefulWidget {
  const FeatureBooksListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<FeatureBooksListView> createState() => _FeatureBooksListViewState();
}

class _FeatureBooksListViewState extends State<FeatureBooksListView> {
 late final ScrollController _scrollController;

  @override
  void initState() {

    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    var maxScrollLength=_scrollController.position.maxScrollExtent;
    var currentPosition = _scrollController.position.pixels;
    if (currentPosition >= 0.7 * maxScrollLength) {
      BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
    }
  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8, left: 8),
            child: CustomBookImage(
              image: widget.books[index].image ?? '',
            ),
          );
        },
      ),
    );
  }
}
