import 'package:ecommerce/screens/product.dart';
import 'package:ecommerce/screens/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  final List<OrderData> orders = const [
    OrderData(
      status: 'Delivered',
      store: 'SofaNest Warehouse - Jakarta',
      destination: 'Shipping to: Bandung',
      date: 'Thursday, 5 Jun 2025',
      time: '14:32',
      items: ['1x Cosy 3-Seater Sofa'],
      itemCount: 1,
      totalPrice: 'IDR 3.499.000',
    ),
    OrderData(
      status: 'Processing',
      store: 'SofaNest Warehouse - Surabaya',
      destination: 'Shipping to: Semarang',
      date: 'Friday, 6 Jun 2025',
      time: '10:15',
      items: ['1x Velvet Accent Chair', '1x Ottoman'],
      itemCount: 2,
      totalPrice: 'IDR 2.299.000',
    ),
    OrderData(
      status: 'Shipped',
      store: 'SofaNest Warehouse - Bandung',
      destination: 'Shipping to: Yogyakarta',
      date: 'Saturday, 7 Jun 2025',
      time: '08:50',
      items: ['1x Modern Corner Sofa'],
      itemCount: 1,
      totalPrice: 'IDR 4.750.000',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Order',
          style: GoogleFonts.robotoMono(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune, color: Color(0xFF9B5E33)),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        itemCount: orders.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final order = orders[index];
          return OrderCard(order: order);
        },
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

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order});

  final OrderData order;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2F943C),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    order.status,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    textStyle: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  child: const Text('See Details'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              order.store,
              style: GoogleFonts.robotoMono(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (order.destination.isNotEmpty)
              Text(
                order.destination,
                style: GoogleFonts.robotoMono(
                  color: Colors.grey[700],
                  fontSize: 14,
                ),
              ),
            const SizedBox(height: 8),
            Text(
              '${order.date} • ${order.time}',
              style: GoogleFonts.robotoMono(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 12),
            Text(
              order.items.join(', '),
              style: GoogleFonts.robotoMono(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const Divider(height: 24, thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${order.itemCount} Item',
                  style: GoogleFonts.robotoMono(fontWeight: FontWeight.bold),
                ),
                Text(
                  order.totalPrice,
                  style: GoogleFonts.robotoMono(fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Color(0xFF9B5E33)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Re-Order',
                    style: GoogleFonts.robotoMono(
                      color: const Color(0xFF9B5E33),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OrderData {
  final String status;
  final String store;
  final String destination;
  final String date;
  final String time;
  final List<String> items;
  final int itemCount;
  final String totalPrice;

  const OrderData({
    required this.status,
    required this.store,
    required this.destination,
    required this.date,
    required this.time,
    required this.items,
    required this.itemCount,
    required this.totalPrice,
  });
}
