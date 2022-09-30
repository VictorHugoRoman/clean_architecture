part of 'user_bloc.dart';

@immutable
class UserState extends Equatable {
  final StatusProcess status;
  final String token;

  const UserState({required this.status, required this.token});

  factory UserState.initial() => const UserState(status: StatusProcess.initial, token: '');

  UserState copyWith({StatusProcess? status, String? token}) =>
      UserState(status: status ?? this.status, token: token ?? this.token);

  @override
  List<Object> get props => [status, token];
}
