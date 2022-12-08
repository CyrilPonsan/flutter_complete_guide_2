import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TxCard extends StatelessWidget {
  const TxCard({
    super.key,
    required this.tx,
    required this.deleteTransaction,
  });

  final Transaction tx;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      elevation: 5,
      child: ListTile(
        leading: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              shape: BoxShape.circle),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
                child: Text(
              "${tx.amount.toStringAsFixed(2)} €",
              style: const TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
        ),
        title: Text(
          tx.title,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        subtitle: Text(DateFormat.yMMMd().format(tx.date)),
        trailing: MediaQuery.of(context).size.width > 360
            ? ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    elevation: 5, backgroundColor: Colors.white),
                onPressed: () => deleteTransaction(tx.id),
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.error,
                ),
                label: Text(
                  'Delete',
                  style: TextStyle(
                      fontSize: 14, color: Theme.of(context).colorScheme.error),
                ))
            : IconButton(
                onPressed: () => deleteTransaction(tx.id),
                icon: const Icon(Icons.delete),
                color: Theme.of(context).colorScheme.error,
              ),
      ),
    );
  }
}
