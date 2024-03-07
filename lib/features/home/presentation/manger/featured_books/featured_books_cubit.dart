import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/domain/entites/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_featured_use_case.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeaturedBookUseCase)
      : super(FeaturedBooksInitial());
  final FetchFeaturedBookUseCase fetchFeaturedBookUseCase;

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    var result = await fetchFeaturedBookUseCase.call(pageNumber);
    result.fold(
        (failure) => {
              if (pageNumber == 0)
                {emit(FeaturedBooksFailure(errorMessage: failure.message))}
              else
                {
                  emit(FeaturedBooksPaginationFailure(errorMessage: failure.message))
                }
            },
        (books) => {
              emit(FeaturedBooksSuccess(books: books)),
            });
  }
}
