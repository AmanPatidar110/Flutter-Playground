import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  // const MainDrawer({ Key? key }) : super(key: key);

  Widget tileBuilder(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            color: Theme.of(context).colorScheme.primary,
            height: 120,
            width: double.infinity,
            child: Text(
              "COOKING UP!",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontSize: 30),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          tileBuilder(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          tileBuilder(
            'Filters',
            Icons.settings_input_component_rounded,
            () {
              Navigator.of(context).pushReplacementNamed('/filters');
            },
          ),
        ],
      ),
    );
  }
}
