import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CameraPage extends HookWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lastUpdated = useState("");
    final gridView = useState(false);

    useEffect(() {
      //TODO: MOCKED VALUE
      lastUpdated.value = "18.11.2023 - 20:46";
    });

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 36,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              width: 300,
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 7,
                      offset: const Offset(2, 2)),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                //TODO: MOCKED VALUE
                child: Image.asset('assets/images/image-test.jpg'),
              ),
            ),
          ),
          const SizedBox(height: 40),
          const Text("Last updated:"),
          const SizedBox(height: 10),
          Text(lastUpdated.value),
          Container(
            width: 120,
            margin: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    gridView.value = false;
                  },
                  icon: Icon(
                      gridView.value
                          ? Icons.square_outlined
                          : Icons.square_rounded,
                      size: 40),
                ),
                IconButton(
                  onPressed: () {
                    gridView.value = true;
                  },
                  icon: Icon(
                      gridView.value
                          ? Icons.grid_view_rounded
                          : Icons.grid_view,
                      size: 40),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
