import 'package:flutter/material.dart';

class Usuario{
  final String id;
  final String name;
  final String email;
  final String avatarUrl;

  const Usuario({
    this.id,
    @required this.name,
    @required this.email,
    @required this.avatarUrl
  });
}