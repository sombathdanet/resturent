import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/themes/theme_helper.dart';

import '../user_screen/Widget/background_screen.dart';
import 'model/content_model.dart';

class GetStartScreen extends StatefulWidget {
  const GetStartScreen({super.key});

  @override
  State<GetStartScreen> createState() => _GetScreenState();
}

class _GetScreenState extends State<GetStartScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.transparent,
        body: Stack(
      children: [
        const BackGroundScreen(),
        Column(
          children: [
            Expanded(
              child: PageView.builder(
                  controller: _controller,
                  itemCount: contents.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            contents[i].title,
                            style: theme.textTheme.titleLarge!.copyWith(
                              color: appTheme.black900,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SvgPicture.asset(
                            contents[i].image,
                            height: 300,
                          ),
                          SizedBox(
                            height: 20.v,
                          ),
                          Text(
                            contents[i].discription,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  contents.length,
                  (index) => buildDot(index, context),
                ),
              ),
            ),
            Container(
              height: 60.v,
              margin: const EdgeInsets.all(40),
              width: double.infinity,
              child: FloatingActionButton(
                child: Text(
                    currentIndex == contents.length - 1 ? " Continue" : "Next"),
                onPressed: () {
                  if (currentIndex == contents.length - 1) {}
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.bounceIn);
                },
              ),
            ),
          ],
        ),
      ],
    ));
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10.v,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.amber[800],
      ),
    );
  }
}
