import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controllers/articleController.dart';
import 'package:newsapp/controllers/sourcesController.dart';
import 'package:newsapp/ui/pages/articleScreen.dart';

class SourcesScreen extends StatelessWidget {
  final String? title;
  SourcesScreen({this.title, Key? key}) : super(key: key);

  SourcesController _sourcesController = Get.find();
  ArticleController _articleController = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purple,
              title: Text(title.toString()),
            ),
            body: _sourcesController.responseSources.value.sources == null
                ? const Center(
                    child: Text('No Data'),
                  )
                : ListView.builder(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    shrinkWrap: true,
                    itemCount: _sourcesController
                        .responseSources.value.sources!.length,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            onTap: () {
                              _articleController.articleBySource(
                                  _sourcesController
                                      .responseSources.value.sources![index].id
                                      .toString());
                              Get.to(() => ArticleScreen(
                                    title: _sourcesController.responseSources
                                        .value.sources![index].id
                                        .toString(),
                                  ));
                            },
                            title: Text(_sourcesController
                                .responseSources.value.sources![index].name
                                .toString()),
                            subtitle: Text(_sourcesController.responseSources
                                .value.sources![index].description
                                .toString()),
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
