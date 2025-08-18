import 'package:flutter/material.dart';
import 'usuario.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    usuario u = new usuario(
    codigo: 1,
    login: "Ana Luiza18",
    nome: "Ana Luiza",
    senha:"12346"
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Meus Dados"),
        ),
        body: Center(
          child: Padding(padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Text("Nome: ${u.nome}"),
                Text("Código: ${u.codigo}"),
                Text("Login: ${u.login}"),
                Text("Senha: ${u.senha}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
