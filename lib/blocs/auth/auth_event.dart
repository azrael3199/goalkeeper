part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  final List<Object> properties;

  const AuthEvent(this.properties);

  @override
  List<Object> get props => [...properties];
}

class AppStarted extends AuthEvent {
  AppStarted() : super([]);

  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthEvent {
  LoggedIn() : super([]);

  @override
  String toString() => 'LoggedIn';
}

class LoggedOut extends AuthEvent {
  LoggedOut() : super([]);

  @override
  String toString() => 'LoggedOut';
}
