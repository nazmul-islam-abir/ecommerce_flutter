import 'package:ecommerce/screens/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce/screens/orderlist.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget _orderItem(Color bg, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: bg.withOpacity(0.18),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.robotoMono(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F6F8),
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 230,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFEE2A6D), Color(0xFF9B2B7F)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36),
                      bottomRight: Radius.circular(36),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 14,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // White semicircle overlay bottom
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -35,
                  child: Center(
                    child: Container(
                      width: w * 0.94,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 36.0),
                        child: Column(
                          children: [
                            Text(
                              'Nazmul Islam Abir',
                              style: GoogleFonts.robotoMono(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Buyer',
                              style: GoogleFonts.robotoMono(
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Profile avatar with camera badge
                Positioned(
                  left: (w / 2) - 50,
                  bottom: -110,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 50,

                        backgroundImage: NetworkImage(
                          'https://t4.ftcdn.net/jpg/06/08/55/73/360_F_608557356_ELcD2pwQO9pduTRL30umabzgJoQn5fnd.jpg',
                        ), // replace with asset if needed
                      ),
                      Positioned(
                        right: -6,
                        bottom: -6,
                        child: Material(
                          elevation: 3,
                          shape: const CircleBorder(),
                          child: InkWell(
                            onTap: () {},
                            customBorder: const CircleBorder(),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.camera_alt, size: 18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 80),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Orders',
                      style: GoogleFonts.robotoMono(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 14),
                    GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 18,
                            crossAxisSpacing: 18,
                            childAspectRatio: 0.95,
                          ),
                      children: [
                        _orderItem(
                          const Color(0xFF4EC0FF),
                          Icons.account_balance_wallet,
                          'Pending\nPayment',
                        ),
                        _orderItem(
                          const Color(0xFFFFC85A),
                          Icons.local_shipping,
                          'Delivered',
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const OrderListPage(),
                              ),
                            );
                          },
                          child: _orderItem(
                            const Color(0xFFFF6B8A),
                            Icons.timelapse,
                            'Processing',
                          ),
                        ),
                        _orderItem(
                          const Color(0xFF72E28B),
                          Icons.cancel,
                          'Cancelled',
                        ),
                        _orderItem(
                          const Color(0xFFFF6FA3),
                          Icons.favorite_border,
                          'Wishlist',
                        ),
                        _orderItem(
                          const Color(0xFF8EA7FF),
                          Icons.support_agent,
                          'Customer\nCare',
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(
                              Icons.person_outline,
                              color: Colors.black54,
                            ),
                            title: Text(
                              'Edit Profile',
                              style: GoogleFonts.robotoMono(),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),
                            onTap: () {},
                          ),
                          const Divider(height: 1),
                          ListTile(
                            leading: const Icon(
                              Icons.location_on_outlined,
                              color: Colors.black54,
                            ),
                            title: Text(
                              'Shipping Address',
                              style: GoogleFonts.robotoMono(),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),
                    Center(
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.logout, color: Colors.black54),
                        label: Text(
                          'Logout',
                          style: GoogleFonts.robotoMono(
                            color: const Color.fromARGB(255, 255, 0, 0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 36),
                  ],
                ),
              ),
            ),
          ],
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
            BottomNavigationBarItem(
              icon: const Icon(Icons.favorite),
              label: "",
            ),
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
      ),
    );
  }
}
