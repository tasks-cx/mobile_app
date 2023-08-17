import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomApiCallButton extends ConsumerStatefulWidget {
  // final VoidCallback? onPressed;
  final Widget text;
  final NotifierProvider<dynamic, AsyncValue<void>> apiNotifier;
  final VoidCallback? onLoading;
  final VoidCallback? onError;
  final VoidCallback? onData;
  const CustomApiCallButton({
    super.key,
    required this.text,
    required this.apiNotifier,
    required this.onData,
    required this.onError,
    required this.onLoading,
  });

  @override
  ConsumerState<CustomApiCallButton> createState() =>
      _CustomApiCallButtonState();
}

class _CustomApiCallButtonState extends ConsumerState<CustomApiCallButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: ref.watch(widget.apiNotifier).isLoading
          ? widget.onLoading
          : widget.onData,
      child: ref.watch(widget.apiNotifier).when(
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
