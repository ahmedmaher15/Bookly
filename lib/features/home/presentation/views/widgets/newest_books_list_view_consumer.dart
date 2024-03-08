import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/functions/fealuted_message_widget.dart';
import '../../../domain/entites/book_entity.dart';
import '../../manger/newest_books/newest_books_cubit.dart';
import 'newest_books_list_view.dart';

class NewestBooksListViewBlocConsumer extends StatefulWidget {
  const NewestBooksListViewBlocConsumer({
    super.key,
  });

  @override
  State<NewestBooksListViewBlocConsumer> createState() =>
      _NewestBooksListViewBlocConsumerState();
}

class _NewestBooksListViewBlocConsumerState
    extends State<NewestBooksListViewBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            (context, index) {
              return BlocConsumer<NewestBooksCubit, NewestBooksState>(
                  listener: (context, state) {
                    if (state is NewestBooksSuccess) {
                      books.addAll(state.books);
                    }
                    if (state is NewestBooksFailure) {
                      showSnackBar(context, state.errorMessage);
                    }
                  },
                  builder: (context, state) {
                    if (state is NewestBooksSuccess ||
                        state is NewestBooksPaginationLoading ||
                        state is NewestBooksPaginationFailure) {
                      return NewestBooksListView(
                        books: books,
                      );
                    } else if (state is NewestBooksFailure) {
                      return Text(state.errorMessage);
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                );
            },
            childCount: 1));
  }
}
