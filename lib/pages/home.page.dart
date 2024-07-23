import 'package:blocp_rojet_git/widgets/Main.Drawer.dart';
import 'package:flutter/material.dart';

import '../widgets/main.drawerheader.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Text("Home Pgae"),
      ),
      drawer: MainDrawer(),
    );
  }
}
