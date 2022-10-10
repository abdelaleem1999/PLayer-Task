import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:players_task/views/addPalyers/cubits/cubits.dart';
import 'package:players_task/views/addPalyers/states/states.dart';
import 'package:players_task/views/addPalyers/widgets/user_component.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BodyList extends StatefulWidget {

  @override
  State<BodyList> createState() => _BodyListState();
}

class _BodyListState extends State<BodyList> {




  RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  void _onRefresh() async{
    await Future.delayed(Duration(milliseconds: 2000));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    await Future.delayed(Duration(milliseconds: 2000));
    HomeCubit.of(context).getData();
    if(mounted)
      setState(() {

      });
    _refreshController.loadComplete();
  }
  @override
  Widget build(BuildContext context) {
    return    Expanded(
      flex: 10,
      child: BlocBuilder(

        bloc: HomeCubit.of(context),

        builder: (context, state) =>
        state is HomeLoading ?Padding(
          padding: const EdgeInsets.only(bottom: 500),
          child: CircularProgressIndicator(
            strokeWidth: 4,
          ),
        )

             : state is HomePagenation ?ListView.builder(
          itemCount: HomeCubit.of(context).homeModel!.users.length,
          itemBuilder: (context, index) =>UserComponent(
            image:HomeCubit.of(context).homeModel!.users[index].image ,
            name:  HomeCubit.of(context).homeModel!.users[index].firstName,
            m: HomeCubit.of(context).homeModel!.users,
            index: index,
          ),



        )

       : HomeCubit.of(context).search.isEmpty||HomeCubit.of(context).search==null
            ?SmartRefresher(
          header: Text("Looding"),
          enablePullUp: true,
          enablePullDown: false,
          controller:_refreshController ,
          onLoading: _onLoading,
          child: ListView.builder(
          itemCount: HomeCubit.of(context).homeModel!.users.length,
          itemBuilder: (context, index) =>UserComponent(
              image:HomeCubit.of(context).homeModel!.users[index].image ,
              name:  HomeCubit.of(context).homeModel!.users[index].firstName,
              m: HomeCubit.of(context).homeModel!.users,
              index: index,
          ),



        ),
            )
            :ListView.builder(
          itemCount: HomeCubit.of(context).search.length,
          itemBuilder: (context, index) =>UserComponent(
            image:HomeCubit.of(context).search[index].image ,
            name:  HomeCubit.of(context).search[index].firstName ,
            m: HomeCubit.of(context).search,
            index: index,
          ),



        ) ,

      ),
    );

  }
}
