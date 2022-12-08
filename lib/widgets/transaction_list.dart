import 'package:flutter/material.dart';

import './tx_card.dart';
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
              return TxCard(
                  tx: transactions[index],
                  deleteTransaction: deleteTransaction);
            },
          );
  }
}
