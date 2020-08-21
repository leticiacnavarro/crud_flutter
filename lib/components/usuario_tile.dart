import 'package:crud_flutter/provider/usuarios.dart';
import 'package:crud_flutter/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:crud_flutter/models/users.dart';
import 'package:provider/provider.dart';


class UsuarioTile extends StatelessWidget {
  
  final Usuario usuario;

  const UsuarioTile(this.usuario);
  
  @override
  Widget build(BuildContext context) {
    Usuarios usuarios = Provider.of(context);

    final avatar = usuario.avatarUrl == null || usuario.avatarUrl.isEmpty
      ? CircleAvatar(child: Icon(Icons.person))
      : CircleAvatar(backgroundImage: NetworkImage(usuario.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(usuario.name),
      subtitle: Text(usuario.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.pink,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: usuario
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Excluir usuário'),
                    content: Text('Tem certeza???'),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Não'),
                        ),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          usuarios.remove(usuario);
                        },
                        child: Text('Sim'),
                        ),
                    ],
                    )
              );
              },
            )      
          ],
      ),
    )
    );
  }
}