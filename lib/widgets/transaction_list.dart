import 'package:flutter/material.dart';
import 'package:payments_history/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  deleteTx(id) {
    deleteTransaction(id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
      ? Column(
        children: <Widget>[
          SizedBox(height: 20),

          Text(
            'No transactions added yet!',
            style: Theme.of(context).textTheme.title,
          ),
          SizedBox(height: 20),
          Container(height: 200, child: Image.asset('assets/images/waiting.png', fit: BoxFit.contain))
        ],
      )
      : ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 20
            ),
            child: ListTile(
              title: Text(
                transactions[index].title,
                style: Theme.of(context).textTheme.title,
              ),
              subtitle: Text(
                transactions[index].date.toString()
              ),
              leading: CircleAvatar(
                radius: 30,
                child: FittedBox(
                  child: Text('R\$${transactions[index].amount.toStringAsFixed(2)}')
                )
              ),
              trailing: IconButton(icon: Icon(Icons.delete), color: Theme.of(context).errorColor, onPressed: () => deleteTx(transactions[index].id)),
            ),
          );
        },
        // itemBuilder: (BuildContext context, index) {
        //   return  Card(
        //     child: Row(children: <Widget>[
        //       Container(
        //         child: Text(
        //           'R\$${transactions[index].amount.toStringAsFixed(2)}',
        //           style: TextStyle(
        //             fontWeight: FontWeight.bold,
        //             fontSize: 15,
        //             color: Theme.of(context).primaryColor
        //           ),
        //         ),
        //         margin: EdgeInsets.symmetric(
        //           vertical: 10,
        //           horizontal: 20
        //         ),
        //         decoration: BoxDecoration(
        //           border: Border.all(
        //             color: Theme.of(context).primaryColor,
        //             width: 2
        //           )
        //         ),
        //         padding: EdgeInsets.all(10),
        //       ),
        //       Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: <Widget>[
        //           Text(
        //             transactions[index].title,
        //             style: Theme.of(context).textTheme.title
        //           ),
        //           Text(
        //             DateFormat('dd/MM/yyyy').format(transactions[index].date.toLocal()),
        //             style: TextStyle(
        //               fontSize: 14,
        //               color: Colors.grey
        //             )
        //           ),
        //         ]
        //       )
        //     ]),
        //   );
        // },
        itemCount: transactions.length,
      ),
    );
  }
}