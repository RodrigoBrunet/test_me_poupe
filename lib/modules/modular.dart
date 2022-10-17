import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_me_poupe/controllers/consulta_cep_controller.dart';
import 'package:test_me_poupe/repositories/repository_via_cep.dart';
import 'package:test_me_poupe/routes/routes.dart';

class AppModule extends Module {
  Routes myRoutes = Routes();

  @override
  List<Bind> get binds => [
        Bind.singleton((i) => ConsultaCepController()),
        Bind.singleton((i) => RepositoryViaCep()),
      ];

  @override
  List<ModularRoute> get routes => [...myRoutes.routes];
}
