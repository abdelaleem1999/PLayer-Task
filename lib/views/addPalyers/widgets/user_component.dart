import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:players_task/views/addPalyers/cubits/cubits.dart';
import 'package:players_task/views/addPalyers/models/model.dart';
import 'package:players_task/views/addPalyers/widgets/add_button.dart';

class UserComponent extends StatefulWidget {
  UserComponent({
    this.image,
    this.name,
    this.m,
    this.index,
  });

  final String? image;
  final String? name;
  List<Model> persons = [];
  List<Users>? m;
  int? index;


  _UserComponentState createState() => _UserComponentState();
}

class _UserComponentState extends State<UserComponent> {
  bool isadd = true;

  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: HomeCubit.of(context),
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(29),
                            // Image border
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(30), // Image radius
                              child: Image.network(errorBuilder: (context, error, stackTrace) {
                                return CircularProgressIndicator();
                              },
                                  widget.image!,
                                   fit: BoxFit.cover),
                            ),
                          )

                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name!,
                            style: TextStyle(
                                color: Color(0xF8010811),
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    !HomeCubit.of(context).persons.contains(widget.m![widget.index!])
                        ?InkWell(
                      onTap: (){
                        if( HomeCubit.of(context).persons.contains(widget.m![widget.index!])){

                        }else
                        {
                          HomeCubit.of(context).addplayer(widget.m![widget.index!]);

                        }

                        setState(() {

                          isadd = !isadd;

                        });
                        print( HomeCubit.of(context).persons.length.toString());

                      },
                          child: AddButton(
                      name: "add" ,
                      c: Colors.blue ,
                    ),
                        )
                        :InkWell(
                      onTap: (){
                        HomeCubit.of(context).removePlayer(widget.m![widget.index!]);
                        setState(() {

                          isadd = !isadd;
                          //remove
                        });
                      },
                          child: AddButton(
                      name:  "remove",
                      c: Colors.red,
                    ),
                        )

                  ],
                )),
          ],
        );
      },
    );
  }
}
