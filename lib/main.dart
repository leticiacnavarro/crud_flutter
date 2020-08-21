import 'package:crud_flutter/provider/usuarios.dart';
import 'package:crud_flutter/routes/app_routes.dart';
import 'package:crud_flutter/views/usuarios.lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/usuarios.form.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Usuarios(),
      child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        AppRoutes.HOME: (_) => UsuariosLista(),
        AppRoutes.USER_FORM: (_) => UserForm()
      }
    ),
  );
  }
}
