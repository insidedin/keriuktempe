import 'package:flutter/material.dart';

class Homewava extends StatefulWidget {
  const Homewava({super.key});

  @override
  State<Homewava> createState() => _HomewavaState();
}

class _HomewavaState extends State<Homewava> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //konten slider
            Container(
              margin: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width *
                  0.9, // 90% dari lebar layar
              height: MediaQuery.of(context).size.height *
                  0.25, // 25% dari tinggi layar (opsional)
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  'assets/slider.png',
                  fit: BoxFit
                      .cover, // gunakan cover agar gambar tetap proporsional
                ),
              ),
            ),

            // konten menu
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // menuItem(Colors.blueAccent, Icons.dashboard, 'Dashboard'),
                  // menuItem(Colors.yellowAccent, Icons.shopping_bag, 'Product'),
                  // menuItem(Colors.pinkAccent, Icons.warning, 'Low Stock'),
                  // menuItem(
                  //     Colors.greenAccent, Icons.receipt_long, 'Transaction'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
