import 'package:coffee_ui_dribble_clone/widgets/coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        leading: Icon(Icons.menu),
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.person),
          ),
        ],
      ),
      body: Column(
        children: [
          // text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Find the best coffee for you",
              style: GoogleFonts.bebasNeue(fontSize: 56),
            ),
          ),

          SizedBox(height: 25),

          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              cursorColor: Colors.orange,
              decoration: InputDecoration(
                hintText: "Find you coffee..",
                prefixIconColor: Colors.orange,
                prefixIcon: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade500),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade500),
                ),
              ),
            ),
          ),

          // coffee lists
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                  imgPath:
                      'assets/images/jonas-jacobsson-RFHFV7lVQBY-unsplash.jpg',
                ),
                CoffeeTile(
                  imgPath:
                      "assets/images/nathan-dumlao-c2Y16tC3yO8-unsplash.jpg",
                ),
                CoffeeTile(
                  imgPath: "assets/images/zarak-khan-69ilqMz0p1s-unsplash.jpg",
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
      ),
    );
  }
}
