import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:techblog_app/component/my_colors.dart';
import 'package:techblog_app/component/my_component.dart';
import 'package:techblog_app/component/my_string.dart';
import 'package:techblog_app/controller/register_intro_controller.dart';
import 'package:techblog_app/gen/assets.gen.dart';
import 'package:techblog_app/view/main_screen/home_screen.dart';
import 'package:techblog_app/view/main_screen/profile_screen.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  RxInt selectedPageIndex = 0.obs;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: SolidColors.scaffoldBackground,
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: ListView(
              children: [
                DrawerHeader(
                    child: Center(
                        child: Image(
                  image: Assets.images.splashscreen.provider(),
                  height: 80,
                ))),
                ListTile(
                  title: Text("پروفایل کاربری", style: textTheme.bodySmall),
                  onTap: () {},
                ),
                const Divider(
                  color: SolidColors.divider,
                ),
                ListTile(
                  title: Text("درباره تک‌بلاگ", style: textTheme.bodySmall),
                  onTap: () {},
                ),
                const Divider(
                  color: SolidColors.divider,
                ),
                ListTile(
                  title:
                      Text("اشتراک گذاری تک بلاگ", style: textTheme.bodySmall),
                  onTap: () async {
                    await Share.share(MyString.shareText);
                  },
                ),
                const Divider(
                  color: SolidColors.divider,
                ),
                ListTile(
                  title: Text("تک‌بلاگ در گیت هاب", style: textTheme.bodySmall),
                  onTap: () {
                    mylaunchUrl(MyString.techBlogGithubUrl);
                  },
                ),
                const Divider(
                  color: SolidColors.divider,
                ),
                IconButton(
                    onPressed: () {
                      Get.isDarkMode ? ThemeData.light() : ThemeData.dark();
                    },
                    icon: Icon(Get.isDarkMode
                        ? Icons.light_mode_outlined
                        : Icons.dark_mode_outlined))
              ],
            ),
          ),
        ),
        // AppBar
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: SolidColors.scaffoldBackground,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: () {
                    _key.currentState!.openDrawer();
                  },
                  child: const Icon(Icons.menu, color: Colors.black)),
              Image(
                  image: Assets.images.splashscreen.provider(),
                  height: size.height / 13.6),
              const Icon(Icons.search, color: Colors.black)
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Stack(
            children: [
              Positioned.fill(
                  child: Obx(
                () => IndexedStack(
                  index: selectedPageIndex.value,
                  children: [
                    HomeScreen(
                        size: size,
                        textTheme: textTheme,
                        bodyMargin: bodyMargin),
                    ProfileScreen(
                        size: size,
                        textTheme: textTheme,
                        bodyMargin: bodyMargin)
                  ],
                ),
              )),
              //BottomNavigation
              BottomNav(
                size: size,
                bodyMargin: bodyMargin,
                changeScreen: (int value) {
                  selectedPageIndex.value = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNav extends StatelessWidget {
  BottomNav({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.changeScreen,
  });

  final Size size;
  final double bodyMargin;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8,
      right: 0,
      left: 0,
      child: Container(
        height: size.height / 10,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: GradientColors.bottomnavBackground,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        // Purple Background
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Container(
            height: size.height / 8,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                gradient: LinearGradient(colors: GradientColors.bottomnav)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () => changeScreen(0),
                    icon: ImageIcon(Assets.images.home.provider(),
                        color: Colors.white)),
                IconButton(
                    onPressed: () =>
                        Get.find<RegisterIntroController>().toggleLogin(),
                    icon: ImageIcon(Assets.images.writer.provider()),
                    color: Colors.white),
                IconButton(
                    onPressed: () => changeScreen(1),
                    icon: ImageIcon(Assets.images.user.provider()),
                    color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
