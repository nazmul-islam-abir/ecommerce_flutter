import 'package:ecommerce/screens/Products2_info.dart';
import 'package:ecommerce/screens/Products_Info.dart';
import 'package:ecommerce/screens/profileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> originalProducts = [
    {
      'name': 'Dr. White Chair',
      'price': '130.00',
      'image': 'f.png',
      'screen': ProductsScreen2(),
    },
    {
      'name': 'Gray Smoke Chair',
      'price': '130.00',
      'image': 'g.png',
      'screen': ProductsScreen(),
    },
    {
      'name': 'Blue Sofa',
      'price': '200.00',
      'image': 'a.png',
      'screen': ProductsScreen2(),
    },
    {
      'name': 'Yellow Chair',
      'price': '99.00',
      'image': 'e.png',
      'screen': ProductsScreen(),
    },
    {
      'name': 'Blue Sofa',
      'price': '200.00',
      'image': 'd.webp',
      'screen': ProductsScreen2(),
    },
  ];

  List<Map<String, dynamic>> products = [];

  List<Map<String, dynamic>> get searchedProducts {
    final String query = searchController.text.trim().toLowerCase();

    if (query.isEmpty) {
      return products;
    }

    return products.where((product) {
      return product['name'].toString().toLowerCase().contains(query);
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    products = List.from(originalProducts);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void clearData() {
    setState(() {
      searchController.clear();
    });
  }

  void sortProducts() {
    setState(() {
      products.sort(
        (a, b) => double.parse(a['price']).compareTo(double.parse(b['price'])),
      );
    });
  }

  void clearSort() {
    setState(() {
      products = List.from(originalProducts);
    });
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final List<Map<String, dynamic>> visibleProducts = searchedProducts;

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
                        "SofaNest",
                        style: GoogleFonts.lobsterTwo(
                          fontSize: w * 0.08,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset("icon.webp", fit: BoxFit.cover),
                    ),
                  ],
                ),
               

                const SizedBox(height: 20),

                TextField(
                  controller: searchController,
                  onChanged: (_) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    labelText: 'Search Products',
                    hintText: 'Enter product name...',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      onPressed: clearData,
                      icon: Icon(Icons.clear),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                if (searchController.text.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      'Found ${visibleProducts.length} product(s)',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                if (searchController.text.isNotEmpty && visibleProducts.isEmpty)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: Column(
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 80,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No products found',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Try searching with different keywords',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                if (searchController.text.isEmpty) ...[
                  Container(
                    width: double.infinity,
                    height: 160,
                    padding: const EdgeInsets.all(16),
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
                            const Text(
                              "30% Off",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text("Until July 24"),
                            const SizedBox(height: 10),
                            Container(
                              height: 35,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ProductsScreen(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                child: const Text(
                                  "Get Now",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text(
                        "Popular",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: sortProducts,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                0,
                                0,
                                0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            child: const Text(
                              "Sort By Price",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 5),
                          ElevatedButton(
                            onPressed: clearSort,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                0,
                                0,
                                0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            child: Icon(Icons.clear, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],

                const SizedBox(height: 10),

                if (visibleProducts.isNotEmpty)
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 0.75,
                    children: visibleProducts.map((product) {
                      return ProductCard(
                        name: product['name'].toString(),
                        price: product['price'].toString(),
                        image: product['image'].toString(),
                        screen: product['screen'] as Widget,
                      );
                    }).toList(),
                  ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProductPage()),
                );
              },
              child: const Icon(Icons.home),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.circle_outlined),
            label: "",
          ),
          BottomNavigationBarItem(icon: const Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()),
                );
              },
              child: const Icon(Icons.person),
            ),
            label: "",
          ),
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

// Product Card Widget
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
          const Align(
            alignment: Alignment.topRight,
            child: Icon(Icons.favorite_border),
          ),
          Expanded(child: Center(child: Image.asset(image))),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text("\$$price"),
          const SizedBox(height: 5),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => screen),
                  );
                },
                icon: const Icon(
                  CupertinoIcons.shopping_cart,
                  color: Colors.redAccent,
                ),
              ),
              const SizedBox(width: 5),
              const Text("Buy Product"),
            ],
          ),
        ],
      ),
    );
  }
}
