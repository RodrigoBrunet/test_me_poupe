import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_me_poupe/controllers/home_controller.dart';
import 'package:test_me_poupe/routes/routes.dart';

class AppModule extends Module {
  Routes myRoutes = Routes();

  @override
  List<Bind> get binds => [
        Bind.singleton((i) => HomeController()),
      ];

  @override
  List<ModularRoute> get routes => [...myRoutes.routes];
}
