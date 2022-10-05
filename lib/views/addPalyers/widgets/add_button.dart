import 'package:flutter/material.dart';

class AddButton extends StatefulWidget {
  final String? name;
  final Color? c;

  AddButton({@required this.name,this.c} );

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    return

      Padding(
        padding: const EdgeInsets.all(10),
        child: Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(color: Colors.black38,
                  blurRadius: 0)
            ] ,
            color: widget.c,
          ),
          child:
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.name!,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),




              ],
            ),
          ),

        ),
      );
  }
}
