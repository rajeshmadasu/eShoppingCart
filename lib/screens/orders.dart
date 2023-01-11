import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});
  static const routeName = "/orders";

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  // bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    //  _isLoading = true;
    //Future.delayed(Duration.zero).then((_) async {
    // Provider.of<Orders>(context, listen: false).fetchAndSetOrders()
    //     .then((value) => {
    //           setState(() {
    //         //    _isLoading = false;
    //           })
    //         });
  }

  @override
  Widget build(BuildContext context) {
    //final orderData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: FutureBuilder(
          future:
              Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
          builder: (context, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (dataSnapshot.error != null) {
                return const Center(
                  child: Text('Something went wrong...'),
                );
              } else {
                return Consumer<Orders>(
                    builder: (ctx, orderData, child) => ListView.builder(
                          itemBuilder: (ctx, index) =>
                              OrderItem(order: orderData.orders[index]),
                          itemCount: orderData.orders.length,
                        ));
              }
            }
          }),
      drawer: AppDrawer(),
    );
  }
}
