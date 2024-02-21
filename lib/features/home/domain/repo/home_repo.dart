import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/domain/entites/book_entite.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<BookEntity>>> fetchFeaturedBooks();
  Future<Either<Failure,List<BookEntity>>> fetchNewestBooks();
}