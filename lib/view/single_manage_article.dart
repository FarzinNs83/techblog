import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog_app/component/constant/my_colors.dart';
import 'package:techblog_app/component/dimension.dart';
import 'package:techblog_app/component/my_component.dart';
import 'package:techblog_app/controller/manager_article_controller.dart';
import 'package:techblog_app/gen/assets.gen.dart';

// ignore: must_be_immutable
class SingleManageArticle extends StatelessWidget {
  SingleManageArticle({super.key});
  var managerArticleController = Get.find<ManagerArticleController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Obx(
            () => Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      child: CachedNetworkImage(
                        imageBuilder: (context, imageProvider) {
                          return Image(image: imageProvider);
                        },
                        imageUrl: managerArticleController
                                .manageArticle.value.image ??
                            '',
                        placeholder: (context, url) {
                          return const MyLoading();
                        },
                        errorWidget: (context, url, error) {
                          return Image.asset(
                              Assets.images.singlePlaceHolder.path);
                        },
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      top: 0,
                      child: Container(
                        height: 60,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: GradientColors.singleAppBarGradient,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 26,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                seeMore("ویرایش عنوان مقاله"),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Text(
                        managerArticleController.manageArticle.value.title!,
                        style: const TextStyle(
                          fontFamily: 'dana',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                seeMore("ویرایش متن اصلی مقاله"),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    children: [
                      Text(
                        managerArticleController.manageArticle.value.content!,
                        style: const TextStyle(
                          fontFamily: 'dana',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                seeMore("انتخاب دسته بندی "),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    itemCount: 4,
                    //  managerArticleController.tagList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              16, 8, index == 0 ? Dimension.bodyMargin : 8, 8),
                          child: Container(
                            height: 60,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 242, 242, 242),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              child: Text("Tags"),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(24),
          child: SizedBox(
            width: Get.width / 3,
            child: ElevatedButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                child: Text(
                  "تموم شد",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'dana',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
