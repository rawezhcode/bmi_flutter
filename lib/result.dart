// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.result,
    required this.isMale,
    required this.age,
  }) : super(key: key);

  final double result;
  final bool isMale;
  final int age;

  String get resultPhrase {
    if (result < 18.5) {
      return 'Thin';
    } else if (result < 25) {
      return 'Normal';
    } else if (result < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI Calculator'),
        backgroundColor: const Color(0xFF04040C),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20, left: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your Result',
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                width: 330,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF3F4253),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        'Healthiness: $resultPhrase',
                        style: Theme.of(context).textTheme.headline4,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        'Gender: ${isMale ? 'Male' : 'Female'}',
                        style: Theme.of(context).textTheme.headline4,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        'Result: ${result.toStringAsFixed(1)}',
                        style: Theme.of(context).textTheme.headline4,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        'Age: $age',
                        style: Theme.of(context).textTheme.headline4,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
