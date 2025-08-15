import 'dart:async';
import 'dart:js' as js;

/// Chờ grecaptcha load
Future<void> waitForGrecaptcha() async {
  while (js.context['grecaptcha'] == null) {
    await Future.delayed(const Duration(milliseconds: 50));
  }
}

/// Lấy token reCAPTCHA trên Web
Future<String?> getRecaptchaToken() async {
  await waitForGrecaptcha();
  final completer = Completer<String?>();

  final grecaptcha = js.context['grecaptcha'];

  grecaptcha.callMethod('ready', [
    js.allowInterop(() {
      grecaptcha.callMethod('execute', [
        '6Lf2NKYrAAAAAAIOn5T0JJl9FPtIs1I6pED5GhwE',
        js.JsObject.jsify({'action': 'submit'})
      ]).callMethod('then', [
        js.allowInterop((result) {
          completer.complete(result);
        })
      ]);
    })
  ]);

  return completer.future;
}
