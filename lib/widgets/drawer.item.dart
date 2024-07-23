import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData trailingIcon;
  final IconData leadingIcon;
  final Function onAction;
  const DrawerItem({
    super.key,
    required this.title,
    required this.trailingIcon,
    required this.leadingIcon,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      leading: Icon(
        leadingIcon,
        color: Theme.of(context).primaryColor,
      ),
      trailing: Icon(
        trailingIcon,
        color: Theme.of(context).primaryColor,
      ),
      onTap: () => onAction(),
    );
  }
}
