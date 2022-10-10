import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:players_task/views/addPalyers/add_playersView.dart';
import 'package:players_task/views/addPalyers/cubits/cubits.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit()..getData(),
        ),

      ],

      child: MaterialApp(
        home: Home_widget(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
// new