import 'package:ecommerce/screens/Products_Info.dart';
import 'package:ecommerce/screens/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          SizedBox.expand(child: Image.asset("x.jpg", fit: BoxFit.cover)),

          // Dark Overlay
          Container(color: const Color.fromARGB(82, 0, 0, 0)),

          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),

                  Text(
                    "Everything is",
                    style: GoogleFonts.lobsterTwo(
                      fontSize: 38,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w300,
                    ),
                  ),

                  Text(
                    "Luxurious",
                    style: GoogleFonts.chelseaMarket(
                      fontSize: 55,
                      color: const Color.fromARGB(255, 155, 245, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "with SofaNest",
                    style: GoogleFonts.lobsterTwo(
                      fontSize: 38,
                      color: Colors.white,
                    ),
                  ),

                  const Spacer(),

                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to next screen
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ProductPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        "Start",
                        style: GoogleFonts.robotoMono(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
