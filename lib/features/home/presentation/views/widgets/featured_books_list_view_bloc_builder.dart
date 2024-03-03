import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manger/featured_books/featured_books_cubit.dart';
import 'featured_list_view.dart';

class FeatureBooksListViewBlocBuilder extends StatelessWidget {
  const FeatureBooksListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit,FeaturedBooksState>(

        builder: (context,state) {
          if (state is FeaturedBooksSuccess) {
            print('sdlf;knmsdf ${state.books.length}');
            print('sdlf;knmsdf ${state.books[0].image}');
            return  FeatureBooksListView(books: state.books,);
          }else if(state is FeaturedBooksFailure){
            return Text(state.errorMessage);
          }else{
            return const CircularProgressIndicator();
          }
        }
    );
  }
}

