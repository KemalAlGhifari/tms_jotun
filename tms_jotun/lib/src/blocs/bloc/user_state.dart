part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class DataUser extends UserState {
  final Login loginModel;

  const DataUser(this.loginModel);

  @override
  List<Object> get props => [loginModel];
}
