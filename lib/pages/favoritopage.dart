import 'package:flutter/material.dart';
import 'package:test_me_poupe/controllers/consulta_cep_controller.dart';

import '../db/database.dart';

class FavoritoPage extends StatefulWidget {
  const FavoritoPage({Key? key}) : super(key: key);

  @override
  State<FavoritoPage> createState() => _FavoritoPageState();
}

class _FavoritoPageState extends State<FavoritoPage> {
  @override
  void initState() {
    super.initState();
  }

  ConsultaCepController controller = ConsultaCepController();
  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          const SizedBox(
            height: 36,
          ),
          const Text('data'),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            child: FutureBuilder(
              future: controller.buscar,
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: controller.buscar,
                    itemBuilder: (BuildContext context, int index) {
                      return const Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                        child: ListTile(
                          title: Text('title'),
                          subtitle: Text('subtitle'),
                          //trailing: Image.asset('assets/images/Subtract.png'),
                        ),
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
