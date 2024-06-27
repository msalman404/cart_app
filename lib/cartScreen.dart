import 'dart:developer';

import 'package:cart_app/items_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log('This is cart screen');
    ItemProvider itemprovider = Provider.of<ItemProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: itemprovider.selecteitem.length,
                  itemBuilder: ((context, index) {
                    return Consumer<ItemProvider>(
                        builder: ((context, value, child) {
                      return ListTile(
                        onTap: () {
                          value.removeItem(index);
                        },
                        title: Text("Cart Item"),
                      );
                    }));
                  })))
        ],
      ),
    );
  }
}
