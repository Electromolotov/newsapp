import 'package:get/get.dart';
import 'package:newsapp/models/responseSources.dart';
import 'package:newsapp/services/sourcesServices.dart';
import 'package:dio/dio.dart' as dio;

class SourcesController extends GetxController {
  late Rx<ResponseSources> responseSources = ResponseSources().obs;
  RxString source = ''.obs;

  Future getResponse(
    String category,
  ) async {
    SourcesService _sourcesService = SourcesService();
    try {
      _sourcesService.getSourcesbyCat(category).then((value) async {
        dio.Response _response = value;
        if (_response.data['status'] == 'ok') {
          var data = ResponseSources.fromJson(_response.data);
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
