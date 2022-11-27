import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

  NewTransaction({super.key, required this.addTx});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: amountController,
            decoration: const InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
          ),
          TextButton(
            onPressed: () {
              addTx(
                titleController.text,
                double.parse(amountController.text),
              );
            },
            child: const Text(
              'Add Transaction',
              style: TextStyle(color: Colors.purple),
            ),
          ),
        ]),
      ),
    );
  }
}
