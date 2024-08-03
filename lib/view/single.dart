import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:techblog_app/component/my_colors.dart';
import 'package:techblog_app/component/my_component.dart';
import 'package:techblog_app/controller/article_controller.dart';
import 'package:techblog_app/controller/home_screen_controller.dart';
import 'package:techblog_app/gen/assets.gen.dart';

class Single extends StatelessWidget {
  Single({super.key});
  ArticleController articleController = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl: "1",
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                ),
                placeholder: (context, url) => const MyLoading(),
                errorWidget: (context, url, error) =>
                    Image(image: Assets.images.singlePlaceHolder.provider()),
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Container(
                    height: 60,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: GradientColors.singleAppBarGradient,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 24,
                        ),
                        Expanded(child: SizedBox()),
                        Icon(
                          Icons.bookmark_add_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 24,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ))
            ],
          )
        ],
      ),
    ));
  }
}
