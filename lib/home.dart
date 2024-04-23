import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedGender = 3, height = 170, age = 23, weight = 65;
  double bmi = 0;
  var bgcolor = const Color.fromARGB(255, 100, 89, 89);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 128, 2, 2),
        title: const Center(
            child: Text(
          'BMI CALCULATOR',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
        )),
      ),
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromARGB(255, 164, 8, 8),
                Color.fromARGB(255, 0, 0, 0)
              ])),
          child: _buildUI()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            bmi = weight / pow(height / 100, 2);
          });
        },
        child: const Icon(Icons.calculate),
      ),
    );
  }

  Widget _buildUI() {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.only(top: 50)),
        _genderSelector(),
        const SizedBox(
          height: 50,
        ),
        _heightInput(),
        const SizedBox(
          height: 50,
        ),
        _weightAndAgeInputRow(),
        const SizedBox(
          height: 50,
        ),
        _bmiResult()
      ],
    );
  }

  Widget _genderSelector() {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 129, 116, 116),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    selectedGender = 0;
                  });
                },
                icon: const Icon(Icons.male),
                iconSize: 60,
                color: selectedGender == 0 ? Colors.blue : Colors.black,
              ),
              const Text(
                'Male',
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    selectedGender = 1;
                  });
                },
                icon: const Icon(Icons.female),
                iconSize: 60,
                color: selectedGender == 1 ? Colors.pink : Colors.black,
              ),
              const Text(
                'Female',
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _heightInput() {
    return Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 129, 116, 116),
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            const Text(
              'Height',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Slider(
                activeColor: const Color.fromARGB(255, 135, 4, 4),
                thumbColor: (Colors.black),
                min: 0,
                max: 300,
                divisions: 300,
                value: height.toDouble(),
                onChanged: (value) {
                  setState(() {
                    height = value.toInt();
                  });
                }),
            Text(
              '$height cm',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ));
  }

  Widget _weightAndAgeInputRow() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        weightInput(),
        ageInput(),
      ],
    );
  }

  Widget weightInput() {
    return Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 129, 116, 116),
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            const Text(
              'Weight',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            ItemCount(
                color: const Color.fromARGB(255, 135, 4, 4),
                textStyle: const TextStyle(fontSize: 100),
                buttonSizeHeight: 30,
                buttonSizeWidth: 50,
                initialValue: weight,
                minValue: 50,
                maxValue: 350,
                onChanged: (value) {
                  setState(() {
                    weight = value.toInt();
                  });
                },
                decimalPlaces: 0)
          ],
        ));
  }

  Widget ageInput() {
    return Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 129, 116, 116),
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            const Text(
              'Age',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            ItemCount(
                color: const Color.fromARGB(255, 135, 4, 4),
                textStyle: const TextStyle(fontSize: 100),
                buttonSizeHeight: 30,
                buttonSizeWidth: 50,
                initialValue: age,
                minValue: 1,
                maxValue: 100,
                onChanged: (value) {
                  setState(() {
                    age = value.toInt();
                  });
                },
                decimalPlaces: 0)
          ],
        ));
  }

  Widget _bmiResult() {
    return Container(
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Text(
          'BMI: ${bmi.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ));
  }
}
