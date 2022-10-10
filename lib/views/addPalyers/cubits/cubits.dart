import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:players_task/views/addPalyers/models/model.dart';
import 'package:players_task/views/addPalyers/states/states.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit of(context) => BlocProvider.of(context);
  Model? homeModel;
  List<Users> friends_list = [];
  List<Users> search = [];
  var data = [];
  int limit = 4;
  Dio _dio = Dio();
  Future<void> getData() async {
    if (limit < 5) {
      emit(HomeLoading());
      final response = await _dio
          .get("https://dummyjson.com/users?limit=$limit", options: Options());
      print(response.data);

      homeModel = Model.fromJson(response.data);
      limit += 1;

      emit(HomeInitial());
    } else {
      emit(HomePagenation());
      final response = await _dio
          .get("https://dummyjson.com/users?limit=$limit", options: Options());
      print(response.data);

      homeModel = Model.fromJson(response.data);
      limit += 1;

      emit(HomeInitial());
    }
  }

  add_friend(value) {
    emit(HomeLoading());
    friends_list.add(value);
    emit(HomeInitial());
    print(friends_list.length);
  }

  add2(value) {
    emit(HomeLoading());
    search.add(value);
    emit(HomeInitial());
    print(search.length);
  }

  remove_friend(value) {
    emit(HomeLoading());
    friends_list.remove(value);
    emit(HomeInitial());
    print(friends_list.length);
  }

  void search_by_name(String text) {
    emit(HomeLoading());
    final suggestion = homeModel!.users.where((user) {
      final firestname = user.firstName.toLowerCase();

      final input = text.toLowerCase();

      return firestname.contains(input);
    }).toList();
    search = suggestion;
    emit(HomeInitial());
    return;
  }

  removeFromSearch() {
    emit(HomeSearch());
    search.clear();
    emit(HomeInitial());
  }
}
