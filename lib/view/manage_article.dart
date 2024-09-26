import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:techblog_app/component/my_component.dart';
import 'package:techblog_app/component/constant/my_string.dart';
import 'package:techblog_app/component/text_style.dart';
import 'package:techblog_app/controller/manager_article_controller.dart';
import 'package:techblog_app/gen/assets.gen.dart';
import 'package:techblog_app/main.dart';

// ignore: must_be_immutable
class ManageArticle extends StatelessWidget {
  ManageArticle({super.key});
  var managerArticleController = Get.find<ManagerArticleController>();
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: appBar("مدیریت مقاله ها"),
      body: Obx(() =>managerArticleController.isLoading.value? const MyLoading(): managerArticleController.articleList.isNotEmpty
          ? ListView.builder(
              itemCount: managerArticleController.articleList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: context.height / 6,
                        width: context.width / 3,
                        child: CachedNetworkImage(
                          imageUrl: managerArticleController
                              .articleList[index].image!,
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
                              managerArticleController
                                  .articleList[index].title!,
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
                                managerArticleController
                                    .articleList[index].author!,
                                style: caption,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                '${managerArticleController.articleList[index].view!} بازدید',
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
            )
          : emptyArticle(textTheme)),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(RouteManager.routeSingleManageArticle);
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
            child: Text("بریم برای نوشتن یه مقاله باحال"),
          ),
        ),
      ),
    );
  }

  Widget emptyArticle(TextTheme textTheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.images.sadbot.path, height: 100),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: MyString.managerArticle,
                    style: textTheme.titleSmall)),
          ),
          // BottomSheet
        ],
      ),
    );
  }
}
