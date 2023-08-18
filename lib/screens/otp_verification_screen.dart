import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks_cx/core/components/c_text_button.dart';
import 'package:tasks_cx/core/components/c_text_field.dart';
import 'package:tasks_cx/core/di/riverpod_di.dart';
import 'package:tasks_cx/screens/all_projects_screen.dart';

class OtpVerificationScreen extends ConsumerWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController otpController = TextEditingController();
    final otpVerificationNotifier = ref.watch(otpVerificationProvider);

    ref.listen(otpVerificationProvider, (previous, next) {
      if (next is AsyncData) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const AllProjectsScreen(),
          ),
        );
      }
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Verify your email"),
          CustomTextField(
            controller: otpController,
            hintText: 'Enter your OTP',
            errorText: otpVerificationNotifier.hasError
                ? otpVerificationNotifier.error.toString()
                : null,
          ),
          CustomApiCallButton(
            apiNotifier: otpVerificationProvider,
            onLoading: null,
            onData: () => ref
                .read(otpVerificationProvider.notifier)
                .verifyOtp(otpController.text),
            onError: () => ref
                .read(otpVerificationProvider.notifier)
                .verifyOtp(otpController.text),
            text: ref.watch(otpVerificationProvider).isLoading
                ? const CircularProgressIndicator()
                : const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
