import 'package:blocp_rojet_git/bloc/thme.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDrawerHeader extends StatelessWidget {
  const MyDrawerHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Theme.of(context).primaryColor])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/1.jpg"),
              radius: 40,
            ),
            IconButton(
              onPressed: () {
                context.read<ThemeBloc>().add(SwitchThemeEvent());
              },
              icon: Icon(Icons.settings),
            ),
          ],
        ));
  }
}
