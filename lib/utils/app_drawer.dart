import 'package:flutter/material.dart';
import 'package:grow_guard/views/home_page.dart';
import 'package:grow_guard/utils/colors.dart';

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
      color: forestGreen,
      padding: EdgeInsets.only(
        top: 24 + MediaQuery.of(context).padding.top,
        bottom: 24,
      ),
      child: Column(
        children: const [
          CircleAvatar(
            radius: 52,
            backgroundImage: NetworkImage(
                "https://bi.im-g.pl/im/d1/65/19/z26629841AMP,Barack-Obama-w-2012-r---oficjalny-portret-prezyden.jpg"),
          ),
          SizedBox(height: 12),
          Text(
            "Barack Obama",
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
          Text(
            "obama@barack.ru",
            style: TextStyle(fontSize: 16, color: Colors.white),
          )
        ],
      ),
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
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
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
