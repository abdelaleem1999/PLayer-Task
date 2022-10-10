import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:players_task/views/addPalyers/cubits/cubits.dart';
import 'package:players_task/views/addPalyers/states/states.dart';

class SearchTextField extends StatefulWidget {
  TextEditingController controller =TextEditingController();

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  TextEditingController controller =TextEditingController();

  bool enabled=true ;

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    return GestureDetector(
      onTap: (){
      },
      child: BlocBuilder(
        bloc: HomeCubit.of(context),
        builder: (context, state) => state is HomeSearch ?Center(child: Text("Looding"))
            :     TextFormField(
          onTap: (){
          },
          onChanged: HomeCubit.of(context).search_by_name,
          // onchange
          controller:controller,
          cursorColor: Colors.cyan,
          cursorHeight: 25,
          decoration: InputDecoration(
              contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              fillColor: Colors.black12, filled: true,
              border: new OutlineInputBorder(

                borderRadius: new BorderRadius.circular(40.0),
              ),

              suffixIcon:  IconButton(onPressed: (){
                HomeCubit.of(context).removeFromSearch();
                currentFocus.unfocus();

                controller.clear();


              }, icon:Icon(Icons.close)),
              prefixIcon:
              IconButton(onPressed: (){
                HomeCubit.of(context).search_by_name(controller.text);
                currentFocus.unfocus();


              }, icon:Icon(Icons.search))
          ),
        ),


      ),
    );

  }
}
