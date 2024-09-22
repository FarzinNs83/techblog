import 'package:get/get.dart';
import 'package:techblog_app/component/api_const.dart';
import 'package:techblog_app/model/article_info_model.dart';
import 'package:techblog_app/model/article_model.dart';
import 'package:techblog_app/model/tags_model.dart';
import 'package:techblog_app/services/dio_service.dart';
import 'package:techblog_app/view/single_article.dart';

class SingleArticleController extends GetxController {
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> singleArticleList = ArticleInfoModel().obs;
  RxList<TagsModel> tagList = RxList();
  RxList<ArticleModel> relatedList = RxList();
  RxBool isLoading = false.obs;

  singleArticleItems(String id) async {
    isLoading.value = false;

    var userId = '';
    var response = await DioService().getMethod(
        '${ApiConst.baseUrl}article/get.php?command=info&id=$id&user_id=$userId');

    if (response.statusCode == 200) {
      singleArticleList.value = ArticleInfoModel.fromJson(response.data);
    }

    tagList.clear();
    response.data['tags'].forEach((element){
      tagList.add(TagsModel.fromJson(element));
    });    
    relatedList.clear();
    response.data['related'].forEach((element){
      relatedList.add(ArticleModel.fromJson(element));
    });

    Get.to(SingleArticle());
  }

}
