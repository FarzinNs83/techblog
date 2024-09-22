import 'package:get/get.dart';
import 'package:techblog_app/controller/article_screen_controller.dart';
import 'package:techblog_app/controller/register_intro_controller.dart';
import 'package:techblog_app/controller/single_article_controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ArticleScreenController());
    Get.lazyPut(
      () => SingleArticleController(),
    );
  }
}class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RegisterIntroController());

  }
}
