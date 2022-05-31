import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bindings/bindings.dart';
import '../controller/theme_controller.dart';
import '../utils/constanst.dart';
import '../utils/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Flutter Custom Theme using Get-X",
      initialBinding: MyBindings(),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  /////////////////////////////////////
  //@CodeWithFlexz on Instagram
  //
  //AmirBayat0 on Github
  //Programming with Flexz on Youtube
  /////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find<ThemeController>();

    return GetBuilder<ThemeController>(builder: (context) {
      /// Main
      return Scaffold(
        /// App Bar
        appBar: MyAppBar(themeController: themeController),

        /// Floating Action Button
        floatingActionButton: FAB(themeController: themeController),

        /// Main Body
        body: MainBody(themeController: themeController),
      );
    });
  }
}

/// Main Body
class MainBody extends StatelessWidget {
  const MainBody({
    Key? key,
    required this.themeController,
  }) : super(key: key);

  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kWidth,
      height: kHeight,
      color: themeController.currentTheme().bG,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 15,
          itemBuilder: (ctx, i) {
            return Padding(
              padding: EdgeInsets.only(
                  left: 8, right: 8, bottom: 8, top: i == 0 ? 13 : 4),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: themeController.currentTheme().cardColor,
                ),
                width: double.infinity,
                height: 80,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: CircleAvatar(
                          radius: 35,
                          backgroundColor:
                              themeController.currentTheme().appBarColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("CodeWithFlexz",
                              style: TextStyle(
                                  color:
                                      themeController.currentTheme().titleColor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold)),
                          Text("AmirHossein Bayat",
                              style: TextStyle(
                                  color: themeController
                                      .currentTheme()
                                      .subTitlelColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                    ),
                    Expanded(child: Container()),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 28,
                        color: themeController.currentTheme().iconColor,
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

/// Floating Action Button
class FAB extends StatelessWidget {
  const FAB({
    Key? key,
    required this.themeController,
  }) : super(key: key);

  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: themeController.currentTheme().appBarColor,
      onPressed: () {
        Get.bottomSheet(
            backgroundColor: Colors.transparent,
            Container(
                height: 100,
                margin: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 20.0,
                      sigmaY: 20.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                          color: Colors.black26,
                          width: 0.5,
                        ),
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: FractionallySizedBox(
                              widthFactor: 0.25,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                height: 4,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(2),
                                  border: Border.all(
                                    color: Colors.black12,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: SizedBox(
                              width: kWidth,
                              height: 70,
                              child: GetBuilder<ThemeController>(
                                  builder: (context) {
                                return GridView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: listOfThemes.length,
                                    scrollDirection: Axis.horizontal,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                    ),
                                    itemBuilder: (ctx, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Get.find<ThemeController>()
                                              .changeBottomSheetBorderColor(
                                                  index);
                                        },
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: AnimatedContainer(
                                                duration: const Duration(
                                                    milliseconds: 500),
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: listOfThemes[index]
                                                        .cardColor,
                                                    border: index ==
                                                            Get.find<
                                                                    ThemeController>()
                                                                .bottomSheetColorIndex
                                                        ? Border.all(
                                                            color: Colors.white,
                                                            width: 3)
                                                        : null),
                                                child: index ==
                                                        Get.find<
                                                                ThemeController>()
                                                            .bottomSheetColorIndex
                                                    ? Center(
                                                        child:
                                                            AnimatedContainer(
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      500),
                                                          width: 8,
                                                          height: 8,
                                                          decoration:
                                                              const BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      )
                                                    : null)),
                                      );
                                    });
                              }),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )));
      },
      child: const Icon(Icons.refresh),
    );
  }
}

/// AppBar
class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({
    Key? key,
    required this.themeController,
  }) : super(key: key);

  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: themeController.currentTheme().appBarColor,
      centerTitle: true,
      elevation: 0,
      title: Column(
        children: const [
          Text("@CodeWithFlexz"),
          Text(
            "AmirHossein Bayat",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
