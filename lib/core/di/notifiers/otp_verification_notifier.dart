import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class OtpVerificationNotifier extends Notifier<AsyncValue<void>> {
  @override
  AsyncValue<void> build() {
    return const AsyncValue.data(null);
  }

  void verifyOtp(String otp, String email) async {
    state = const AsyncValue.loading();
    // TODO: Change the logic to verify otp API call
    final response = await http.post(
      Uri.parse("http://localhost:8050/auth/token"),
      headers: {
        'content-type': 'application/json',
      },
      body: json.encode(
          {'token': otp.trim(), 'email': email.trim(), 'username': 'ggs'}),
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      state = const AsyncValue.data(null);
    } else {
      // TODO: setup local user data.
      state = AsyncValue.error("error", StackTrace.current);
    }
  }
}
