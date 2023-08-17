import 'package:flutter/material.dart';
import 'package:tasks_cx/core/components/c_text_button.dart';
import 'package:tasks_cx/core/components/c_text_field.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _otpController = TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Verify your email"),
          CustomTextField(
            controller: _otpController,
            hintText: 'Enter your OTP',
          ),
          // CustomTextButton(

          //   text: const Text('Submit'),
          // ),
        ],
      ),
    );
  }
}
