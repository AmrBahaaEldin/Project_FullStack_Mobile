// import 'package:bloc/bloc.dart';
// import 'package:book_store/features/home/data/models/book_model/book_model.dart';
// import 'package:book_store/features/home/data/repos/home_repo.dart';
// import 'package:equatable/equatable.dart';
//
// part 'feature_books_state.dart';
//
// class FeatureBooksCubit extends Cubit<FeatureBooksState> {
//   FeatureBooksCubit(this.homeRepo) : super(FeatureBooksInitial());
//   final HomeRepo homeRepo;
//   Future<void> fetchFeatureBooks() async {
//     emit(FeatureBooksLoading());
//     final result = await homeRepo.fetchFeatureBooks();
//     result.fold((failure) {
//       emit(FeatureBooksFailure(messageError: failure.errorMessage));
//     }, (books) {
//       emit(FeatureBooksLoaded(bookLoadModel: books));
//     });
//   }
// }
