part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class UpdateUser extends UserEvent {
  final Login userModel;
  final VoidCallback? callback;

  const UpdateUser(this.userModel, {this.callback});

  @override
  List<Object> get props => [userModel];
}

class ClearUser extends UserEvent {
  final Login userModel;
  final VoidCallback? callback;

  const ClearUser(this.userModel, {this.callback});

  @override
  List<Object> get props => [userModel];
}

