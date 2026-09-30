import 'package:flutter/material.dart';

// Each teammate's detail page
import '/pixel.dart';
import '/laptop.dart';
import '/tablet.dart';
import '/pendrive.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Navigation'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: const [
          ProductItem(
            name: 'Pixel',
            description: 'Pixel is the most featureful phone ever',
            price: 800,
            rating: 3,
            color: Colors.blue,
            page: PixelPage(),
          ),
          ProductItem(
            name: 'Laptop',
            description: 'Laptop is most productive development tool',
            price: 2000,
            rating: 2,
            color: Colors.green,
            page: LaptopPage(),
          ),
          ProductItem(
            name: 'Tablet',
            description: 'Tablet is the most useful device ever for meeting',
            price: 1500,
            rating: 3,
            color: Colors.lime,
            page: TabletPage(),
          ),
          ProductItem(
            name: 'Pendrive',
            description: 'Pendrive is the most stylish storage device',
            price: 100,
            rating: 1,
            color: Colors.deepOrange,
            page: PendrivePage(),
          ),
        ],
      ),
    );
  }
}

// One row in the list. Tapping it opens `page`.
class ProductItem extends StatelessWidget {
  final String name;
  final String description;
  final int price;
  final int rating;
  final Color color;
  final Widget page;

  const ProductItem({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.color,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // NAVIGATION: go to this product's own detail page
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: SizedBox(
          height: 120,
          child: Row(
            children: [
              Container(
                width: 140,
                color: color,
                alignment: Alignment.center,
                child: Text(
                  name.toLowerCase(),
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(description, textAlign: TextAlign.center),
                      Text('Price: $price'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (i) => Icon(
                            i < rating ? Icons.star : Icons.star_border,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
