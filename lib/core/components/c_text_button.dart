import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks_cx/core/di/states/api_call_states.dart';

import '../di/notifiers/email_auth.dart';

class CustomApiCallButton extends ConsumerStatefulWidget {
  final VoidCallback onPressed;
  final Widget text;
  final NotifierProvider<EmailAuthNotifier, AsyncValue<void>> apiProvider;
  const CustomApiCallButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.apiProvider,
  });

  @override
  ConsumerState<CustomApiCallButton> createState() =>
      _CustomApiCallButtonState();
}

class _CustomApiCallButtonState extends ConsumerState<CustomApiCallButton> {
  @override
  Widget build(BuildContext context) {
    final apiNotifier = ref.watch(widget.apiProvider);
    return TextButton(
      onPressed: widget.onPressed,
      child: apiNotifier.when(
        data: (data) {
          return widget.text;
        },
        loading: () {
          return const CircularProgressIndicator();
        },
        error: (error, stackTrace) {
          return widget.text;
        },
      ),
    );
  }
}
