part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  final List<Object> properties;

  const AuthState(this.properties);

  @override
  List<Object> get props => [...properties];
}

class Uninitialized extends AuthState {
  Uninitialized() : super([]);

  @override
  String toString() => 'Uninitialized';
}

class Authenticated extends AuthState {
  final String displayName;

  Authenticated(this.displayName) : super([displayName]);

  @override
  String toString() => 'Authenticated { displayName: $displayName }';
}

class Unauthenticated extends AuthState {
  Unauthenticated() : super([]);

  @override
  String toString() => 'Unauthenticated';
}
