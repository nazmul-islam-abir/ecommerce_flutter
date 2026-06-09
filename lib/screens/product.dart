import 'package:ecommerce/screens/Products2_info.dart';
import 'package:ecommerce/screens/Products_Info.dart';
import 'package:ecommerce/screens/product_details.dart';
import 'package:ecommerce/screens/product_details2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Stay With SofaNest",
                        style: GoogleFonts.robotoMono(
                          fontSize: w * 0.08,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.search),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  height: 160,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "30% Off",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text("Until July 24"),
                          SizedBox(height: 10),
                          Container(
                            height: 35,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductsScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    12.0,
                                  ), // Rounded corners
                                ),
                              ),
                              child: Text(
                                "Get Now",
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    255,
                                    255,
                                    255,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // IMAGE
                      Image.asset("g.png", width: 120, fit: BoxFit.contain),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  height: 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      Category(icon: Icons.chair, selected: true),
                      Category(icon: Icons.bed),
                      Category(icon: Icons.light),
                      Category(icon: Icons.park),
                      Category(icon: Icons.weekend),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // 🔥 POPULAR TITLE
                const Text(
                  "Popular",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                // 🛍 GRID
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 0.75,
                  children: const [
                    ProductCard(
                      name: "Dr. White Chair",
                      price: "130.00",
                      image: "f.png",
                      screen: ProductsScreen2(),
                    ),
                    ProductCard(
                      name: "Gray Smoke Chair",
                      price: "130.00",
                      image: "g.png",
                      screen: ProductsScreen(),
                    ),
                    ProductCard(
                      name: "Blue Sofa",
                      price: "200.00",
                      image: "a.png",
                      screen: ProductsScreen2(),
                    ),
                    ProductCard(
                      name: "Yellow Chair",
                      price: "99.00",
                      image: "e.png",
                      screen: ProductsScreen(),
                    ),

                    ProductCard(
                      name: "Blue Sofa",
                      price: "200.00",
                      image: "d.webp",
                      screen: ProductsScreen2(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.circle_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final IconData icon;
  final bool selected;

  const Category({super.key, required this.icon, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: selected ? Colors.green : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: selected ? Colors.white : Colors.black),
    );
  }
}

// 🛍 PRODUCT CARD
class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final Widget screen;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Icon(Icons.favorite_border),
          ),

          Expanded(child: Center(child: Image.asset(image))),

          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),

          Text("\$$price"),
          SizedBox(height: 5),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => screen),
                  );
                },
                icon: Icon(CupertinoIcons.shopping_cart,color: Colors.redAccent,),
              ),
              SizedBox(width: 5),
              Text("Buy Product"),
            ],
          ),
        ],
      ),
    );
  }
}
