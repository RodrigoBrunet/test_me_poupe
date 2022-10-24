import 'package:flutter/material.dart';
import 'package:test_me_poupe/controllers/consulta_cep_controller.dart';

class ListEnderecoBd extends StatefulWidget {
  const ListEnderecoBd({Key? key}) : super(key: key);

  @override
  State<ListEnderecoBd> createState() => _ListEnderecoBdState();
}

class _ListEnderecoBdState extends State<ListEnderecoBd> {
  @override
  void initState() {
    super.initState();
  }

  ConsultaCepController controller = ConsultaCepController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
