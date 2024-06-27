import 'dart:developer';

import 'package:cart_app/cartScreen.dart';
import 'package:cart_app/items_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    log('This is item screen');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Items Screen"),
        leading: IconButton(
            onPressed: (() {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => CartScreen())));
            }),
            icon: Icon(Icons.add_box)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: ((context, index) {
                  return Consumer<ItemProvider>(
                    builder: (context, value, child) {
                      return ListTile(
                        onTap: () {
                          value.addToCart(index);
                        },
                        title: const Text("Item"),
                        trailing: Icon(Icons.add_task_outlined),
                      );
                    },
                  );
                })),
          )
        ],
      ),
    );
  }
}
