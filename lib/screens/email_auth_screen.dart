import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks_cx/core/components/c_text_button.dart';
import 'package:tasks_cx/core/components/c_text_field.dart';
import 'package:tasks_cx/core/di/di.dart';

class EmailAuthScreen extends ConsumerWidget {
  const EmailAuthScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final emailNotifier = ref.watch(emailAuthProvider);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Welcome to tasks.cx", style: TextStyle(fontSize: 30)),
          const Text("Log In"),
          const SizedBox(height: 20),
          CustomTextField(
            controller: emailController,
            hintText: 'Enter your email',
          ),
          CustomApiCallButton(
            onPressed: () => emailNotifier.isLoading
                ? null
                : ref
                    .read(emailAuthProvider.notifier)
                    .submitEmail(emailController.text),
            apiProvider: emailAuthProvider,
            text: emailNotifier.isLoading
                ? const CircularProgressIndicator()
                : const Text('Submit'),
          )
        ],
      ),
    );
  }
}
