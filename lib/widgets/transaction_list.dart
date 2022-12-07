import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  const TransactionList(
      {super.key, required this.transactions, required this.deleteTransaction});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No transactions yet !',
                    style: Theme.of(context).appBarTheme.titleTextStyle),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  height: constraints.maxHeight * .6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
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
                        "${transactions[index].amount.toStringAsFixed(2)} €",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).appBarTheme.titleTextStyle,
                  ),
                  subtitle:
                      Text(DateFormat.yMMMd().format(transactions[index].date)),
                  trailing: MediaQuery.of(context).size.width > 360
                      ? ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              elevation: 5, backgroundColor: Colors.white),
                          onPressed: () =>
                              deleteTransaction(transactions[index].id),
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).colorScheme.error,
                          ),
                          label: Text(
                            'Delete',
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.error),
                          ))
                      : IconButton(
                          onPressed: () =>
                              deleteTransaction(transactions[index].id),
                          icon: const Icon(Icons.delete),
                          color: Theme.of(context).colorScheme.error,
                        ),
                ),
              );
            },
          );
  }
}
