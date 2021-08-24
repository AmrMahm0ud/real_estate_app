import 'package:flutter/material.dart';
import 'package:real_estate_app/ui/widget/silder_images.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      appBar: appBarWidget(),
      body: Stack(
        children: [
          homeWidget(),
          sortButtonWidget(),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar(),
      floatingActionButton: floatingActionButtonWidget(),
    );
  }

  ///////////////////////////////////////
  ////////////// Helper Widgets//////////
  ///////////////////////////////////////

  Widget homeWidget() {
    return ListView(
      children: [
        SliderImagesWidget(),
        Text("test"),
        Text("test"),
        Text("test"),
        Text("test"),
      ],
    );
  }

  Widget sortButtonWidget() {
    return Positioned(
      top: 2.0,
      right: 5.0,
      child: Container(
        width: 83,
        height: 40,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              side: BorderSide(width: 1.5, color: Color(0xff026A83)),
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0))),
          child: Row(
            children: [
              Text(
                "Sort",
                style: TextStyle(color: Color(0xff026A83)),
              ),
              Icon(
                Icons.sort,
                color: Color(0xff026A83),
              ),
            ],
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget floatingActionButtonWidget() {
    return SizedBox(
      height: 40,
      width: 80,
      child: FloatingActionButton.extended(
        backgroundColor: Color(0xff026A83),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        icon: Icon(Icons.location_on),
        label: Text("Map"),
        onPressed: () {},
      ),
    );
  }

  Widget bottomNavigationBar() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.post_add), label: "Post Ad"),
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity_rounded), label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: "Favourites"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
        currentIndex: 0,
        unselectedItemColor: Colors.grey,
        fixedColor: Color(0xff026A83),
      ),
    );
  }

  Widget appBarWidget() {
    return AppBar(
      toolbarHeight: 80, // Set this height
      flexibleSpace: Container(
        color: Color(0xffF9F9F9),
        child: Column(
          children: [
            SizedBox(
              height: 30.0,
            ),
            rentWidget(),
            searchWidget()
          ],
        ),
      ),
    );
  }

  Widget searchWidget() {
    return Container(
      height: 40,
      width: 335,
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "e.g. Abu Dhabi",
          labelStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xff026A83),
          ),
          suffixIcon: filterWidget(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }

  Widget filterWidget() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 80,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Filter",
                style: TextStyle(color: Color(0xff026A83)),
              ),
              Icon(
                Icons.filter_list_outlined,
                color: Color(0xff026A83),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget rentWidget() {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Rent",
            style: TextStyle(color: Color(0xff026A83)),
          ),
          Icon(
            Icons.arrow_drop_down_sharp,
            color: Color(0xff026A83),
          ),
        ],
      ),
    );
  }
/////////////////////////////////////////
////////////helper function///////////////
/////////////////////////////////////////

}
