import 'package:discover_recipes/components/main_drawer.dart';
import 'package:discover_recipes/models/settings.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final void Function(Settings) onSettingsChanged;

  const SettingsScreen(
      {super.key, required this.settings, required this.onSettingsChanged});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    void Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Filtros',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Sem glúten',
                  'Exibe somente refeições sem glúten',
                  settings.isGlutenFree,
                  (value) => setState(() {
                    settings.isGlutenFree = value;
                  }),
                ),
                _createSwitch(
                  'Sem lactose',
                  'Exibe somente refeições sem lactose',
                  settings.isLactoseFree,
                  (value) => setState(() {
                    settings.isLactoseFree = value;
                  }),
                ),
                _createSwitch(
                  'Vegana',
                  'Exibe somente refeições veganas',
                  settings.isVegan,
                  (value) => setState(() {
                    settings.isVegan = value;
                  }),
                ),
                _createSwitch(
                  'Vegetariana',
                  'Exibe somente refeições vegetarianas',
                  settings.isVegetarian,
                  (value) => setState(() {
                    settings.isVegetarian = value;
                  }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
