import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/domain/entites/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_news_books_use_case.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewestBooksLoading());
    } else {
      emit(NewestBooksPaginationLoading());
    }
    var result = await fetchNewestBooksUseCase.call(pageNumber);
    result.fold(
        (failure) => {
              if (pageNumber == 0)
                {
                  emit(
                    NewestBooksFailure(errorMessage: failure.toString()),
                  )
                }
              else
                {
                  emit(
                    NewestBooksPaginationFailure(
                        errorMessage: failure.toString()),
                  )
                }
            },
        (books) => {emit(NewestBooksSuccess(books: books))});
  }
}
