import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/domain/entites/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_featured_use_case.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeaturedBookUseCase) : super(FeaturedBooksInitial());
  final FetchFeaturedBookUseCase fetchFeaturedBookUseCase;



  Future <void> fetchFeaturedBooks()async{
    emit(FeaturedBooksLoading());
  var result=await  fetchFeaturedBookUseCase.call();
  result.fold((failure) => {
    emit(FeaturedBooksFailure(errorMessage: failure.message))
  }, (books) => {

    print('asdflknmgfldknmsdfgv${books[0].title}'),
    emit(FeaturedBooksSuccess(books: books)),
    print('sadfglkbjnsdf ${books[0].image}')
  });
  }
}
