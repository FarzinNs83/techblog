import 'package:get/get.dart';
import 'package:techblog_app/component/api_const.dart';
import 'package:techblog_app/model/article_info_model.dart';
import 'package:techblog_app/model/article_model.dart';
import 'package:techblog_app/model/fake_data.dart';
import 'package:techblog_app/services/dio_service.dart';

class ArticleScreenController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    getArticleItems();
  }

  getArticleItems() async {
    isLoading.value = true;
    var response = await DioService().getMethod(ApiConst.getArticleList);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      isLoading.value = false;
    }
  }

  singleArticleTags(dynamic id) async {
    articleList.clear();
    isLoading.value = true;
    var response = await DioService().getMethod(
        '${ApiConst.baseUrl}article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=');
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      isLoading.value = false;
    }
  }
}
