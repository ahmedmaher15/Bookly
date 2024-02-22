import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/domain/entites/book_entite.dart';
import 'package:bookly/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBookUseCase{
  final HomeRepo homeRepo;

  FetchFeaturedBookUseCase({required this.homeRepo});
  Future<Either<Failure,List<BookEntity>>> fetchFeaturedBooks(){
    return homeRepo.fetchFeaturedBooks();
  }
}