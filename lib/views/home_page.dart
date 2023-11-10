import 'package:flutter/material.dart';
import 'package:grow_guard/utils/news_block.dart';
import 'package:grow_guard/utils/plant_block.dart';
import 'package:grow_guard/utils/unactive_plant_block.dart';
import '../ui/main_header.dart';
import '../utils/colors.dart';
import '../utils/app_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 20),
          child: AppBar(
            iconTheme: IconThemeData(color: Colors.black, size: 40),
            toolbarHeight: 140,
            centerTitle: true,
            title: Image.asset(
              'assets/images/logo-simple.png',
              width: 70,
            ),
            actions: [
              Icon(
                Icons.bar_chart,
              )
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MainHeader(text: "My shrooms"),
            const SizedBox(height: 50),
            Row(
              children: [
                PlantBlock(
                    title: "Pleurotus eryngii ",
                    image: "pleurotus-eryngii.png"),
                SizedBox(width: 20),
                UnactivePlantBlock(),
              ],
            ),
            const SizedBox(height: 20),
            const MainHeader(text: "Explore News"),
            const SizedBox(height: 20),
            Row(
              children: [
                const NewsBlock(
                  title: "Deadly fungal infection",
                  image: "https://picsum.photos/250?image=9",
                  hyperlink:
                      "https://www.nbcnews.com/health/health-news/cdc-fungal-infection-candida-auris-alarming-spread-rcna75477",
                ),
                const SizedBox(width: 20),
                NewsBlock(
                  title: "Fungi foraging: 5 safe and edible wild mushrooms",
                  image:
                      "https://static.euronews.com/articles/stories/07/16/53/52/828x466_cmsv2_68c503ac-4dde-5a7d-9c3a-1d3425602c64-7165352.jpg",
                  hyperlink:
                      "https://www.euronews.com/culture/2022/11/01/fungi-foraging-5-safe-and-edible-wild-mushrooms-to-look-out-for",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
