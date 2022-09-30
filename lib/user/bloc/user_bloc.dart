import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';
import 'package:clean_architecture/user/repository/i_auth_api.dart';
import 'package:clean_architecture/enums.dart';

part 'user_bloc_event.dart';
part 'user_bloc_state.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  final IAuthApi _authRepository;
  UserBloc(this._authRepository) : super(UserState.initial()) {
    on<OnSignIn>((event, emit) async {
      emit(state.copyWith(status: StatusProcess.loading));
      try {
        await Future.delayed(const Duration(seconds: 5));
        final isLogged = await _authRepository.login(event.email, event.password);
        emit(state.copyWith(status: StatusProcess.loaded, token: isLogged));
      } catch (e) {
        emit(state.copyWith(status: StatusProcess.failure, token: 'error!'));
      }
    });
  }
}
