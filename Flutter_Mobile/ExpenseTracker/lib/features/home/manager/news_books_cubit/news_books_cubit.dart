// import 'package:bloc/bloc.dart';
// import 'package:book_store/features/home/data/models/book_model/book_model.dart';
// import 'package:book_store/features/home/data/repos/home_repo.dart';
// import 'package:equatable/equatable.dart';
//
// part 'news_books_state.dart';
//
// class NewsBooksCubit extends Cubit<NewsBooksState> {
//   NewsBooksCubit(this.homeRepo) : super(NewsBooksInitial());
//   final HomeRepo homeRepo;
//   Future<void> fetchNewsBooks() async {
//     emit(NewsBooksLoading());
//     final result = await homeRepo.fetchBestSellerBooks();
//     result.fold(
//       (failure) {
//         emit(NewsBooksFailure(messageError: failure.errorMessage));
//       },
//       (bookModel) {
//         emit(NewsBooksLoaded(bookModel: bookModel));
//       },
//     );
//   }
// }
