import 'package:crud_flutter/models/users.dart';
import 'package:crud_flutter/provider/usuarios.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {

  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void loadFormData(Usuario usuario){
    _formData['id'] = usuario.id;
    _formData['name'] = usuario.name;
    _formData['email'] = usuario.email;
    _formData['avatarUrl'] = usuario.avatarUrl;
  }

  @override
  Widget build(BuildContext context) {

    Usuarios usuarios = Provider.of(context);
    final Usuario user = ModalRoute.of(context).settings.arguments;
    if(user != null){
      loadFormData(user);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Usuário'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              if(_form.currentState.validate()){
                   _form.currentState.save();     
  
                   usuarios.put(
                     Usuario(
                       id: _formData['id'],
                       name: _formData['name'],
                       email: _formData['email'],
                       avatarUrl: _formData['avatarUrl']
                     )
                   );

                  Navigator.of(context).pop();
                   _form.currentState.save();                

                }
            },            
          )
        ]
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column (            
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value){
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value,
                ),
                TextFormField(
                initialValue: _formData['email'],
                decoration: InputDecoration(labelText: 'E-mail'),
                onSaved: (value) => _formData['email'] = value,
                validator: (value){
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: InputDecoration(labelText: 'URL do avatar'),
                onSaved: (value) => _formData['avatarUrl'] = value,
                )
            ]
            ),
            ),
      )
    );
  }
}