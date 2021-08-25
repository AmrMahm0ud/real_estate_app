import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:real_estate_app/bloc/home_bloc/home_bloc.dart';
import 'package:real_estate_app/bloc/home_bloc/home_event.dart';
import 'package:real_estate_app/bloc/home_bloc/home_state.dart';
import 'package:real_estate_app/model/property_model.dart';
import 'package:real_estate_app/model/slider_model.dart';
import 'package:real_estate_app/ui/widget/item_card_widget.dart';
import 'package:real_estate_app/ui/widget/silder_images.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getHomeData();
  }

  List<PropertyModel> propertyList = [];
  List<SliderModel> sliderList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      appBar: appBarWidget(),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is ErrorHomeState) {
            buildToastMessage(state.message);
          } else if (state is NetworkErrorHomeState) {
            buildToastMessage(state.message);
          }
        },
        builder: (context, state) {
          if (state is ReceivedHomeDataState) {
            propertyList = state.propertyListModel;
            sliderList = state.sliderListModel;
            return buildHomeBodyWidget(
                propertyListModel: state.propertyListModel,
                sliderListModel: state.sliderListModel);
          } else if (state is HomeLoadingState) {
            return loadingWidget();
          } else {
            return defaultWidget();
          }
        },
      ),
      bottomNavigationBar: bottomNavigationBar(),
      floatingActionButton: floatingActionButtonWidget(),
    );
  }

  ///////////////////////////////////////
  ////////////// Helper Widgets//////////
  ///////////////////////////////////////

  Widget defaultWidget() {
    if (propertyList.length == 0 || sliderList.length == 0) {
      return Container();
    } else {
      return buildHomeBodyWidget(
          propertyListModel: propertyList, sliderListModel: sliderList);
    }
  }

  Widget buildHomeBodyWidget(
      {List<PropertyModel> propertyListModel,
      List<SliderModel> sliderListModel}) {
    return Stack(
      children: [
        ListView.builder(
            itemCount: propertyListModel.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return SliderImagesWidget(sliderListModel);
              }
              index--;
              return ItemCardWidget(
                price: propertyListModel[index].price,
                address: propertyListModel[index].address,
                bathRooms: propertyListModel[index].bathRooms,
                areaSpace: propertyListModel[index].areaSpace,
                bedRooms: propertyListModel[index].bedRooms,
                category: propertyListModel[index].category,
                sliderCardImages: propertyListModel[index].propertyImages,
              );
            }),
        sortButtonWidget(),
      ],
    );
  }

  Widget loadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget sortButtonWidget() {
    return Positioned(
      top: 2.0,
      right: 12.0,
      child: Container(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              side: BorderSide(width: 1.5, color: Color(0xff026A83)),
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9))),
          child: Row(
            children: [
              Text(
                "Sort",
                style: TextStyle(color: Color(0xff026A83), fontSize: 12),
              ),
              Icon(
                Icons.sort,
                color: Color(0xff026A83),
                size: 20,
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
      height: 35,
      width: 70,
      child: FloatingActionButton.extended(
        backgroundColor: Color(0xff026A83),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
      toolbarHeight: 65,
      elevation: 0.0, // Set this height
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
      height: 35,
      width: 335,
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "e.g. Abu Dhabi",
          labelStyle: TextStyle(
              color: Colors.black26, fontWeight: FontWeight.bold, fontSize: 15),
          prefixIcon: const Icon(
            Icons.search,
            size: 22,
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
                style: TextStyle(color: Color(0xff026A83), fontSize: 13),
              ),
              Icon(
                Icons.filter_list_outlined,
                color: Color(0xff026A83),
                size: 22,
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
            Icons.arrow_drop_down_outlined,
            color: Color(0xff026A83),
          ),
        ],
      ),
    );
  }

/////////////////////////////////////////
////////////helper function///////////////
/////////////////////////////////////////
  void getHomeData() {
    BlocProvider.of<HomeBloc>(context).add(GetHomeDataEvent());
  }

  void buildToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
