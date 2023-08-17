import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notifiers/email_auth.dart';
import 'notifiers/otp_verification_notifier.dart';

final emailAuthProvider = NotifierProvider<EmailAuthNotifier, AsyncValue<void>>(
  EmailAuthNotifier.new,
  name: 'emailAuthProvider',
);

final otpVerificationProvider =
    NotifierProvider<OtpVerificationNotifier, AsyncValue<void>>(
  OtpVerificationNotifier.new,
  name: 'otpVerificationProvider',
);
