import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:techblog_app/component/constant/my_colors.dart';
import 'package:techblog_app/component/dimension.dart';
import 'package:techblog_app/component/my_component.dart';
import 'package:techblog_app/component/constant/my_string.dart';
import 'package:techblog_app/controller/article_screen_controller.dart';
import 'package:techblog_app/controller/home_screen_controller.dart';
import 'package:techblog_app/controller/single_article_controller.dart';
import 'package:techblog_app/gen/assets.gen.dart';
import 'package:techblog_app/view/article_list_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.textTheme, required this.bodyMargin});

  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());
  ArticleScreenController articleScreenController =
      Get.put(ArticleScreenController());

  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(() => Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: homeScreenController.isLoading.value == false
                ? Column(children: [
                    poster(),
                    const SizedBox(height: 16),
                    tags(),
                    const SizedBox(height: 24),
                    seeMore(MyString.viewHotestBlog),
                    const SizedBox(height: 8),
                    topVisited(),
                    seeMorePodCast(),
                    const SizedBox(height: 8),
                    topPodCast(),
                  ])
                : const SizedBox(child: MyLoading()),
          )),
    );
  }

  Widget topVisited() {
    return SizedBox(
      height: Get.height / 3.5,
      child: Obx(
        () => ListView.builder(
          itemCount: homeScreenController.topVisitedList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            // Blog Item
            return GestureDetector(
              onTap: () => singleArticleController.singleArticleItems(
                  homeScreenController.topVisitedList[index].id!),
              child: Padding(
                padding: EdgeInsets.only(
                    right: index == 0 ? Dimension.bodyMargin : 15),
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height / 5.3,
                      width: Get.width / 2.2,
                      child: Stack(children: [
                        Container(
                          foregroundDecoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              gradient: LinearGradient(
                                  colors: GradientColors.blogPosts,
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter)),
                          child: CachedNetworkImage(
                            imageUrl: homeScreenController
                                .topVisitedList[index].image!,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16)),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover)),
                            ),
                            placeholder: (context, url) => const MyLoading(),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.image_aspect_ratio_outlined,
                              size: 32,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 0,
                          left: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                  homeScreenController
                                      .topVisitedList[index].author!,
                                  style: textTheme.titleMedium),
                              Row(
                                children: [
                                  Text(
                                      homeScreenController
                                          .topVisitedList[index].view!,
                                      style: textTheme.titleMedium),
                                  const SizedBox(width: 6),
                                  const Icon(Icons.remove_red_eye_sharp,
                                      color: Colors.white, size: 16)
                                ],
                              )
                            ],
                          ),
                        )
                      ]),
                    ),
                    const SizedBox(height: 3),
                    SizedBox(
                        width: Get.width / 2.4,
                        child: Text(
                          homeScreenController.topVisitedList[index].title!,
                          style: textTheme.bodySmall,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget topPodCast() {
    return SizedBox(
      height: Get.height / 2.7,
      child: Obx(
        () => ListView.builder(
          itemCount: homeScreenController.topPodcastList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  right: index == 0 ? Dimension.bodyMargin : 15),
              child: Column(
                children: [
                  SizedBox(
                      height: Get.height / 5.3,
                      width: Get.width / 2.2,
                      child: CachedNetworkImage(
                        imageUrl:
                            homeScreenController.topPodcastList[index].poster!,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover)),
                        ),
                        placeholder: (context, url) => const MyLoading(),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.image_aspect_ratio_outlined,
                          size: 32,
                          color: Colors.grey,
                        ),
                      )),
                  const SizedBox(height: 4),
                  SizedBox(
                      width: Get.width / 2.4,
                      child: Center(
                        child: Text(
                            homeScreenController.topPodcastList[index].title!,
                            style: textTheme.titleSmall),
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget tags() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homeScreenController.tagsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              var tagsId = homeScreenController.tagsList[index].id!;
              await Get.find<ArticleScreenController>()
                  .singleArticleTags(tagsId);
              Get.to(ArticleListScreen());
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  0, 8, index == 0 ? Dimension.bodyMargin : 15, 8),
              child: HashtagList(textTheme: textTheme, index: index),
            ),
          );
        },
      ),
    );
  }

  Widget poster() {
    return Stack(
      children: [
        Container(
          width: Get.width / 1.25,
          height: Get.height / 4.2,
          foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              gradient: LinearGradient(
                  colors: GradientColors.homePosterCover,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: CachedNetworkImage(
            imageUrl: homeScreenController.poster.value.image!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover)),
            ),
            placeholder: (context, url) => const SpinKitFadingCube(
              color: SolidColors.primaryColor,
              size: 32,
            ),
            errorWidget: (context, url, error) => const Icon(
              Icons.image_aspect_ratio_outlined,
              size: 32,
              color: Colors.grey,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 0,
          left: 0,
          child: Column(
            children: [
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  homeScreenController.poster.value.title!,
                  style: textTheme.displayLarge,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget seeMorePodCast() {
    return Padding(
      padding: EdgeInsets.only(right: Dimension.bodyMargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(Assets.images.bmic.provider(), color: SolidColors.seeMore),
          const SizedBox(width: 6),
          Text(
            MyString.favPodcast,
            style: textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
