import 'package:bookly/features/home/domain/entites/book_entite.dart';

abstract class HomeRepo{
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}