class ApiConst {
  static const hostDlUrl = "https://techblog.sasansafari.com";
  static const baseUrl = "https://techblog.sasansafari.com/Techblog/api/";
  static const getHomeItems = "${baseUrl}home/?command=index";
  static const getArticleList =
      "${baseUrl}article/get.php?command=new&user_id=";
  static const getArticleListWithTagsId =
      "${baseUrl}article/get.php?command=get_articles_with_tag_id&tag_id=1&user_id=1";
  static const getArticleInfo =
      "${baseUrl}article/get.php?command=info&id=1&user_id=1";
  static const postRegister = "${baseUrl}register/action.php";
  static const manageArticle =
      "${baseUrl}article/get.php?command=published_by_me&user_id=1";
}
