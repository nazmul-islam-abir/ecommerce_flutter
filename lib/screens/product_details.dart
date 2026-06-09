import 'package:ecommerce/screens/PaymentPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SofaDetailsPage extends StatelessWidget {
  const SofaDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
      
        body: SingleChildScrollView(
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
                        icon: Icon(CupertinoIcons.back, color: Colors.white),
                      ),
      
                      Icon(CupertinoIcons.list_bullet, color: Colors.white),
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
                        color: Colors.green,
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
                              borderRadius: BorderRadius.circular(10)
                            ),
                          
                          ),
                          SizedBox(width: 5,),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 54, 174, 244),
                              borderRadius: BorderRadius.circular(10)
                            ),
                          
                          ),
                          SizedBox(width: 5,),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 37, 150, 255),
                              borderRadius: BorderRadius.circular(10)
                            ),
                          
                          ),
                          SizedBox(width: 5,),
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
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Chat With Seller",
                        prefixIcon: const Icon(Icons.chat_bubble, color: Color.fromARGB(255, 0, 0, 0)),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
      
                    const SizedBox(height: 120),
                  ],
                ),
              ),
              SizedBox(
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentPage()),
                );
              },
              child: Text(
                "Proceed to Payment",
                style: GoogleFonts.robotoMono(
                  fontSize: w * 0.045,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        
            ],
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
      ),
    );
  }
}
