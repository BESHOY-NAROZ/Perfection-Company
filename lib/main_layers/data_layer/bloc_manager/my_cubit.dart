
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfection_task/core/app_lists/app_lists.dart';
import 'package:perfection_task/main_layers/data_layer/bloc_manager/my_states.dart';
import 'package:perfection_task/main_layers/data_layer/dio_network.dart';
import 'package:perfection_task/main_layers/data_layer/models/user_model.dart';

class MyBlocCubit extends Cubit<MyStates> {
  MyBlocCubit() : super(MyInitialState());

  static MyBlocCubit get(context) {
    return BlocProvider.of(context);
  }


  bool getUsers = false;
  getAllUsers() async {
    emit(UserLoadingState());
    try {
      AppLists.userName.clear();

      for (int page = 1; page <= 2; page++) {
        final response =
            await DioNetwork.dioGetData(url: 'api/users', queryParameters: {'page': page});

        for (var userJson in response.data['data']) {
          final user = UserModel.fromJson(userJson);
          AppLists.userName.add('${user.firstName} ${user.lastName}');
          AppLists.userMail.add(user.email!);
          AppLists.userAvatar.add(user.avatar!);
          AppLists.userID.add(user.id!);

        }
      }
      getUsers = true;
      emit(UserDoneState());
    } catch (e) {
      return e.toString();
    }
  }

  bool getInfo = false;
  getUserInfo(int userId) async {
    emit(UserLoadingState());
    try {
      AppLists.userName.clear();

      for (int page = 1; page <= 2; page++) {
        final response =
        await DioNetwork.dioGetData(url: 'api/users', data: {userId});

        for (var userJson in response.data['data']) {
          final user = UserModel.fromJson(userJson);
          AppLists.userName.add('${user.firstName} ${user.lastName}');
          AppLists.userMail.add(user.email!);
          AppLists.userAvatar.add(user.avatar!);
          AppLists.userID.add(user.id!);

        }
      }
      getUsers = true;
      emit(UserDoneState());
    } catch (e) {
      return e.toString();
    }
  }

}
