import 'package:get/get.dart';
import 'package:techblog_app/component/api_const.dart';
import 'package:techblog_app/model/article_model.dart';
import 'package:techblog_app/model/podcast_model.dart';
import 'package:techblog_app/model/poster_model.dart';
import 'package:techblog_app/model/tags_model.dart';
import 'package:techblog_app/services/dio_service.dart';

class HomeScreenController extends GetxController {
  Rx<PosterModel> poster = PosterModel().obs;

  RxList<TagsModel> tagsList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcastList = RxList();
  RxBool isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    isLoading.value = true;
    var response = await DioService().getMethod(ApiConst.getHomeItems);

    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromJson(element));
      });

      response.data['top_podcasts'].forEach((element) {
        topPodcastList.add(PodcastModel.fromJson(element));
      });
      response.data['tags'].forEach((element) {
        tagsList.add(TagsModel.fromJson(element));
      });
      poster.value = PosterModel.fromJson(response.data['poster']);

      isLoading.value = false;
    }
  }
}
