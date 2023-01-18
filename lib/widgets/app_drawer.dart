import 'package:eshopingcart/providers/auth.dart';
import 'package:eshopingcart/screens/UserProductsScreen.dart';
import 'package:provider/provider.dart';

import '../screens/orders.dart';
import 'package:flutter/material.dart';
import '../helpers/custom_route.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('eShopping Cart'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.shop),
              title: const Text('Shop'),
              onTap: (() {
                Navigator.of(context).pushReplacementNamed('/');
              })),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('Orders'),
              onTap: (() {
                // Navigator.of(context)
                //     .pushReplacementNamed(OrdersScreen.routeName);

                Navigator.of(context).pushReplacement(
                    CustomRoute(builder: (context) => OrdersScreen()));
              })),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Manage Products'),
              onTap: (() {
                Navigator.of(context)
                    .pushReplacementNamed(UserProductsScreen.routeName);
              })),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: (() {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed("/");
                Provider.of<Auth>(context, listen: false).logout();
              })),
        ],
      ),
    );
  }
}
