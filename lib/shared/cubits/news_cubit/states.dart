abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsBottomNavigationbarState extends NewsState {}

class NewsReloadState extends NewsState {}

class NewsGetBusinessSuccessState extends NewsState {}

class NewsGetBusinessErrorState extends NewsState {
  final String error;
  NewsGetBusinessErrorState(this.error);
}
