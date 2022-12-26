import 'package:dio/dio.dart' as dio;
import 'package:newsapp/commons/commons.dart';

class ArticleService {
  Future getArticleBySource(
    String source,
  ) {
    String apiKey = Commons.apiKey;
    // ignore: prefer_interpolation_to_compose_strings
    String url =
        Commons.urlApi + 'top-headlines?sources=$source&apiKey=$apiKey';

    dio.Dio _dio = dio.Dio();

    return _dio.get(url);
  }
}
