import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:techblog_app/component/constant/my_colors.dart';
import 'package:techblog_app/component/dimension.dart';
import 'package:techblog_app/component/text_style.dart';
import 'package:techblog_app/controller/home_screen_controller.dart';
import 'package:techblog_app/gen/assets.gen.dart';
import 'package:techblog_app/main.dart';
import 'package:url_launcher/url_launcher.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.divider,
      thickness: 1,
      indent: Get.width / 6,
      endIndent: Get.width / 6,
    );
  }
}

// ignore: must_be_immutable
class HashtagList extends StatelessWidget {
  HashtagList({super.key, required this.textTheme, required this.index});
  final TextTheme textTheme;
  // ignore: prefer_typing_uninitialized_variables
  var index;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          gradient: LinearGradient(
              colors: GradientColors.tags,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
          child: Row(
            children: [
              ImageIcon(Assets.images.hashtag.provider(),
                  color: Colors.white, size: 14),
              const SizedBox(width: 8),
              Text(Get.find<HomeScreenController>().tagsList[index].title!,
                  style: textTheme.titleMedium)
            ],
          ),
        ));
  }
}

mylaunchUrl(String url) async {
  var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    debugPrint("Could not launch");
  }
}

class MyLoading extends StatelessWidget {
  const MyLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitFadingCube(
        color: SolidColors.primaryColor,
        size: 32,
      ),
    );
  }
}

PreferredSize appBar(String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Center(
                child: Text(
              title,
              style: appBarTextStyle,
            )),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple[200],
              ),
              child: const Icon(
                Icons.arrow_back,
                size: 32,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

routeToWriteBottomSheet() {
  Get.bottomSheet(Container(
    height: Get.height / 3,
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        )),
    child: Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Row(
            children: [
              Image(
                image: Assets.images.modalIcon.provider(),
                height: 50,
              ),
              const SizedBox(
                width: 20,
              ),
              const Text(
                "دونسته هات رو با بقیه به اشتراک بذار ...",
                style: TextStyle(
                    fontSize: 16, fontFamily: 'dana', color: Colors.black87),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
              ''' فکر کن !!  اینجا بودنت به این معناست که یک گیک تکنولوژی هستی
دونسته هات رو با  جامعه‌ی گیک های فارسی زبان به اشتراک بذار..''',
              style: TextStyle(
                  fontSize: 15, fontFamily: 'dana', color: Colors.black54)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Get.toNamed(RouteManager.routeManagerArticle),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Image(
                        image: Assets.images.writeArticle.provider(),
                        height: 35,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const Text(
                        "مدیریت مقاله ها",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'dana',
                            color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => debugPrint("Write Podcast"),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Image(
                        image: Assets.images.writePodcast.provider(),
                        height: 45,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const Text(
                        "مدیریت پادکست ها ",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'dana',
                            color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  ));
}

Widget seeMore(String text) {
  return Padding(
    padding: EdgeInsets.only(right: Dimension.halfBodyMargin, bottom: 8),
    child: Row(
      children: [
        ImageIcon(
          Assets.images.pen.provider(),
          color: SolidColors.seeMore,
        ),
        const SizedBox(width: 8),
        Text(text),
      ],
    ),
  );
}
