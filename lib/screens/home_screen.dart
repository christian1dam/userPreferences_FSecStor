import 'package:flutter/material.dart';
import 'package:prefusuarios/shared_prefs/user_preferences.dart';
import 'package:prefusuarios/widgets/drawer_menu.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final prefs = UserPreferences();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        flexibleSpace: FutureBuilder<bool>(
          future: prefs.colorSecundario,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container(
                  color: Colors.blue); // Color predeterminado mientras carga
            }
            return Container(
              color: snapshot.data! ? Colors.teal : Colors.red,
            );
          },
        ),
      ),
      drawer: DrawerMenu(),
      body: FutureBuilder(
        future: Future.wait([
          prefs.genero,
          prefs.nombre,
        ]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final genero = snapshot.data![0] as int;
          final nombre = snapshot.data![1] as String;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Género: ${genero == 1 ? 'Masculino' : 'Femenino'}'),
              const Divider(),
              Text('Nombre: $nombre'),
            ],
          );
        },
      ),
    );
  }
}
