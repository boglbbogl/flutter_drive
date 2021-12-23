import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

Flushbar<dynamic> appFlushbar({
  required String message,
}) {
  return Flushbar(
    borderColor: const Color.fromRGBO(71, 71, 71, 1),
    borderWidth: 2,
    backgroundColor: Colors.white,
    margin: const EdgeInsets.all(10),
    icon: const Icon(
      Icons.error_outline_rounded,
      color: Color.fromRGBO(115, 115, 115, 1),
      size: 22,
    ),
    message: message,
    messageColor: const Color.fromRGBO(115, 115, 115, 1),
    messageSize: 12,
    duration: const Duration(milliseconds: 1500),
  );
}

Flushbar<dynamic> signInFlushbar({
  required String message,
  required Color color,
  Color? textColor,
}) {
  return Flushbar(
    borderColor: const Color.fromRGBO(71, 71, 71, 1),
    borderWidth: 2,
    backgroundColor: color,
    margin: const EdgeInsets.all(10),
    icon: Icon(
      Icons.error_outline_rounded,
      color: textColor ?? const Color.fromRGBO(115, 115, 115, 1),
      size: 22,
    ),
    message: message,
    messageColor: textColor ?? const Color.fromRGBO(115, 115, 115, 1),
    messageSize: 12,
    duration: const Duration(milliseconds: 1500),
  );
}
