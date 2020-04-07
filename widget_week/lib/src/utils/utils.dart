import 'package:flutter/material.dart';

final Map<String, IconData> icons = {
  "lock": Icons.lock,
  "expand_less": Icons.expand_less,
  "wrap_text": Icons.wrap_text,
  "refresh": Icons.refresh,
  "opacity": Icons.opacity,
};

IconData iconFromString(String icon) {
  return icons[icon] ?? null;
}