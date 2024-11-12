import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:perfection_task/core/app_lists/app_lists.dart';
import 'package:perfection_task/core/app_size/app_size.dart';
import 'package:perfection_task/main_layers/data_layer/bloc_manager/my_cubit.dart';
import 'package:perfection_task/main_layers/data_layer/bloc_manager/my_states.dart';
import 'package:perfection_task/main_layers/presentation_layer/user_information/user_information.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    MyBlocCubit myBlocCubit = BlocProvider.of<MyBlocCubit>(context);
    myBlocCubit.getAllUsers();
    AppSize.init(context: context, designHeight: 812, designWidth: 375);

    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
      ),
      body: BlocBuilder<MyBlocCubit, MyStates>(
         builder: (context, state) {
           return !myBlocCubit.getUsers
               ? const Center(child: CircularProgressIndicator())
               : ListView.builder(
             itemCount: AppLists.userMail.length,
             itemBuilder: (context, index) {
               return ListTile(
                 title: Text(AppLists.userName[index]),
                 subtitle: Text(AppLists.userMail[index]),
                 leading: CircleAvatar(
                   backgroundImage: NetworkImage(AppLists.userAvatar[index]),
                 ),
                 onTap: () {
                   Navigator.of(context).push(
                     MaterialPageRoute(
                       builder: (context) => UserInformation(userId: AppLists.userID[index]),
                     ),
                   );
                 },
               );
             },
           );
         },
      ),
    );
  }
}