import 'package:flutter/material.dart';
import 'package:prefusuarios/shared_prefs/user_preferences.dart';
import 'package:prefusuarios/widgets/drawer_menu.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = 'home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prefs = UserPreferences();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor:  prefs.colorSecundario ? Colors.teal : Colors.blue,
      ),
      drawer: DrawerMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Género: ${prefs.genero == 1 ? 'Masculino' : 'Femenino'}'),
          Divider(),
          Text('Nombre: ${prefs.nombre}'),
        ],
      ),
    );
  }
}
