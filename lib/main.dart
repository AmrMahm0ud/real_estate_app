import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_app/bloc/home_bloc/home_bloc.dart';
import 'package:real_estate_app/bloc/home_bloc/home_repo.dart';
import 'package:real_estate_app/network/remote/dio_helper.dart';
import 'package:real_estate_app/ui/screen/home_screen/home_screen.dart';

void main() {
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (BuildContext context) => HomeBloc(HomeRepository()),
      child: MaterialApp(
        title: 'Real Estate',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
