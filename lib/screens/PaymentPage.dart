import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selected = "card";

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          CupertinoIcons.back,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                        
                      Icon(
                        CupertinoIcons.list_bullet,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
                 const SizedBox(height: 10),
      
                Text(
                  "Payment Information",
                  style: GoogleFonts.robotoMono(
                    fontSize: w * 0.055,
                    fontWeight: FontWeight.bold,
                  ),
                ),
      
                const SizedBox(height: 10),
      
                Text(
                  "Please fill in your details carefully. "
                  "Your information will be used for order delivery and payment confirmation.",
                  style: GoogleFonts.robotoMono(
                    fontSize: 12,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  textAlign: TextAlign.start,
                ),
      
                const SizedBox(height: 25),
                Text(
                  "Total = 5000 Tk",
                  style: GoogleFonts.robotoMono(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
      
                const SizedBox(height: 25),
      
                // 🧾 NAME
                const Text("Name"),
                const SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      
                    ),
                    hintText: 'Md. Nazmul Islam'
                  ),
                ),
      
                const SizedBox(height: 15),
      
                const Text("Phone"),
                const SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: '+8801537324384'
                  ),
                ),
      
                const SizedBox(height: 15),
      
                const Text("Address"),
                const SizedBox(height: 5),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Halishahar , Chittagong , Bangladesh'
                  ),
                ),
      
                const SizedBox(height: 20),
      
                SizedBox(
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 0, 0),
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
                "Add Information",
                style: GoogleFonts.robotoMono(
                  fontSize: w * 0.045,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      
                const SizedBox(height: 25),
      
                Text(
                  "Payment Method",
                  style: GoogleFonts.robotoMono(
                    fontSize: w * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
      
                const SizedBox(height: 15),
      
                // 💳 CARD
                GestureDetector(
                  onTap: () {
                    setState(() => selected = "card");
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: selected == "card" ? Colors.black : Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.credit_card),
                        SizedBox(width: 10),
                        Text("Credit / Debit Card"),
                      ],
                    ),
                  ),
                ),
      
                // 💗 BKASH
                GestureDetector(
                  onTap: () {
                    setState(() => selected = "bkash");
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: selected == "bkash" ? Colors.black : Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.account_balance_wallet),
                        SizedBox(width: 10),
                        Text("bKash"),
                      ],
                    ),
                  ),
                ),
      
                // 🟠 NAGAD
                GestureDetector(
                  onTap: () {
                    setState(() => selected = "nagad");
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: selected == "nagad" ? Colors.black : Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.phone_android),
                        SizedBox(width: 10),
                        Text("Nagad"),
                      ],
                    ),
                  ),
                ),
      
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      
        // 💰 PAY BUTTON
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
