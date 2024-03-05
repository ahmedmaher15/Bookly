import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/functions/save_books.dart';
import 'package:bookly/features/home/domain/entites/book_entity.dart';

import '../models/book_model/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();

  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
        'volumes?Filtering=free-ebooks&q=programming');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kFeaturedBox);
    print('sdfasdoknf${data['items'][0]['volumeInfo']['imageLinks']['thumbnail']}');
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=programming&Sorting=newest');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kNewestBox);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
      print('asdgfsdfagsdf${BookModel.fromJson(bookMap).id}');
    }
    print('asdgfsdfagsdf${books[0].title}');
    return books;
  }
}
