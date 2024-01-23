import 'package:flutter/material.dart';

class NewsBlock extends StatelessWidget {
  final String title;
  final String image;
  final String hyperlink;
  const NewsBlock({
    super.key,
    required this.title,
    required this.image,
    required this.hyperlink,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(24)),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/news-infection.png"),
                fit: BoxFit.cover,
              ),
            ),
            width: 130,
            height: 160,
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
              ),
            ),
            width: 130,
            height: 140,
            child: Container(
              margin: const EdgeInsets.only(left: 10, top: 20, right: 10),
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    hyperlink,
                    style: const TextStyle(
                      fontSize: 5,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
