import 'package:flutter/material.dart';

class Category {
  final int id;
  final String name;
  final int color;
  final Icon icon;

  const Category({
    required this.id,
    required this.name,
    required this.color,
    required this.icon,
  });
}
