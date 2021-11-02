import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    var bottomNavigationBar2 = BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: 'Recipes')
      ],
      iconSize: 30,
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
    );
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar2,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text('Looking for your favorite meal',
                              style:
                                  GoogleFonts.playfairDisplay(fontSize: 25))),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search),
                        color: Colors.grey[800],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.notifications_none),
                        color: Colors.grey[800],
                      )
                    ],
                  ),
                ),
                Container(
                  height: size.height * 0.25,
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return AspectRatio(
                          aspectRatio: 0.9 / 1,
                          child: Column(
                            children: [
                              Container(
                                color: Colors.grey,
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, _) => SizedBox(
                            width: 16,
                          ),
                      itemCount: 5),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
