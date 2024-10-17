import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog_app/component/constant/api_const.dart';
import 'package:techblog_app/model/article_info_model.dart';
import 'package:techblog_app/model/article_model.dart';
import 'package:techblog_app/model/tags_model.dart';
import 'package:techblog_app/services/dio_service.dart';

class ManagerArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList.empty();
  Rx<ArticleInfoModel> manageArticle = ArticleInfoModel(
          "اینجا عنوان مقاله قرار میگیره ، یه عنوان جذاب انتخاب کن",
          """من متن و بدنه اصلی مقاله هستم ، اگه میخوای من رو ویرایش کنی و یه مقاله جذاب بنویسی ، نوشته آبی رنگ بالا که نوشته "ویرایش متن اصلی مقاله" رو با انگشتت لمس کن تا وارد ویرایشگر بشی """)
      .obs;
  RxList<TagsModel> tagList = RxList();
  TextEditingController titleTextEditingController = TextEditingController();
  RxBool isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    manageArticleList();
  }

  manageArticleList() async {
    isLoading.value = true;
    var response = await DioService().getMethod(ApiConst.manageArticle);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
        isLoading.value = false;
      });
      articleList.clear();
    }
  }

  updateTitle() {
    manageArticle.update(
      (val) {
        val!.title = titleTextEditingController.text;
      },
    );
  }
}
