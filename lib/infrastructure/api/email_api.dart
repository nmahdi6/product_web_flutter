import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class EmailApi {
  Future<bool> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  });
}

class EmailApiImpl implements EmailApi {
  final http.Client client;

  EmailApiImpl({required this.client});

  @override
  Future<bool> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    final Uri url = Uri.parse('http://orumazaranshams.com/send-email.php');

    final response = await client.post(
      url,
      body: jsonEncode(
        {
          'email': email,
          'name': name,
          'subject': subject,
          'message': message,
        },
      ),
    );

    final data = jsonDecode(response.body);
    return data['status'] == 'success';
  }
}
