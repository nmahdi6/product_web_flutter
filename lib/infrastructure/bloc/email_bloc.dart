import 'dart:async';
import 'package:aerium/infrastructure/api/email_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'email_event.dart';
part 'email_state.dart';
part 'email_bloc.freezed.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  final EmailRepository _emailRepository;

  EmailBloc(this._emailRepository) : super(const EmailState.initial());

  @override
  Stream<EmailState> mapEventToState(EmailEvent event) async* {
    yield* event.map(
      sendEmail: (e) async* {
        yield const EmailState.sendingEmail(); // حالت در حال ارسال

        final response = await _emailRepository.sendEmail(
          name: e.name,
          email: e.email,
          subject: e.subject,
          message: e.message,
        );

        yield* response.fold(
          (failure) async* {
            yield const EmailState.failure(); // حالت خطا
          },
          (data) async* {
            yield const EmailState.emailSentSuccessFully(); // حالت ارسال موفق
          },
        );
      },
    );
  }
}
