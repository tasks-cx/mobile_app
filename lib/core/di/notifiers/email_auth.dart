import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      final response = await Future.delayed(const Duration(seconds: 2)).then(
        (value) => 'success',
      );
      if (response == 'error') {
        state = AsyncValue.error("error", StackTrace.current);
      } else {
        // TODO: setup local user data.
        state = const AsyncValue.data(null);
      }
    }
  }
}
