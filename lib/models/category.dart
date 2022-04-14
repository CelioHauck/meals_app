import 'dart:convert';

import 'package:flutter/material.dart';

class Category {
  final String _id;
  final String _title;
  final Color _color;

  const Category({
    required String id,
    required String title,
    required Color color,
  })  : _id = id,
        _color = color,
        _title = title;

  String getTitle() => _title;
  Color getColor() => _color;

  Category copyWith({
    String? id,
    String? title,
    Color? color,
  }) {
    return Category(
      id: id ?? _id,
      title: title ?? _title,
      color: color ?? _color,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': _id});
    result.addAll({'title': _title});
    result.addAll({'color': _color.value});

    return result;
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      color: Color(map['color']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  @override
  String toString() => 'Category(id: $_id, title: $_title, color: $_color)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category &&
        other._id == _id &&
        other._title == _title &&
        other._color == _color;
  }

  @override
  int get hashCode => _id.hashCode ^ _title.hashCode ^ _color.hashCode;
}
