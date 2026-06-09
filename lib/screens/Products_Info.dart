import 'package:ecommerce/screens/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 5, 44, 17),
                      Color.fromARGB(255, 63, 81, 61),
                      Color.fromARGB(255, 40, 87, 60),
                    ],
                    stops: [0.5, 0.9, 1],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              CupertinoIcons.back,
                              color: Colors.white,
                            ),
                          ),

                          Icon(CupertinoIcons.list_bullet, color: Colors.white),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    Text(
                      'Make Spaces For Something Better',
                      style: GoogleFonts.ebGaramond(
                        fontSize: screenWidth * 0.1,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(202, 255, 255, 255),
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 100),

                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),

                        Positioned(
                          top: -screenWidth * 0.40,
                          left: screenWidth * 0.01,
                          right: screenWidth * 0.01,

                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            color: const Color.fromARGB(0, 255, 99, 99),

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('g.png', fit: BoxFit.cover),
                                Text(
                                  "Single Green Sofa",
                                  style: GoogleFonts.robotoMono(
                                    fontSize: screenWidth * 0.055,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(
                                      255,
                                      12,
                                      97,
                                      29,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Price: 5000 Tk",
                                  style: GoogleFonts.robotoMono(
                                    fontSize: screenWidth * 0.045,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -screenWidth * 0.1,
                          left: screenWidth * 0.01,
                          right: screenWidth * 0.01,
                          child: Container(
                            width: screenWidth * 0.18,
                            height: screenWidth * 0.18,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              shape: BoxShape.circle,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SofaDetailsPage(),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    CupertinoIcons.shopping_cart,
                                    size: screenWidth * 0.1,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Positioned(
                          left: 5,
                          right: 5,
                          bottom: -130,
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Text(
                                    "Shop More..",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: const Image(
                                          image: AssetImage("a.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 5),

                                      SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: const Image(
                                          image: AssetImage("c.webp"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 5),

                                      SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: const Image(
                                          image: AssetImage("b.webp"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 5),

                                      SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: const Image(
                                          image: AssetImage("e.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(
              icon: Icon(Icons.circle_outlined),
              label: "",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ],
        ),
      ),
    );
  }
}
