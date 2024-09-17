sealed class AppState {}

class LoadingState extends AppState {}

class ErrorState extends AppState {
  final String message;
  ErrorState(this.message);
}

class ReadyState extends AppState {}

class SucessState extends AppState {}