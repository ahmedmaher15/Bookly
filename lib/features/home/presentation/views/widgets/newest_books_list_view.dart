import 'package:bookly/features/home/domain/entites/book_entity.dart';
import 'package:bookly/features/home/presentation/manger/newest_books/newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatefulWidget {
  const NewestBooksListView({super.key, required this.books});
  final List<BookEntity>books;

  @override
  State<NewestBooksListView> createState() => _NewestBooksListViewState();
}

class _NewestBooksListViewState extends State<NewestBooksListView> {
  late final ScrollController _scrollController;
  var nextPage = 1;
  var isLoading=false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    print('sadflml;sdfkma');
  }

  void _scrollListener() async{
    print('sadflml;s');
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    var currentPosition = _scrollController.position.pixels;

    if (currentPosition >= 0.7 * maxScrollLength) {
      if(!isLoading){
        isLoading=true;
        await  BlocProvider.of<NewestBooksCubit>(context)
            .fetchNewestBooks(pageNumber: nextPage++);
        isLoading=false;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      itemCount: widget.books.length,
      itemBuilder: (context, index) =>  Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: BookListViewItem(bookEntity:widget.books[index],),
      ),
    );
  }
}
