import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:players_task/views/addPalyers/cubits/cubits.dart';
import 'package:players_task/views/addPalyers/states/states.dart';

class PlayersTapBar extends StatefulWidget {
  @override
  State<PlayersTapBar> createState() => _PlayersTapBarState();
}

class _PlayersTapBarState extends State<PlayersTapBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: BlocBuilder(
        bloc: HomeCubit.of(context),
        builder: (context, state) => state is HomeInstant
            ? Text('')
            : ListView.builder(
                itemCount: HomeCubit.of(context).persons.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(29),
                            // Image border
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(22), // Image radius
                              child: Image.network(errorBuilder: (context, error, stackTrace) {
                                return CircularProgressIndicator();
                              },
                                  HomeCubit.of(context).persons[index].image,
                                  fit: BoxFit.cover),
                            ),
                          ),

                          InkWell(
                              onTap: () {
                                HomeCubit.of(context).removePlayer(
                                    HomeCubit.of(context).persons[index]);
                              },
                              child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.close,
                                      color: Colors.red, size: 20)))
                        ],
                      ),
                      Text(HomeCubit.of(context).persons[index].firstName)
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
