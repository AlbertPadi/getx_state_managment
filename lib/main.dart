import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_state_managment/controllers/controllers.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX State Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  final AnimalsController animalsController = Get.put(AnimalsController());

  List<String> animals = [
    '🐵 Mono',
    '🐷 Cerdo',
    '🐸 Rana',
    '🐀 Rata',
    '🐆 Leopardo',
    '🐉 Dragon',
    '🐋 Delfin',
    '🐌 Caracol',
    '🐓 Gallo',
    '😸 Gato',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<AnimalsController>(
          init: animalsController,
          builder: (AnimalsController animalsCtr) {
            return ListView.builder(
              itemCount: animalsCtr.list.length,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(
                    animalsCtr.list[index],
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  trailing: IconButton(
                      onPressed: () => animalsCtr.remove(index),
                      icon: Icon(Icons.close)),
                );
              },
            );
          }),
      bottomNavigationBar: Container(
        height: 60,
        child: TextButton(
          child: Text(
            'Add animal',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          onPressed: () {
            var rand = new Random();
            animalsController.add(animals[rand.nextInt(animals.length)]);
          },
        ),
      ),
    );
  }
}
