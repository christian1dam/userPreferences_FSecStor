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
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    // Inicializamos las propiedades desde las preferencias
    prefs.lastPage = SettingsScreen.routeName;
    _textController = TextEditingController(text: prefs.nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
          title: Title(
            color: Colors.black,
            child: const Center(child: Text("Ajustes")),
          ),
        ),
        body: ListView(children: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
          ),
          Divider(),
          SwitchListTile(
              value: prefs.colorSecundario,
              title: Text('Color secundario'),
              onChanged: (value) {
                setState(() {
                  prefs.colorSecundario = value;
                });
              }),
          RadioListTile(
              value: 1,
              title: Text('Masculino'),
              groupValue: prefs.genero,
              onChanged: (value) {
                setState(() {
                  prefs.genero = value as int;
                });
              }),
          RadioListTile(
              value: 2,
              title: Text('Femenino'),
              groupValue: prefs.genero,
              onChanged: (value) {
                setState(() {
                  prefs.genero = value as int;
                });
              }),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre de la peresona usando el teléfono'),
              onChanged: (value) {
                setState(() {
                  prefs.nombre = value;
                });
              },
            ),
          )
        ]));
  }
}
