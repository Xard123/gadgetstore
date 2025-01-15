import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_store/components/carousel/carousel.dart';
import 'package:game_store/components/appbar/custom_appbar.dart';
import 'package:game_store/components/categories/categories.dart';
import 'package:game_store/components/products/products_list_grid.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Light background color for the scaffold
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: const CustomAppbar(),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Greeting Section
                Row(
                  children: [
                    Text(
                      "Hello",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 0, 0, 0),  // Darker color for text on light background
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Bowo",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.black,  // Bold text color
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Carousel
                const Carousel(),
                const SizedBox(height: 20),

                // Categories
                const Categories(),
                const SizedBox(height: 20),

                // Products Section
                const SizedBox(height: 20),
                const Text(
                  'Featured Products',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  height: 400,
                  child: ProductGrid(),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
