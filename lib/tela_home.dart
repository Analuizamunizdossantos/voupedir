import 'package:flutter/material.dart';
import 'package:voupedir/banco/restaurante_dao.dart';

class TelaHome extends StatefulWidget {
  TelaHome({super.key});

  @override
  State<TelaHome> createState() => TelaHomeState();
}

class TelaHomeState extends State<TelaHome>{

  List <Restaurante> restaurantes = [];

  @override
  void initState(){
    super.initState();
    carregaRestaurante();
  }
Future <void> carregaRestaurante() async{
  final lista = await RestauranteDAO.ListarTodos();
  setState((){
    restaurantes = Lista;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Lista de restaurantes:"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) => TelaCadRestaurante()));

          }, icon: Icon(Icons.add))
        ],

      ),
      body: Padding(padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: restaurantes.length,
          itemBuilder: (context, index) {
            final r = restaurantes[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(r.nome ?? 'sem nome'),
                subtitle: Text('ID: ${r.codigo}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton
                      (onPressed: () {
                      //Código para editar restaurante
                    },
                        icon: Icon(Icons.edit, color: Colors.tealAccent)
                    ),
                    IconButton
                      (onPressed: () {
                      //Código para excluir restaurante

                      AlertDialog(
                        title: Text("Confirmar ação"),
                        content: Text("Deseja realmente exclui?"),
                        actions: [
                          TextButton(
                              onPressed: (){
                                //Código para excluir o registro
                              },
                              child: Text("Sim")
                          ),
                          TextButton(
                              onPressed:(){
                                //
                              },
                              child: Text("Não")
                        )
                        ],
                      );
                    },
                        icon: Icon(Icons.delete, color: Colors.red)
                    ),
                  ],
                ),
              ),
            );
          }
        )
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
      Navigator.push(context,MaterialPageRoute(builder: (context) => TelaCadRestaurante()));
    },
  child: Icon(Icons.add),
    ),
    );
  }


