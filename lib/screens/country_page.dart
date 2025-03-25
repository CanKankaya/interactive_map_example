import 'dart:convert';
import 'dart:developer' as developer;

import 'package:countries_world_map/countries_world_map.dart';
import 'package:flutter/material.dart';

import '../utils/instructions.dart';

class CountryPage extends StatefulWidget {
  final String country;

  const CountryPage({required this.country, super.key});

  @override
  CountryPageState createState() => CountryPageState();
}

class CountryPageState extends State<CountryPage> {
  late String state;
  late String instruction;

  late List<Map<String, dynamic>> properties;

  late Map<String, Color?> keyValuesPaires;

  @override
  void initState() {
    instruction = getInstructions(widget.country);
    developer.log(
      'Instruction for ${widget.country}: $instruction',
      name: 'CountryPage',
    );

    if (instruction != "NOT SUPPORTED") {
      properties = getProperties(instruction);
      developer.log(
          'Properties structure example: ${properties.isNotEmpty ? json.encode(properties[0]) : "Empty"}',
          name: 'CountryPage');
      developer.log('Properties count: ${properties.length}', name: 'CountryPage');

      properties.sort((a, b) => a['name'].compareTo(b['name']));
      keyValuesPaires = {};
      for (var element in properties) {
        keyValuesPaires.addAll({element['id']: element['color']});
      }

      state = 'Tap a state, prefecture or province';
    } else {
      state = 'This country is not supported';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.blue),
        title: Text(
          '${widget.country.toUpperCase()} - $state',
          style: const TextStyle(color: Colors.blue),
        ),
      ),
      body: instruction == "NOT SUPPORTED"
          ? const Center(child: Text("This country is not supported"))
          : Column(
              children: [
                Expanded(
                  child: Row(children: [
                    Expanded(
                        child: Center(
                            child: SimpleMap(
                      countryBorder: const CountryBorder(color: Colors.white),
                      defaultColor: Colors.grey.shade300,
                      key: Key(properties.toString()),
                      colors: keyValuesPaires,
                      instructions: instruction,
                      callback: (id, name, tapDetails) {
                        setState(() {
                          state = name;

                          int i = properties.indexWhere((element) => element['id'] == id);

                          properties[i]['color'] =
                              properties[i]['color'] == Colors.green ? null : Colors.green;
                          keyValuesPaires[properties[i]['id']] = properties[i]['color'];
                        });
                      },
                    ))),
                    if (MediaQuery.of(context).size.width > 800)
                      SizedBox(
                          width: 320,
                          height: MediaQuery.of(context).size.height,
                          child: Card(
                            margin: const EdgeInsets.all(16),
                            elevation: 8,
                            child: ListView(
                              children: [
                                for (int i = 0; i < properties.length; i++)
                                  ListTile(
                                    title: Text(properties[i]['name']),
                                    leading: Container(
                                      margin: const EdgeInsets.only(top: 8),
                                      width: 20,
                                      height: 20,
                                      color: properties[i]['color'] ?? Colors.grey.shade300,
                                    ),
                                    subtitle: Text(properties[i]['id']),
                                    onTap: () {
                                      setState(() {
                                        properties[i]['color'] =
                                            properties[i]['color'] == Colors.green
                                                ? null
                                                : Colors.green;
                                        keyValuesPaires[properties[i]['id']] =
                                            properties[i]['color'];
                                      });
                                    },
                                  )
                              ],
                            ),
                          )),
                  ]),
                ),
                if (MediaQuery.of(context).size.width < 800)
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Card(
                        margin: const EdgeInsets.all(16),
                        elevation: 8,
                        child: ListView(
                          children: [
                            for (int i = 0; i < properties.length; i++)
                              ListTile(
                                title: Text(properties[i]['name']),
                                leading: Container(
                                  margin: const EdgeInsets.only(top: 8),
                                  width: 20,
                                  height: 20,
                                  color: properties[i]['color'] ?? Colors.grey.shade300,
                                ),
                                subtitle: Text(properties[i]['id']),
                                onTap: () {
                                  setState(() {
                                    properties[i]['color'] = properties[i]['color'] == Colors.green
                                        ? null
                                        : Colors.green;
                                    keyValuesPaires[properties[i]['id']] = properties[i]['color'];
                                  });
                                },
                              )
                          ],
                        ),
                      )),
              ],
            ),
    );
  }

  List<Map<String, dynamic>> getProperties(String input) {
    Map<String, dynamic> instructions = json.decode(input);

    List paths = instructions['i'];

    List<Map<String, dynamic>> properties = [];

    for (var element in paths) {
      properties.add({
        'name': element['n'],
        'id': element['u'],
        'color': null,
      });
    }

    return properties;
  }
}
