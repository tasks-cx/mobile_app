import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpVerificationNotifier extends Notifier<AsyncValue<void>> {
  @override
  AsyncValue<void> build() {
    return const AsyncValue.data(null);
  }

  void verifyOtp(String otp) async {
    state = const AsyncValue.loading();
    // TODO: Change the logic to verify otp API call
    final response = await Future.delayed(const Duration(seconds: 2)).then(
      (_) => otp.trim() == "1234" ? 'success' : 'error',
    );
    if (response == 'error') {
      state =
          AsyncValue.error("Error: Verification failed!", StackTrace.current);
    } else {
      state = const AsyncValue.data(null);
    }
  }
}
