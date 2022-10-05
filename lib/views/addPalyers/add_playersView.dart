import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:players_task/views/addPalyers/cubits/cubits.dart';
import 'package:players_task/views/addPalyers/models/model.dart';
import 'package:players_task/views/addPalyers/states/states.dart';
import 'package:players_task/views/addPalyers/widgets/bodyList.dart';
import 'package:players_task/views/addPalyers/widgets/playersTapBar.dart';
import 'package:players_task/views/addPalyers/widgets/searchTextField.dart';
import 'package:players_task/views/addPalyers/widgets/user_component.dart';

class AddPlayers extends StatefulWidget {
  @override
  State<AddPlayers> createState() => _AddPlayersState();
}
List<Users>? search;

class _AddPlayersState extends State<AddPlayers> {


  @override

  Widget build(BuildContext context) {

  final  List<Users> search= [];

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Text("Add players",
              style: TextStyle(color: Colors.black),),
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body:  Column(
            children: [
              PlayersTapBar(),
              SearchTextField(),

              BodyList(),
            ],
          ),



    );
  }
//   void  check(String text){
//     print("sdsdsdddddddddddddddddd");
//     final suggestion=HomeCubit.of(context).homeModel!.users.where((user){
//       final firestname= user.firstName.toLowerCase();
//
//       final input =text.toLowerCase();
//       print("firestname"+firestname.toString());
//       print(input.toString());
//
//       return firestname.contains(input);
//     }).toList();
//     setState(() {
//       search=suggestion;
//       print(suggestion.toList().length);
//       print(search![0].address.address.toString());
//
//
//     });
// print(search![0].address.address+"222222222222333333333333");
//
//   }

}
