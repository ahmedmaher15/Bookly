import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manger/newest_books/newest_books_cubit.dart';
import 'best_seller_list_view.dart';

class NewestBooksListViewBlocConsumer extends StatelessWidget {
  const NewestBooksListViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            (context, index) =>
                BlocConsumer<NewestBooksCubit, NewestBooksState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is NewestBooksSuccess) {
                      return NewestBooksListView(
                        bookEntity: state.books,
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
            childCount: 1));
  }
}
