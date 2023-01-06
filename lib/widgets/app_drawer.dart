import 'package:eshopingcart/screens/UserProductsScreen.dart';

import '../screens/orders.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('eShopping Cart'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.shop),
              title: Text('Shop'),
              onTap: (() {
                Navigator.of(context).pushReplacementNamed('/');
              })),
          Divider(),
          ListTile(
              leading: Icon(Icons.payment),
              title: Text('Orders'),
              onTap: (() {
                Navigator.of(context)
                    .pushReplacementNamed(OrdersScreen.routeName);
              })),
          Divider(),
          ListTile(
              leading: Icon(Icons.edit),
              title: Text('Manage Products'),
              onTap: (() {
                Navigator.of(context)
                    .pushReplacementNamed(UserProductsScreen.routeName);
              }))
        ],
      ),
    );
  }
}
