import 'package:ecommerce/screens/PaymentPage.dart';
import 'package:ecommerce/screens/product.dart';
import 'package:ecommerce/screens/profileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SofaDetailsPage extends StatefulWidget {
  const SofaDetailsPage({super.key});

  @override
  State<SofaDetailsPage> createState() => _SofaDetailsPageState();
}

class _SofaDetailsPageState extends State<SofaDetailsPage> {
  final TextEditingController chatController = TextEditingController();
  final List<String> chatList = [];

  @override
  void dispose() {
    chatController.dispose();
    super.dispose();
  }

  void addChat() {
    if (chatController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Chat Missing'),
          content: const Text("Add your questions"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    setState(() {
      chatList.add(chatController.text.trim());
      chatController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Color.fromARGB(255, 5, 44, 17),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
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

                            Icon(
                              CupertinoIcons.list_bullet,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      width: double.infinity,
                      height: h * 0.4,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 5, 44, 17),
                            Color.fromARGB(255, 40, 87, 60),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          'g.png',
                          height: h * 0.3,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Single Green Sofa",
                            style: GoogleFonts.robotoMono(
                              fontSize: w * 0.06,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            "Price: 5000 Tk",
                            style: GoogleFonts.robotoMono(
                              fontSize: w * 0.05,
                              color: const Color.fromARGB(255, 23, 76, 25),
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const SizedBox(height: 20),

                          Text(
                            "Select Color",
                            style: GoogleFonts.robotoMono(
                              fontSize: w * 0.05,
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          Container(
                            child: Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      255,
                                      54,
                                      174,
                                      244,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      255,
                                      37,
                                      150,
                                      255,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(width: 5),
                              ],
                            ),
                          ),

                          const SizedBox(height: 30),
                          Text(
                            "Description",
                            style: GoogleFonts.robotoMono(
                              fontSize: w * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            "This premium quality sofa is designed for modern homes. "
                            "It offers comfort, durability, and elegant design that fits any living room interior.",
                            style: GoogleFonts.robotoMono(
                              fontSize: w * 0.04,
                              color: Colors.black87,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 23, 76, 25),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const PaymentPage(),
                                  ),
                                );
                              },
                              child: Text(
                                'Proceed to Payment',
                                style: GoogleFonts.robotoMono(
                                  fontSize: w * 0.045,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            controller: chatController,
                            decoration: InputDecoration(
                              hintText: "Chat With Seller",
                              prefixIcon: const Icon(
                                Icons.chat_bubble,
                                color: Colors.black,
                              ),
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.send,
                                  color: Colors.black,
                                ),
                                onPressed: addChat,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            if (chatList.isNotEmpty)
              SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: chatList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(CupertinoIcons.person),
                      title: Text(
                        chatList[index],
                        style: GoogleFonts.lobsterTwo(),
                      ),
                      dense: true,
                    );
                  },
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
