import 'package:bookly/features/home/domain/entites/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manger/featured_books/featured_books_cubit.dart';
import 'featured_list_view.dart';

class FeatureBooksListViewBlocBuilder extends StatefulWidget {
  const FeatureBooksListViewBlocBuilder({
    super.key,
  });

  @override
  State<FeatureBooksListViewBlocBuilder> createState() => _FeatureBooksListViewBlocBuilderState();
}

class _FeatureBooksListViewBlocBuilderState extends State<FeatureBooksListViewBlocBuilder> {
  List<BookEntity>books=[];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
        listener: (context, state) {
          if(state is FeaturedBooksSuccess){
            books.addAll(state.books);
          }
        },
        builder: (context, state) {
      if (state is FeaturedBooksSuccess ||
          state is FeaturedBooksPaginationLoading) {
        return FeatureBooksListView(
          books: books,
        );
      } else if (state is FeaturedBooksFailure) {
        return Text(state.errorMessage);
      } else {
        return const CircularProgressIndicator();
      }
    });
  }
}
