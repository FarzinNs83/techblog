import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog_app/component/constant/my_colors.dart';
import 'package:techblog_app/component/my_component.dart';
import 'package:techblog_app/controller/article_screen_controller.dart';
import 'package:techblog_app/controller/single_article_controller.dart';
import 'package:techblog_app/gen/assets.gen.dart';
import 'package:techblog_app/view/article_list_screen.dart';

// ignore: must_be_immutable
class SingleArticle extends StatelessWidget {
  SingleArticle({super.key});
  var singleArticleController =
      Get.find<SingleArticleController>();
  ArticleScreenController articleScreenController =
      Get.put(ArticleScreenController());

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
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
                        
                        imageUrl: singleArticleController
                                .singleArticleList.value.image ??
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
                            Icon(
                              Icons.bookmark_add_outlined,
                              color: Colors.white,
                              size: 26,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Icon(
                              Icons.share,
                              color: Colors.white,
                              size: 26,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Text(
                        singleArticleController.singleArticleList.value.title!,
                        style: const TextStyle(
                          fontFamily: 'dana',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            image: Assets.images.avatar.provider(),
                            height: 40,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            singleArticleController
                                .singleArticleList.value.author!,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontFamily: 'dana',
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            singleArticleController.singleArticleList.value.createdAt!,
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontFamily: 'dana',
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    children: [
                      Text(
                        singleArticleController
                            .singleArticleList.value.content!,
                        style: const TextStyle(
                          fontFamily: 'dana',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      SizedBox(
                        height: 60,
                        child: ListView.builder(
                          itemCount: singleArticleController.tagList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async {
                                var tagsId =
                                    singleArticleController.tagList[index].id!;
                                await Get.find<ArticleScreenController>()
                                    .singleArticleTags(tagsId);
                                Get.to(ArticleListScreen());
                              },
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                                child: Container(
                                  height: 60,
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 242, 242, 242),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    child: Text(singleArticleController
                                        .tagList[index].title!,style: const TextStyle(color: Colors.black54),),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: context.height / 3.5,
                        child: Obx(
                          () => ListView.builder(
                            itemCount:
                                singleArticleController.relatedList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              // Blog Item
                              return GestureDetector(
                                onTap: () => singleArticleController
                                    .singleArticleItems(articleScreenController
                                        .articleList[index].id!),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: context.height / 5.3,
                                        width: context.width / 2.2,
                                        child: Stack(children: [
                                          Container(
                                            foregroundDecoration:
                                                const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(Radius
                                                            .circular(16)),
                                                    gradient: LinearGradient(
                                                        colors: GradientColors
                                                            .blogPosts,
                                                        begin: Alignment
                                                            .bottomCenter,
                                                        end: Alignment
                                                            .topCenter)),
                                            child: CachedNetworkImage(
                                              imageUrl: singleArticleController
                                                  .relatedList[index].image!,
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                16)),
                                                    image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.cover)),
                                              ),
                                              placeholder: (context, url) =>
                                                  const MyLoading(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(
                                                Icons
                                                    .image_aspect_ratio_outlined,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                    singleArticleController
                                                        .relatedList[index]
                                                        .author!,
                                                    style:
                                                        textTheme.titleMedium),
                                                Row(
                                                  children: [
                                                    Text(
                                                        singleArticleController
                                                            .relatedList[index]
                                                            .view!,
                                                        style: textTheme
                                                            .titleMedium),
                                                    const SizedBox(width: 6),
                                                    const Icon(
                                                        Icons
                                                            .remove_red_eye_sharp,
                                                        color: Colors.white,
                                                        size: 16)
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ]),
                                      ),
                                      const SizedBox(height: 3),
                                      SizedBox(
                                          width: context.width / 2.4,
                                          child: Text(
                                            singleArticleController
                                                .relatedList[index].title!,
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
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
