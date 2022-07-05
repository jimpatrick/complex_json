import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:complex_json/models/users/users_model.dart';
import 'package:complex_json/users/bloc.dart';

class UsersList extends StatelessWidget {
  UsersList({Key? key}) : super(key: key);

  final UsersBloc _usersBloc = UsersBloc();

  @override
  Widget build(BuildContext context) {
    _usersBloc.fetchAllUsers();
    return Scaffold(
      body: StreamBuilder(
          stream: _usersBloc.fetchUsersList,
          builder: (context, AsyncSnapshot<List<UsersModel>> snapshot) {
            if (snapshot.hasData) {
              log(snapshot.data!.toString());
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(snapshot.data![index].username);
                },
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
