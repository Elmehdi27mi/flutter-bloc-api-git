import 'package:flutter/material.dart';

import 'drawer.item.dart';
import 'main.drawerheader.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    final List<dynamic> menus = [
      {
        'title': 'Home',
        'leading': Icons.home,
        'trailing': Icons.arrow_right,
        'path': '/',
      },
      {
        'title': 'Counter1',
        'leading': Icons.ac_unit_rounded,
        'trailing': Icons.arrow_right,
        'path': '/stateless',
      },
      {
        'title': 'Counter2',
        'leading': Icons.ad_units_outlined,
        'trailing': Icons.arrow_right,
        'path': '/statefull',
      },
      {
        'title': 'Counter3',
        'leading': Icons.access_alarm,
        'trailing': Icons.arrow_right,
        'path': '/bloc',
      },
      {
        'title': 'Git Bloc',
        'leading': Icons.account_balance_sharp,
        'trailing': Icons.arrow_right,
        'path': '/git',
      }
    ];
    return Drawer(
      child: Column(
        children: [
          MyDrawerHeader(),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return DrawerItem(
                    title: menus[index]['title'],
                    trailingIcon: menus[index]['leading'],
                    leadingIcon: menus[index]['trailing'],
                    onAction: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, menus[index]['path']);
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 1,
                  );
                },
                itemCount: menus.length),
          )
        ],
      ),
    );
  }
}
