import 'package:flutter/material.dart';

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
              child: const Text("Cart ({currentUser.cart.length})"))
        ],
      ),
    );
  }
}
