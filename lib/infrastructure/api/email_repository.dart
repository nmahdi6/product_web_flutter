import 'package:aerium/infrastructure/api/email_api.dart';

abstract class EmailRepository {
  Future<bool> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  });
}

class EmailRepositoryImpl implements EmailRepository {
  final EmailApi emailApi;

  EmailRepositoryImpl({required this.emailApi});

  @override
  Future<bool> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) {
    return emailApi.sendEmail(
      name: name,
      email: email,
      subject: subject,
      message: message,
    );
  }
}
