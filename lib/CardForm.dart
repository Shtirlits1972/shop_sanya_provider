import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_sanya/constants.dart';
import 'package:shop_sanya/order_row_prov.dart';

class CardForm extends StatefulWidget {
  const CardForm({Key? key}) : super(key: key);

  @override
  State<CardForm> createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Dodo'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: Provider.of<OrderRowProv>(context, listen: false)
              .getOrderRow()
              .length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Provider.of<OrderRowProv>(context, listen: false)
                      .getOrderRow()[index]
                      .ProductName,
                  style: tStyle20,
                ),
                Text(
                  '${Provider.of<OrderRowProv>(context, listen: false).getOrderRow()[index].qty}X${Provider.of<OrderRowProv>(context, listen: false).getOrderRow()[index].ProductPrice}=${Provider.of<OrderRowProv>(context, listen: false).getOrderRow()[index].qty * Provider.of<OrderRowProv>(context, listen: false).getOrderRow()[index].ProductPrice}',
                  style: tStyle20,
                ),
                IconButton(
                    onPressed: () {
                      Provider.of<OrderRowProv>(context, listen: false)
                          .removeById(
                              Provider.of<OrderRowProv>(context, listen: false)
                                  .getOrderRow()[index]
                                  .ProductId);
                      print('delete');
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.delete,
                      size: 30,
                      color: Colors.redAccent,
                    )),
              ],
            );
          },
        ),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          'Total ${Provider.of<OrderRowProv>(context, listen: false).total().round().toString()}\$',
          style: tStyle20,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: TextButton(
              onPressed: () {
                Provider.of<OrderRowProv>(context, listen: false).clear();
                setState(() {}); // for rebuilding ListView
              },
              child: Text(
                'clear',
                style: tStyle20,
              )),
        )
      ]),
    );
  }
}
