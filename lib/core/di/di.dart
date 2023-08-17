import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notifiers/email_auth.dart';

final emailAuthProvider = NotifierProvider<EmailAuthNotifier, AsyncValue<void>>(
  EmailAuthNotifier.new,
  name: 'emailAuthProvider',
);
