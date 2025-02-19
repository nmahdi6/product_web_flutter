part of 'email_bloc.dart';

abstract class EmailEvent extends Equatable {
  const EmailEvent();
  @override
  List<Object> get props => [];
}

class SendEmail extends EmailEvent {
  final String name;
  final String email;
  final String subject;
  final String message;

  const SendEmail({
    required this.name,
    required this.email,
    required this.subject,
    required this.message,
  });

  @override
  List<Object> get props => [name, email, subject, message];
}
