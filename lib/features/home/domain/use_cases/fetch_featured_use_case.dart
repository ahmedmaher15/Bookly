import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_cases/use_case.dart';
import 'package:bookly/features/home/domain/entites/book_entite.dart';
import 'package:bookly/features/home/domain/repo/home_repo.dart';
 import 'package:dartz/dartz.dart';

class FetchFeaturedBookUseCase extends UseCase<List<BookEntity>, NoParam> {
  final HomeRepo homeRepo;

  FetchFeaturedBookUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
