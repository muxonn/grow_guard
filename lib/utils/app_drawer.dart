import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildHeader(context),
          buildMenuItems(context),
        ],
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 10,
        children: [
          ListTile(
            leading: const Icon(Icons.home),
            title: Text("Home"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text("Profile"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {},
          ),
          Divider(
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: Text("Details"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text("Log out"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
