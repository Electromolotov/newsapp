import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controllers/sourcesController.dart';
import 'package:newsapp/ui/pages/sourcesScreen.dart';
import 'package:newsapp/ui/widgets/cardCategories.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  List<CardCategories> listCategory = <CardCategories>[
    CardCategories(nameCategory: 'business', pathAsset: 'assets/business.jpg'),
    CardCategories(
        nameCategory: 'entertainment', pathAsset: 'assets/entertainment.png'),
    CardCategories(nameCategory: 'general', pathAsset: 'assets/general.jpg'),
    CardCategories(nameCategory: 'health', pathAsset: 'assets/health.jpg'),
    CardCategories(nameCategory: 'science', pathAsset: 'assets/science.jpg'),
    CardCategories(nameCategory: 'sports', pathAsset: 'assets/sports.jpg'),
    CardCategories(nameCategory: 'technology', pathAsset: 'assets/tech.jpeg'),
  ];

  SourcesController _sourcesController = Get.put(SourcesController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
          backgroundColor: Colors.purple,
        ),
        body: GridView.builder(
          padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
          shrinkWrap: true,
          itemCount: listCategory.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.5,
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => SourcesScreen(
                      title: listCategory[index].nameCategory,
                    ));
                _sourcesController
                    .getResponse(listCategory[index].nameCategory.toString());
              },
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            listCategory[index].pathAsset.toString()),
                        fit: BoxFit.cover),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Center(
                    child: Text(
                  listCategory[index].nameCategory.toString(),
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.purpleAccent),
                )),
              ),
            );
          },
        ),
      ),
    );
  }
}
