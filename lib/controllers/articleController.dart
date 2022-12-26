import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:newsapp/models/responseArticle.dart';
import 'package:newsapp/services/articleServices.dart';

class ArticleController extends GetxController {
  late Rx<ResponseArticle> responseSources = ResponseArticle().obs;

  Future articleBySource(
    String source,
  ) async {
    ArticleService _articleService = ArticleService();
    try {
      _articleService.getArticleBySource(source).then((value) async {
        dio.Response _response = value;
        if (_response.data['status'] == 'ok') {
          var data = ResponseArticle.fromJson(_response.data);
          responseSources.value = data;
        }
      });
    } on dio.DioError catch (e) {
      Get.snackbar('Error', e.toString());
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
