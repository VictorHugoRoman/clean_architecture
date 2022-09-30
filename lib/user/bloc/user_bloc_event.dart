part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();
}

class OnSignIn extends UserEvent {
  final String email;
  final String password;
  const OnSignIn({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
