import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog_app/component/my_colors.dart';
import 'package:techblog_app/component/my_component.dart';
import 'package:techblog_app/component/my_string.dart';
import 'package:techblog_app/controller/home_screen_controller.dart';
import 'package:techblog_app/gen/assets.gen.dart';
import 'package:techblog_app/model/fake_data.dart';
import 'package:techblog_app/model/fake_podcast.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(children: [
          // HomePagePoster
          HomePagePoster(size: size, textTheme: textTheme),
          const SizedBox(height: 16),
          //Tag List
          HomePageTagList(bodyMargin: bodyMargin, textTheme: textTheme),
          const SizedBox(height: 24),
          // SeeMore
          SeeMoreBlog(bodyMargin: bodyMargin, textTheme: textTheme),
          const SizedBox(height: 8),
          topVisited(),
          // Fav PodCast
          SeeMorePodCast(bodyMargin: bodyMargin, textTheme: textTheme),
          const SizedBox(height: 8),
          // Fav PodCast List
          HomePagePodCastList(
              size: size, bodyMargin: bodyMargin, textTheme: textTheme),
          const SizedBox(height: 50),
        ]),
      ),
    );
  }
  Widget topVisited() {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
          itemCount: homeScreenController.topVisitedList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            // Blog Item
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 5.3,
                    width: size.width / 2.2,
                    child: Stack(children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                                image: NetworkImage(
                                  homeScreenController.topVisitedList[index].image!,
                                ),
                                fit: BoxFit.cover)),
                        foregroundDecoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            gradient: LinearGradient(
                                colors: GradientColors.blogPosts,
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter)),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 0,
                        left: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(homeScreenController.topVisitedList[index].author!,
                                style: textTheme.titleMedium),
                            Row(
                              children: [
                                Text(homeScreenController.topVisitedList[index].view!,
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
                      width: size.width / 2.4,
                      child: Text(
                        homeScreenController.topVisitedList[index].title!,
                        style: textTheme.bodySmall,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.25,
          height: size.height / 4.2,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              image: DecorationImage(
                  image: AssetImage(HomePagePosterMap["imageAsset"]),
                  fit: BoxFit.cover)),
          foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              gradient: LinearGradient(
                  colors: GradientColors.homePosterCover,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        Positioned(
          bottom: 10,
          right: 0,
          left: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                      HomePagePosterMap["writer"] +
                          "  -  " +
                          HomePagePosterMap["date"],
                      style: textTheme.titleMedium),
                  Row(
                    children: [
                      Text(HomePagePosterMap["view"],
                          style: textTheme.titleMedium),
                      const SizedBox(width: 6),
                      const Icon(Icons.remove_red_eye_sharp,
                          color: Colors.white, size: 16)
                    ],
                  )
                ],
              ),
              const SizedBox(height: 6),
              Text(
                "دوازده قدم برنامه نویسی در یک دوره ی...",
                style: textTheme.displayLarge,
              )
            ],
          ),
        )
      ],
    );
  }
}

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tagList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
            child: HashtagList(textTheme: textTheme, index: index),
          );
        },
      ),
    );
  }
}

class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            Assets.images.pen.provider(),
            color: SolidColors.seeMore,
          ),
          const SizedBox(width: 8),
          Text(MyString.viewHotestBlog, style: textTheme.bodyMedium)
        ],
      ),
    );
  }
}



class SeeMorePodCast extends StatelessWidget {
  const SeeMorePodCast({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
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

class HomePagePodCastList extends StatelessWidget {
  const HomePagePodCastList({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        itemCount: podCastList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 5.3,
                  width: size.width / 2.2,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        image: DecorationImage(
                            image: NetworkImage(podCastList[index].imageUrl),
                            fit: BoxFit.fill)),
                  ),
                ),
                const SizedBox(height: 4),
                SizedBox(
                    width: size.width / 2.4,
                    child: Center(
                      child: Text(podCastList[index].title,
                          style: textTheme.titleSmall),
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
