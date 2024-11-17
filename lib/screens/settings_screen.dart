import 'package:flutter/material.dart';
import 'package:prefusuarios/shared_prefs/user_preferences.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName = 'settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final prefs = UserPreferences();
  late TextEditingController _textController = TextEditingController();
  bool _colorSecundario = false;
  int _genero = 1;

  @override
  void initState() {
    super.initState();
    _initializePreferences();
  }

  Future<void> _initializePreferences() async {
    // Carga las preferencias de forma asíncrona
    final nombre = await prefs.nombre;
    final colorSecundario = await prefs.colorSecundario;
    final genero = await prefs.genero;

    // Inicializa las variables con los valores cargados
    setState(() {
      _textController = TextEditingController(text: nombre);
      _colorSecundario = colorSecundario;
      _genero = genero;
    });
  }

  @override
  void dispose() {
    _textController
        .dispose(); // Libera el controlador para evitar fugas de memoria
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _colorSecundario ? Colors.teal : Colors.blue,
        title: const Center(
          child: Text("Ajustes"),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(5.0),
            child: const Text(
              'Settings',
              style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          // Switch para color secundario
          SwitchListTile(
            value: _colorSecundario,
            title: const Text('Color secundario'),
            onChanged: (value) async {
              setState(() {
                _colorSecundario = value;
              });
              await prefs.setColorSecundario(value);
            },
          ),
          // Radio para género masculino
          RadioListTile(
            value: 1,
            title: const Text('Masculino'),
            groupValue: _genero,
            onChanged: (value) async {
              setState(() {
                _genero = value as int;
              });
              await prefs.setGenero(_genero);
            },
          ),
          // Radio para género femenino
          RadioListTile(
            value: 2,
            title: const Text('Femenino'),
            groupValue: _genero,
            onChanged: (value) async {
              setState(() {
                _genero = value as int;
              });
              await prefs.setGenero(_genero);
            },
          ),
          const Divider(),
          // TextField para el nombre
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el teléfono',
              ),
              onChanged: (value) async {
                await prefs.setNombre(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
