import 'package:flutter/material.dart';
import 'package:test_me_poupe/controllers/consulta_cep_controller.dart';
import 'package:test_me_poupe/models/modeldb.dart';

import '../db/database.dart';

class FavoritoPage extends StatefulWidget {
  const FavoritoPage({Key? key}) : super(key: key);

  @override
  State<FavoritoPage> createState() => _FavoritoPageState();
}

class _FavoritoPageState extends State<FavoritoPage> {
  List<EnderecoModel> listaEndereco = [];
  @override
  void initState() {
    super.initState();
    DatabaseHelper.instance.queryAllRows().then((value) {
      setState(() {
        for (var element in value) {
          listaEndereco.add(EnderecoModel(
            id: element['_id'],
            logradouro: element["logradouro"],
            cep: element["cep"],
            localidade: element["localidade"],
            uf: element["uf"],
          ));
        }
      });
    }).catchError((error) {
      print(error);
    });
  }

  ConsultaCepController controller = ConsultaCepController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          const SizedBox(
            height: 36,
          ),
          const Text('Meus Favoritos'),
          SizedBox(
            height: 110,
            child: ListView.builder(
              itemCount: listaEndereco.length,
              itemBuilder: (BuildContext context, int index) {
                if (index == listaEndereco.length) {
                  return Container();
                }
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                  child: ListTile(
                    title: Text(listaEndereco[index].cep),
                    subtitle: Text(
                        '${listaEndereco[index].logradouro}  ${listaEndereco[index].localidade} - CEP ${listaEndereco[index].cep}'),
                    //trailing: Image.asset('assets/images/Subtract.png'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
