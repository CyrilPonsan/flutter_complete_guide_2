import 'package:flutter/material.dart';

import 'widgets/user_transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Expanse Planner'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.green,
                elevation: 5,
                child: Text('CHART'),
              ),
            ),
            UserTransaction()
          ],
        ));
  }
}
