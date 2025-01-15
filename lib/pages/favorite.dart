import 'package:flutter/material.dart';
import 'package:game_store/components/appbar/custom_appbar.dart';
import 'package:game_store/components/categories/categories.dart';
import 'package:game_store/components/products/products_list_grid.dart';
import 'package:google_fonts/google_fonts.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        primary: true,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // AppBar
                const CustomAppbar(),
                const SizedBox(height: 30),

                // Favorite Title
                Row(
                  children: [
                    Text(
                      "Favorite",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                // Categories Section
                const Categories(),
                const SizedBox(height: 30),

                // Product Grid Section
                const Text(
                  "Your Favorite Products",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,  // Adjust height dynamically
                  width: MediaQuery.of(context).size.width,
                  child: const ProductGrid(limit: 5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
