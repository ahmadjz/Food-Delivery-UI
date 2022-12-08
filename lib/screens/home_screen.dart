import 'package:flutter/material.dart';
import 'package:food_delivery_ui/data/data.dart';
import 'package:food_delivery_ui/widgets/nearby_restaurants.dart';
import 'package:food_delivery_ui/widgets/recent_orders.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Delivery"),
        leading: IconButton(
          icon: const Icon(
            Icons.account_circle,
          ),
          iconSize: 30,
          onPressed: () {},
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Cart (${currentUser.cart.length})",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ))
        ],
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsetsDirectional.all(20.0),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 15),
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                    width: 0.8, color: Theme.of(context).primaryColor),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(width: 0.8),
              ),
              hintText: 'Search Food or Restaurants',
              prefixIcon: const Icon(
                Icons.search,
                size: 30.0,
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {},
              ),
            ),
          ),
        ),
        const RecentOrders(),
        const NearbyRestaurants()
      ]),
    );
  }
}
