import 'package:flutter/material.dart';
import 'package:food_delivery_ui/models/food.dart';
import 'package:food_delivery_ui/models/restaurant.dart';
import 'package:food_delivery_ui/widgets/rating_stars.dart';
import 'package:food_delivery_ui/widgets/restaurant_menu_card.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key, required this.restaurant});
  final Restaurant restaurant;

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    final languageCode = Localizations.localeOf(context).languageCode;

    return Scaffold(
      body: Column(
        children: [
          _buildHeader(languageCode),
          ..._buildMiddlePart(),
          const SizedBox(height: 10.0),
          ..._buildMenu()
        ],
      ),
    );
  }

  List<Widget> _buildMenu() {
    return [
      const Center(
        child: Text(
          'Menu',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
      ),
      const SizedBox(height: 10.0),
      Expanded(
        child: GridView.count(
          padding: const EdgeInsets.all(10.0),
          crossAxisCount: 2,
          children: List.generate(widget.restaurant.menu.length, (index) {
            Food food = widget.restaurant.menu[index];
            return RestaurantMenuCard(food: food);
          }),
        ),
      )
    ];
  }

  List<Widget> _buildMiddlePart() {
    return [
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.restaurant.name,
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  '0.2 miles away',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            RatingStars(rating: widget.restaurant.rating),
            const SizedBox(height: 6.0),
            Text(
              widget.restaurant.address,
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            child: const Text(
              'Reviews',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            onPressed: () {},
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            child: const Text(
              'Contact',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    ];
  }

  Widget _buildHeader(String languageCode) {
    return Stack(
      children: [
        Hero(
          tag: widget.restaurant.imageUrl,
          child: Image(
            height: 220.0,
            width: MediaQuery.of(context).size.width,
            image: AssetImage(widget.restaurant.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(languageCode == 'en'
                    ? Icons.arrow_back_ios
                    : Icons.arrow_forward_ios),
                color: Colors.white,
                iconSize: 30.0,
                onPressed: () => Navigator.pop(context),
              ),
              IconButton(
                icon: const Icon(Icons.favorite),
                color: Theme.of(context).primaryColor,
                iconSize: 35.0,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
