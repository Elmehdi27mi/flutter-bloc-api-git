import 'package:blocp_rojet_git/bloc/counter.bloc.dart';
import 'package:blocp_rojet_git/bloc/thme.bloc.dart';
import 'package:blocp_rojet_git/bloc/users.bloc.dart';
import 'package:blocp_rojet_git/pages/Counterv1.page.dart';
import 'package:blocp_rojet_git/pages/Counterv2.page.dart';
import 'package:blocp_rojet_git/pages/Counterv3.page.dart';
import 'package:blocp_rojet_git/pages/git.users.page.dart';
import 'package:blocp_rojet_git/pages/home.page.dart';
import 'package:blocp_rojet_git/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (context) => UsersBloc()),
      ],
      child: RootView(),
    );
  }
}

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return MaterialApp(
        theme: state.theme,
        routes: {
          "/": (context) => HomePage(),
          "/statefull": (context) => CounterPagev2(),
          "/stateless": (context) => CounterPagev1(),
          "/bloc": (context) => CounterPagev3(),
          "/git": (context) => GitPage(),
        },
      );
    });
  }
}
