import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_me_poupe/controllers/consulta_cep_controller.dart';
import 'package:test_me_poupe/db/database.dart';
import 'package:test_me_poupe/models/modeldb.dart';
import 'package:test_me_poupe/models/modelstate.dart';
import 'package:test_me_poupe/routes/routes.dart';

class ConsultaCep extends StatefulWidget {
  const ConsultaCep({Key? key}) : super(key: key);

  @override
  State<ConsultaCep> createState() => _ConsultaCepState();
}

class _ConsultaCepState extends State<ConsultaCep> {
  Modeldb? model;
  @override
  void initState() {
    super.initState();
  }

  static const List<Color> colors = [
    Color(0xFF6D51FF),
    Color(0xFF6D51FF),
    Color(0xFF6D51FF),
  ];
  int currentIndex = 0;
  final controller = ConsultaCepController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
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
                            if (controller.retorno != null) {
                              controller.insert();
                            }
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
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            child: AnimatedBuilder(
              animation: controller,
              builder: (_, __) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 57),
                    child: const Text(
                      'Endereço:',
                      style: TextStyle(
                        color: Color(0xFF6D51FF),
                        fontWeight: FontWeight.w500,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  controller.state == modelState.stopped
                      ? Container(
                          padding: const EdgeInsets.only(left: 64),
                          child: const Text('Nenhuma pesquisa realizada'))
                      : controller.state == modelState.loading
                          ? (const Center(child: CircularProgressIndicator()))
                          : controller.state == modelState.sucess
                              ? Center(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 58),
                                    width: double.infinity,
                                    child: Text(
                                      '${controller.retorno!.logradouro} '
                                      ' - '
                                      ' ${controller.retorno!.localidade}'
                                      ' ${controller.retorno!.uf}'
                                      ' - '
                                      ' ${controller.retorno!.cep}',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                )
                              : controller.state == modelState.error
                                  ? const Center(
                                      child: Text(
                                        'Erro ao consultar cep, tente novamente !',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    )
                                  : const Text(''),
                ],
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          SizedBox(
            height: 96,
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              selectedItemColor: colors[currentIndex],
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });

                if (value == 0) Modular.to.navigate(NamedRoutes.home);
                if (value == 1) Modular.to.navigate(NamedRoutes.consulta);
                if (value == 2) Modular.to.navigate(NamedRoutes.favorito);
              },
              iconSize: 25,
              backgroundColor: Colors.white,
              elevation: 0,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Procurar',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.star),
                  label: 'Favoritos',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
