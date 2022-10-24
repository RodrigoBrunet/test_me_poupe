import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_me_poupe/routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<Color> colors = [
    Color(0xFF6D51FF),
    Color(0xFF6D51FF),
    Color(0xFF6D51FF),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.875,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                const Positioned(
                  top: 35,
                  left: 32,
                  child: Text(
                    'Olá,',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF151515),
                    ),
                  ),
                ),
                const Positioned(
                  top: 70,
                  left: 32,
                  child: Text(
                    'Bem-vindo',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF151515),
                    ),
                  ),
                ),
                Positioned(
                  top: 32,
                  child: Image(
                    image: Image.asset(
                      'assets/images/way_bro.png',
                      width: double.infinity,
                      height: double.infinity,
                      //fit: BoxFit.cover,
                    ).image,
                  ),
                ),
                Positioned(
                  bottom: 80,
                  child: Image(
                    image: Image.asset(
                      'assets/images/grupo.png',
                    ).image,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  child: Container(
                    height: 57,
                    width: 296,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F4FF),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ],
            ),
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
