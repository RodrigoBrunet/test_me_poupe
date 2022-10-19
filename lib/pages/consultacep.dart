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
        children: [
          Container(
            height: 250,
            color: const Color(0xFF6D51FF),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                const Positioned(
                  top: 50,
                  left: 32,
                  child: Text(
                    'Procurar CEP',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Positioned(
                  top: 99,
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Digite o CEP que você\n deseja procurar',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 167,
                  child: Container(
                    height: 50,
                    width: 293,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        100,
                      ),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      controller: controller.cep,
                      decoration: InputDecoration(
                        hintText: '88330-301',
                        border: InputBorder.none,
                        icon: IconButton(
                          onPressed: () async {
                            await controller.enviaCep();
                          },
                          icon: const Icon(Icons.search),
                        ),
                      ),
                      inputFormatters: [controller.maskFormater],
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(controller.retorno!.logradouro.toString() +
                    controller.retorno!.localidade.toString()),
                Text(controller.retorno!.cep.toString())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
