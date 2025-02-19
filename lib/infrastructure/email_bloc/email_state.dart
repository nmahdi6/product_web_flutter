part of 'email_bloc.dart';

abstract class EmailState extends Equatable {
  const EmailState();
  @override
  List<Object> get props => [];
}

class EmailInitial extends EmailState {}

class EmailSending extends EmailState {}

class EmailSentSuccessfully extends EmailState {}

class EmailSendFailure extends EmailState {
  final String error;
  const EmailSendFailure({required this.error});

  @override
  List<Object> get props => [error];
}
