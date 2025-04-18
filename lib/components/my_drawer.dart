import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/screens/settings_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyDrawer({super.key});

  logout() {
    // get auth services
    final auth = AuthService();

    // sign out
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // logo
          DrawerHeader(
            child: Center(
              child: GestureDetector(
                // onTap:
                //     () => Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => ProfilePage()),
                // ),
                child: Column(
                  children: [
                    CircleAvatar(
                      maxRadius: 40,
                      child: Image(
                        image: AssetImage("assets/logo/profile.png"),
                      ),
                    ),
                    Text(
                      "User Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(_auth.currentUser!.uid),
                  ],
                ),
              ),
            ),
          ),

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
