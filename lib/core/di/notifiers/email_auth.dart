import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class EmailAuthNotifier extends Notifier<AsyncValue<void>> {
  EmailAuthNotifier();
  @override
  AsyncValue<void> build() {
    return const AsyncValue.data(null);
  }

  void submitEmail(String email) async {
    state = const AsyncValue.loading();

    final emailRegex = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (!emailRegex) {
      state = AsyncValue.error("Invalid email", StackTrace.current);
    } else {
      // TODO: Change the logic to send email for auth
      final response = await http.post(
        Uri.parse("http://localhost:8050/auth/token"),
        headers: {
          'content-type': 'application/json',
        },
        body: json.encode({
          'email': email,
        }),
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        state = const AsyncValue.data(null);
      } else {
        // TODO: setup local user data.
        state = AsyncValue.error("error", StackTrace.current);
      }
    }
  }
}
