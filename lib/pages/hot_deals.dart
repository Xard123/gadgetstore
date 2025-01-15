import 'package:flutter/material.dart';
import 'package:game_store/components/appbar/custom_appbar.dart';
import 'package:game_store/components/carousel/carousel.dart';
import 'package:game_store/components/categories/categories.dart';
import 'package:game_store/components/products/product_card.dart';
import 'package:game_store/components/products/products_list_grid.dart';
import 'package:game_store/data/data.dart';
import 'package:game_store/functions/functions.dart';
import 'package:google_fonts/google_fonts.dart';

class HotDeals extends StatelessWidget {
  const HotDeals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppbar(),
                const SizedBox(height: 30),

                // Hot Deals Title
                Row(
                  children: [
                    Text(
                      "Hot Deals",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Carousel
                const Carousel(),
                const SizedBox(height: 25),

                // Featured Title
                Row(
                  children: [
                    Text(
                      "Featured",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Featured Products Carousel
                
// Featured Products Carousel
SizedBox(
  height: MediaQuery.of(context).size.height * 0.25, // 25% dari tinggi layar
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: data.length > 7 ? 7 : data.length, // Maksimal 7 item
    itemBuilder: (context, index) {
      final String img = data[index]["src"];
      final String productName = data[index]["name"];
      final price = generateRandomPrice();
      return Padding(
        padding: const EdgeInsets.only(right: 15.0), // Jarak antar item
        child: ProductCard(
          img: img,
          productName: productName,
          price: price,
        ),
      );
    },
  ),
),



                // Categories Section
                const Categories(),
                const SizedBox(height: 30),

                // Product Grid Section
                const Text(
                  "Explore More Products",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,  // Adjust height dynamically
                  width: MediaQuery.of(context).size.width,
                  child: const ProductGrid(limit: 4),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
