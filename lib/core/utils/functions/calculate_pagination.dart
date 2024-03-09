import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/home/presentation/manger/newest_books/newest_books_cubit.dart';

void scrollListener({required ScrollController scrollController,required BuildContext context}) async {
  var nextPage = 1;
  var isLoading = false;
  var maxScrollLength = scrollController.position.maxScrollExtent;
  var currentPosition = scrollController.position.pixels;

  if (currentPosition >= 0.8 * maxScrollLength) {
    if (!isLoading) {
      isLoading = true;
      await BlocProvider.of<NewestBooksCubit>(context)
          .fetchNewestBooks(pageNumber: nextPage++);
      isLoading = false;
    }
  }
}