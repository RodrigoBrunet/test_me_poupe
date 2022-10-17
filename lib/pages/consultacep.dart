import 'package:flutter/material.dart';
import 'package:test_me_poupe/controllers/consulta_cep_controller.dart';

class ConsultaCep extends StatefulWidget {
  const ConsultaCep({Key? key}) : super(key: key);

  @override
  State<ConsultaCep> createState() => _ConsultaCepState();
}

class _ConsultaCepState extends State<ConsultaCep> {
  final controller = ConsultaCepController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: controller.cep,
            decoration:
                const InputDecoration(labelText: 'informe o cep', hintText: ''),
          ),
          TextButton(
            onPressed: () {
              controller.enviaCep();
            },
            child: const Text('consulta cep'),
          ),
        ],
      ),
    );
  }
}
