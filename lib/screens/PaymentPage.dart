import 'package:ecommerce/screens/orderlist.dart';
import 'package:ecommerce/screens/product.dart';
import 'package:ecommerce/screens/profileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final List<String> address_Info =[];

  void add_Adress() {
    if (nameController.text.trim().isEmpty ||
        numberController.text.trim().isEmpty ||
        addressController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title:  Text('Missing information'),
          content:  Text(
            'Please fill in name, phone number, and address before adding.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    } else {
      setState(() {
        final fullAddress =
            "Name: ${nameController.text.trim()}\n"
            "Phone: ${numberController.text.trim()}\n"
            "Address: ${addressController.text.trim()}";

        address_Info.add(fullAddress);

        nameController.clear();
        numberController.clear();
        addressController.clear();
      });
    }
  }

  void remove_add(int index) {
    setState(() {
      address_Info.removeAt(index);
    });
  }

  void show_snackbar(String address_Info) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(address_Info)));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(address_Info)));
  }

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    numberController.dispose();
    super.dispose();
  }

  String selected = "select Payment";

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
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          CupertinoIcons.back,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      const Icon(
                        CupertinoIcons.list_bullet,
                        color: Color.fromARGB(255, 0, 0, 0),
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

                const Text("Name"),
                const SizedBox(height: 5),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Md. Nazmul Islam',
                  ),
                ),

                const SizedBox(height: 15),

                const Text("Phone Number"),
                const SizedBox(height: 5),
                TextField(
                  controller: numberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: '+8801537324384',
                  ),
                ),

                const SizedBox(height: 15),

                const Text("Address"),
                const SizedBox(height: 5),
                TextField(
                  controller: addressController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Halishahar , Chittagong , Bangladesh',
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
                    onPressed: add_Adress,
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

                address_Info.isEmpty
                    ? const SizedBox.shrink()
                    : Container(
                        height: 300,
                        child: ListView.builder(
                          itemCount: address_Info.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                show_snackbar(address_Info[index]);
                              },
                              onLongPress: () {
                                remove_add(index);
                              },
                              child: Card(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    child: Text("${index + 1}"),
                                  ),
                                  title: Text(address_Info[index]),
                                  subtitle: const Text(
                                    "Tap to view, long press to delete",
                                  ),
                                  trailing: const Icon(Icons.quiz),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                Text(
                  "Payment Method",
                  style: GoogleFonts.robotoMono(
                    fontSize: w * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                GestureDetector(
                  onTap: () {
                    setState(() => selected = "select Payment");
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 187, 255),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.select_all),
                        SizedBox(width: 10),
                        Text("select Payment"),
                      ],
                    ),
                  ),
                ),

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

                const SizedBox(height: 10),

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
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Confirming Your Order")),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderListPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Confirm Order",
                      style: GoogleFonts.robotoMono(
                        fontSize: w * 0.045,
                        color: Colors.white,
                      ),
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
