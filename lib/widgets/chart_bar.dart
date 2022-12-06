import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  const ChartBar(
      {super.key,
      required this.label,
      required this.spendingAmount,
      required this.spendingPctOfTotal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(0)}')),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          height: 60,
          width: 10,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 1.0)),
            ),
            FractionallySizedBox(
              heightFactor: spendingPctOfTotal,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10)),
              ),
            )
          ]),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(label)
      ],
    );
  }
}
