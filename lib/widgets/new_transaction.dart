import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  const NewTransaction({super.key, required this.addTx});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = amountController.text;
    if (enteredTitle.isEmpty || double.parse(enteredAmount) <= 0) return;
    widget.addTx(
      enteredTitle,
      double.parse(enteredAmount),
    );
    Navigator.of(context).pop();
  }

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
            onSubmitted: (_) => submitData,
          ),
          TextField(
            controller: amountController,
            decoration: const InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData,
          ),
          TextButton(
            onPressed: submitData,
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
