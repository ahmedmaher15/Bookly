import 'package:hive/hive.dart';
part 'book_entite.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String? bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final String? authorName;
  @HiveField(4)
  final num? price;
    @HiveField(5)
  final num? ratting;

  BookEntity(
      {this.bookId,
      this.image,
      this.title,
      this.authorName,
      this.price,
      this.ratting});
}
