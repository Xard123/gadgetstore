import 'package:flutter/material.dart';
import 'package:game_store/components/profile/identity.dart';
import 'package:game_store/components/profile/profile_menu_row.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Row(
                  children: [
                    Text(
                      "Account",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Identity Section
                const Identity(),
                const SizedBox(height: 30),

                // Profile Settings Menu
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // Menu items with separators
                        MenuRow(icon: Icons.dark_mode, text: "Dark Mode"),
                        const Divider(),
                        MenuRow(icon: Icons.card_giftcard_outlined, text: "Orders"),
                        const Divider(),
                        MenuRow(icon: Icons.history, text: "Purchase History"),
                        const Divider(),
                        MenuRow(icon: Icons.payment, text: "Payment Methods"),
                        const Divider(),
                        MenuRow(icon: Icons.privacy_tip, text: "Privacy"),
                        const Divider(),
                        MenuRow(icon: Icons.person, text: "Personal Info"),
                        const Divider(),
                        MenuRow(icon: Icons.reviews_sharp, text: "Rewards"),
                        const Divider(),
                        MenuRow(icon: Icons.settings, text: "Settings"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
