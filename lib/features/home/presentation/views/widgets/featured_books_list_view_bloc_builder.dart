import 'package:bookly/features/home/domain/entites/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/functions/fealuted_message_widget.dart';
import '../../manger/featured_books/featured_books_cubit.dart';
import 'featured_list_view.dart';

class FeatureBooksListViewBlocConsumer extends StatefulWidget {
  const FeatureBooksListViewBlocConsumer({
    super.key,
  });

  @override
  State<FeatureBooksListViewBlocConsumer> createState() =>
      _FeatureBooksListViewBlocConsumerState();
}

class _FeatureBooksListViewBlocConsumerState
    extends State<FeatureBooksListViewBlocConsumer> {
  List<BookEntity> books = [];



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
        listener: (context, state) {
      if (state is FeaturedBooksSuccess) {

        books.addAll(state.books);
      }
      if (state is FeaturedBooksPaginationFailure) {
        showSnackBar(context, state.errorMessage);
      }
    }, builder: (context, state) {
      if (state is FeaturedBooksSuccess ||
          state is FeaturedBooksPaginationLoading ||
          state is FeaturedBooksPaginationFailure) {
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
