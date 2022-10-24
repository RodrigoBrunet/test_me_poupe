import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_me_poupe/pages/consultacep.dart';
import 'package:test_me_poupe/pages/homepage.dart';

import '../pages/listaenderecobd.dart';

class Routes {
  final navigatorKey = GlobalKey<NavigatorState>();
//final navigator = navigatorKey.currentState!;

  final List<ChildRoute> routes = [
    ChildRoute(
      NamedRoutes.home,
      child: (_, ___) => const HomePage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      NamedRoutes.consulta,
      child: (_, ___) => const ConsultaCep(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      NamedRoutes.favorito,
      child: (_, ___) => const ListEnderecoBd(),
      transition: TransitionType.fadeIn,
    ),
  ];
}

class NamedRoutes {
  static const home = "/home";
  static const consulta = "/consulta";
  static const favorito = "/favorito";
}
