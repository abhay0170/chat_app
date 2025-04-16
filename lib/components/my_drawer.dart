import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/screens/settings_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  logout() {
    // get auth services
    final _authServices = AuthService();

    // sign out
    _authServices.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // logo
          DrawerHeader(child: Center(child: Icon(Icons.message))),

          // home list tile
          ListTile(
            title: Text("H O M E"),
            leading: Icon(Icons.home),
            onTap: () {
              // pop the drawer
              Navigator.pop(context);
            },
          ),

          // settings list tile
          ListTile(
            title: Text("S E T T I N G S"),
            leading: Icon(Icons.settings),
            onTap: () {
              // pop the drawer
              Navigator.pop(context);
              // navigate to settings page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
          Spacer(),

          // logout list tile
          ListTile(
            title: Text("L O G O U T"),
            leading: Icon(Icons.logout),
            onTap: logout,
          ),
        ],
      ),
    );
  }
}
