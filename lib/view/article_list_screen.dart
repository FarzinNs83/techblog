import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog_app/component/my_component.dart';
import 'package:techblog_app/component/text_style.dart';
import 'package:techblog_app/controller/article_screen_controller.dart';
import 'package:techblog_app/controller/single_article_controller.dart';

// ignore: must_be_immutable
class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({
    super.key,
  });
  ArticleScreenController articleScreenController =
      Get.put(ArticleScreenController());
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "لیست مقالها",
              style: appBarTextStyle,
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(right: 12),
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
      body: SizedBox(
        child: Obx(
          () => ListView.builder(
            itemCount: articleScreenController.articleList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  singleArticleController.singleArticleItems(
                      articleScreenController.articleList[index].id!);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: context.height / 6,
                      width: context.width / 3,
                      child: CachedNetworkImage(
                        imageUrl:
                            articleScreenController.articleList[index].image!,
                        imageBuilder: (context, imageProvider) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16),
                              ),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        placeholder: (context, url) => const MyLoading(),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.image_aspect_ratio_outlined,
                          size: 32,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: context.width / 2,
                          child: Text(
                            articleScreenController.articleList[index].title!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              articleScreenController
                                  .articleList[index].author!,
                              style: caption,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              '${articleScreenController.articleList[index].view!} بازدید',
                              style: caption,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    ));
  }
}
