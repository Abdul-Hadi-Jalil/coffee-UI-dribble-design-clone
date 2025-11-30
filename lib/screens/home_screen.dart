import 'package:coffee_ui_dribble_clone/widgets/coffee_tile.dart';
import 'package:coffee_ui_dribble_clone/widgets/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List coffeeTypes = [
    ['Cappucino', true],
    ['Latte', false],
    ['Black', false],
    ['Tea', false],
  ];

  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeTypes.length; i++) {
        coffeeTypes[i][1] = false;
      }

      coffeeTypes[index][1] = true;
    });
  }

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

          // coffee types
          Container(
            margin: const EdgeInsets.only(top: 25),
            height: 30,
            child: ListView.builder(
              itemCount: coffeeTypes.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CoffeeType(
                  coffeeName: coffeeTypes[index][0],
                  isSelected: coffeeTypes[index][1],
                  onTap: () {
                    coffeeTypeSelected(index);
                  },
                );
              },
            ),
          ),

          // coffee list
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                  coffeeName: "Cappucino",
                  coffeePrice: '\$4.00',
                  imgPath:
                      'assets/images/jonas-jacobsson-RFHFV7lVQBY-unsplash.jpg',
                ),
                CoffeeTile(
                  coffeePrice: '\$5.00',
                  coffeeName: "Latte",
                  imgPath:
                      "assets/images/nathan-dumlao-c2Y16tC3yO8-unsplash.jpg",
                ),
                CoffeeTile(
                  coffeePrice: '\$4.50',
                  coffeeName: "Black",
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
