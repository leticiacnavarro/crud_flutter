
import 'package:crud_flutter/components/usuario_tile.dart';
import 'package:crud_flutter/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:crud_flutter/provider/usuarios.dart';
import 'package:provider/provider.dart';


class UsuariosLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Usuarios usuarios = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM,
              );
            },
          )
        ]
      ),
      body: (
        ListView.builder(
          itemCount: usuarios.count,
          itemBuilder: (ctx, i) => UsuarioTile(usuarios.byIndex(i)),
        )
      ),
    );
  }
}