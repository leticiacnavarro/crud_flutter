import 'dart:math';

import 'package:crud_flutter/data/dummy.usuarios.dart';
import 'package:crud_flutter/models/users.dart';
import 'package:flutter/material.dart';

class Usuarios with ChangeNotifier {
  final Map<String, Usuario> _itens = {...DUMMY_USUARIOS};

  List<Usuario> get all{
    return [..._itens.values];
  }

  int get count {
    return _itens.length;
  }

  Usuario byIndex(int i){
    return _itens.values.elementAt(i);
  }

  void put(Usuario usuario){
    if(usuario == null){
      return;
    }

    if((usuario.id != null) && (usuario.id.trim().isNotEmpty) && (_itens.containsKey(usuario.id))){
      _itens.update(usuario.id, (_) => Usuario(
        avatarUrl: usuario.avatarUrl,
        name: usuario.name,
        email: usuario.email,
        id: usuario.id));
    }
    else{
    final id = Random().nextDouble().toString();
          _itens.putIfAbsent(id, () => Usuario(
          avatarUrl: usuario.avatarUrl,
          id: id,
          name: usuario.name,
          email: usuario.email,
          ));
    }   
    notifyListeners();
  }

  void remove(Usuario usuario){
    if(usuario != null && usuario.id != null){
      _itens.remove((usuario.id));
      notifyListeners();
    }
  }
}