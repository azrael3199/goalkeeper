import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:goalkeeper/utils/user_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository _userRepository;

  AuthBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(Uninitialized()) {
    on<AppStarted>((event, emit) => emit(_onAppStarted()));
    on<LoggedIn>((event, emit) => emit(_onLoggedIn()));
    on<LoggedOut>((event, emit) => emit(_onLoggedOut()));
  }

  _onAppStarted() async {
    try {
      final isSignedIn = _userRepository.isSignedIn();
      if (isSignedIn) {
        final name = _userRepository.getUser();
        Authenticated(name);
      } else {
        Unauthenticated();
      }
    } catch (_) {
      Unauthenticated();
    }
  }

  _onLoggedIn() async {
    Authenticated(_userRepository.getUser());
  }

  _onLoggedOut() async* {
    yield Unauthenticated();
    _userRepository.signOut();
  }
}
