import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final patentIdController = TextEditingController();
  final companyNameController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: SizedBox(
            width: 320,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: patentIdController,
                  decoration: const InputDecoration(
                    labelText: 'Patent ID (Publication Number)',
                    hintText: 'Enter patent ID (publication number)',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: companyNameController,
                  decoration: const InputDecoration(
                    labelText: 'Company Name',
                    hintText: 'Enter company name',
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    child: const Text('Check Infringement'),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
