import 'package:get/get.dart';
import 'package:techblog_app/component/api_const.dart';
import 'package:techblog_app/model/article_model.dart';
import 'package:techblog_app/model/data_models.dart';
import 'package:techblog_app/model/poster_model.dart';
import 'package:techblog_app/services/dio_service.dart';

class HomeScreenController extends GetxController {
  late Rx<PosterModel> poster;

  RxList tagsList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodCastModel> topPodcastList = RxList();

  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    var response = await DioService().getMethod(ApiConst.getHomeItems);

    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromJson(element));
      });
    }
  }
}
