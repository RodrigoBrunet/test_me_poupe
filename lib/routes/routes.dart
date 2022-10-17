import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_me_poupe/pages/homepage.dart';

class Routes {
  final List<ChildRoute> routes = [
    ChildRoute(
      NamedRoutes.home,
      child: (_, ___) => const HomePage(),
      transition: TransitionType.fadeIn,
    ),
  ];
}

class NamedRoutes {
  static const home = "/home";
}
