import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aerium/infrastructure/api/email_repository.dart';
import 'package:equatable/equatable.dart';

part 'email_event.dart';
part 'email_state.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  final EmailRepository emailRepository;

  EmailBloc({required this.emailRepository}) : super(EmailInitial()) {
    on<SendEmail>((event, emit) async {
      emit(EmailSending());
      try {
        final success = await emailRepository.sendEmail(
          name: event.name,
          email: event.email,
          subject: event.subject,
          message: event.message,
        );
        if (success) {
          emit(EmailSentSuccessfully());
        } else {
          emit(EmailSendFailure(error: "Failed to send email"));
        }
      } catch (e) {
        emit(EmailSendFailure(error: e.toString()));
      }
    });
  }
}
