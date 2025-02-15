import 'package:aerium/infrastructure/api/email_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:aerium/infrastructure/failures/email_failure.dart';

part 'email_event.dart';
part 'email_state.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  final EmailRepository emailRepository;

  EmailBloc({required this.emailRepository}) : super(EmailInitial());

  @override
  Stream<EmailState> mapEventToState(EmailEvent event) async* {
    if (event is SendEmail) {
      yield EmailSending();
      try {
        final result = await emailRepository.sendEmail(
          name: event.name,
          email: event.email,
          subject: event.subject,
          message: event.message,
        );

        yield* result.fold(
          (failure) async* {
            yield EmailSendFailure(error: failure.toString());
          },
          (email) async* {
            yield EmailSentSuccessfully();
          },
        );
      } catch (e) {
        yield EmailSendFailure(error: e.toString());
      }
    }
  }
}
