import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controllers/articleController.dart';
import 'package:newsapp/ui/pages/webviewScreen.dart';

class ArticleScreen extends StatelessWidget {
  final String title;
  ArticleScreen({this.title = '', Key? key}) : super(key: key);

  ArticleController _articleController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purple,
              title: Text(title.toString()),
            ),
            body: _articleController.responseSources.value.articles == null
                ? const Center(
                    child: Text('No Data'),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                    shrinkWrap: true,
                    itemCount: _articleController
                        .responseSources.value.articles!.length,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            onTap: () {
                              Get.offAll(() => WebViewScreen(
                                    uri: _articleController.responseSources
                                        .value.articles![index].url,
                                  ));
                            },
                            leading: _articleController.responseSources.value
                                        .articles![index].urlToImage ==
                                    null
                                ? Image.asset(
                                    'assets/general.jpg',
                                    fit: BoxFit.cover,
                                    height: 100,
                                    width: 100,
                                  )
                                : Image.network(
                                    _articleController.responseSources.value
                                        .articles![index].urlToImage
                                        .toString(),
                                    fit: BoxFit.contain,
                                    height: 100,
                                    width: 100,
                                  ),
                            title: Text(
                              _articleController
                                  .responseSources.value.articles![index].title
                                  .toString(),
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                              _articleController.responseSources.value
                                  .articles![index].description
                                  .toString(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                          const Divider()
                        ],
                      );
                    },
                  )),
      ),
    );
  }
}
