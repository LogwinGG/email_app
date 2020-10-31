import 'dart:async';

mixin Validation {
  static bool isEmail(String email) => email.contains('@');
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (value, sink) {
      if (isEmail(value)){
        sink.add(value);
      }
      else {
        sink.addError("Email не коректен");
      }
    },
  );
  //validate Subject
  final validateSubject = StreamTransformer<String, String>.fromHandlers(
    handleData: (value, sink) {
      var len = value.trim().length;

      if (len == 0) sink.addError('Не может быть пустым');
      else if (len < 4)  sink.addError('Должен содеражать больше 4 символов');
      else sink.add(value);

    },
  );

}