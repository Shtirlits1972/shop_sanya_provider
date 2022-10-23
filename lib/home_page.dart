import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_sanya/constants.dart';
import 'package:shop_sanya/order_row_prov.dart';
import 'package:flutter/foundation.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    bool isEmpty = context.watch<OrderRowProv>().isEmpty();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Dodo'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/CardForm');
            },
            icon: isEmpty
                ? const Icon(
                    IconData(0xf37f, fontFamily: 'MaterialIcons'),
                    color: Colors.white,
                    size: 30.0,
                  )
                : const Icon(
                    IconData(0xe59c, fontFamily: 'MaterialIcons'),
                    color: Colors.white,
                    size: 30.0,
                  ),
          ),
        ],
      ),
      body: Center(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: listProduct.length,
            itemBuilder: (BuildContext context3, int index) {
              return InkWell(
                onTap: () {
                  context.read<OrderRowProv>().addRow(listProduct[index], 1);
                  print(' ${context.read<OrderRowProv>().getOrderRow()}');
                  setState(() {});
                },
                child: Column(
                  children: <Widget>[
                    Text(
                      listProduct[index].productName,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Center(
                      child: Center(
                        child:
                            Image.asset('img/${listProduct[index].pictures}'),
                      ),
                    ),
                    Text(
                      'price = ${listProduct[index].price}',
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {});
  }
}
