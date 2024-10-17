import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog_app/component/constant/my_colors.dart';
import 'package:techblog_app/component/my_component.dart';
import 'package:techblog_app/controller/file_controller.dart';
import 'package:techblog_app/controller/home_screen_controller.dart';
import 'package:techblog_app/controller/manager_article_controller.dart';
import 'package:techblog_app/gen/assets.gen.dart';
import 'package:techblog_app/services/pick_file.dart';

// ignore: must_be_immutable
class SingleManageArticle extends StatelessWidget {
  SingleManageArticle({super.key});
  var managerArticleController = Get.find<ManagerArticleController>();
  FileController fileController = Get.put(FileController());
  var homeScreenController = Get.put(HomeScreenController());

  titleEdit() {
    Get.defaultDialog(
        title: "یک عنوان باحال انتخاب کن",
        titleStyle: const TextStyle(color: SolidColors.scaffoldBackground),
        content: TextField(
          controller: managerArticleController.titleTextEditingController,
          keyboardType: TextInputType.text,
          style: const TextStyle(color: SolidColors.colorTitle),
          decoration: const InputDecoration(hintText: "اینجا وارد کن"),
        ),
        backgroundColor: SolidColors.primaryColor,
        radius: 8,
        confirm: ElevatedButton(
            onPressed: () {
              managerArticleController.updateTitle();
              Get.back();
            },
            child: const Text('ثبت')));
  }

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
                      width: Get.width,
                      height: Get.height / 3,
                      child: fileController.file.value.name == "nothing"
                          ? CachedNetworkImage(
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
                            )
                          : Image.file(
                              File(fileController.file.value.path!),
                              fit: BoxFit.cover,
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
                    ),
                    Positioned(
                        right: 0,
                        left: 0,
                        bottom: 0,
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              // File Picker
                              pickFile();
                            },
                            child: Container(
                              height: 40,
                              width: Get.width / 3,
                              decoration: const BoxDecoration(
                                color: SolidColors.primaryColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "انتخاب تصویر",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'dana'),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                GestureDetector(
                    onTap: () {
                      titleEdit();
                    },
                    child: seeMore("ویرایش عنوان مقاله")),
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
                GestureDetector(
                    onTap: () {
                      chooseTagsBottomSheet();
                    },
                    child: seeMore("انتخاب دسته بندی ")),
                const SizedBox(
                  height: 24,
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

  chooseTagsBottomSheet() {
    Get.bottomSheet(
      Container(
        height: Get.height / 1.6,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            
          ),
          
        ),
        child: SizedBox(
          height: 60,
          child: GridView.builder(
            itemCount: homeScreenController.tagsList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
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
                      child: Center(
                          child: Text(
                              homeScreenController.tagsList[index].title!)),
                    ),
                  ),
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 4),
          ),
        ),
      ),
      isScrollControlled: true,
      persistent: true,
    );
  }
}
