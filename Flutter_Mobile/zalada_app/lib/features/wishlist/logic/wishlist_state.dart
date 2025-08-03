


abstract class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}

final class FavouriteLoading extends FavouriteState {}

final class FavouriteLoaded extends FavouriteState {}
final class FavouriteProductDeleted extends FavouriteState {}
final class FavouriteProductCartEmpty extends FavouriteState {}

final class FavouriteError extends FavouriteState {
  final String message;

  FavouriteError(this.message);
}