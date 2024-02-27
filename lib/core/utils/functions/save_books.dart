import 'package:bookly/features/home/domain/entites/book_entity.dart';
import 'package:hive/hive.dart';

void saveBooksData(List<BookEntity> books,String booksName) {
  var box=Hive.box(booksName);
  box.addAll(books);
}