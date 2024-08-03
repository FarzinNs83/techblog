import 'package:get/get.dart';
import 'package:techblog_app/component/api_const.dart';
import 'package:techblog_app/model/article_model.dart';
import 'package:techblog_app/services/dio_service.dart';

class ArticleController extends GetxController{
  RxList<ArticleModel> articleList = RxList();

   RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getList();
  }

  getList() async {
    loading.value = true;
    //TODO get userid from getStorage+user id
    var response = await DioService().getMethod(ApiConst.getArticleList);

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });

      loading.value = false;
    }
  }
}