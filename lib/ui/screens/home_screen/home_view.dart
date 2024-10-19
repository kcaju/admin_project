import 'package:admin_project/constants/app_colors.dart';
import 'package:admin_project/constants/assets.gen.dart';
import 'package:admin_project/ui/screens/birds_tab/bird_view.dart';
import 'package:admin_project/ui/screens/cats_tab/cat_view.dart';
import 'package:admin_project/ui/screens/dogs_tab/dog_view.dart';
import 'package:admin_project/ui/screens/home_screen/home_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';
// import 'package:rxdart/rxdart.dart'; // Add rxdart package to your pubspec.yaml

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var newPets = FirebaseFirestore.instance.collection("NewPets");

    return ViewModelBuilder<HomeViewmodel>.reactive(
      viewModelBuilder: () => HomeViewmodel(),
      builder: (context, viewModel, child) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            // backgroundColor: Palette.thrid,
            appBar: AppBar(
              leading: Icon(null),
              backgroundColor: Palette.first,
              centerTitle: true,
              title: Text(
                "Pets Collection",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Palette.black),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Newly Added",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Palette.black),
                          ),
                          StreamBuilder<QuerySnapshot>(
                            stream: newPets.snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return const Text('Something went wrong');
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              final documents = snapshot.data!.docs;
                              return CarouselSlider(
                                items: List.generate(documents.length, (index) {
                                  Map<String, dynamic> data = documents[index]
                                      .data()! as Map<String, dynamic>;
                                  return InkWell(
                                    onTap: () {
                                      viewModel.toDetails(
                                          data); // Navigate to details screen
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: Container(
                                        height: 250,
                                        width: 400,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Palette.blue,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: CachedNetworkImage(
                                            imageUrl: data['url'],
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                Shimmer.fromColors(
                                              direction: ShimmerDirection.btt,
                                              baseColor: Palette.white,
                                              highlightColor: Palette.grey,
                                              child: Container(
                                                height: 250,
                                                width: 400,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                                options: CarouselOptions(
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  height: 250,
                                ),
                              );
                            },
                          ),
                          Text(
                            "Pets Categories:",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Palette.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TabBar(
                            labelStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            labelColor: Palette.black,
                            unselectedLabelColor: Palette.grey,
                            tabs: [
                              Tab(
                                text: "Dogs",
                                icon: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: 50,
                                    width: 80,
                                    child: Assets.images.dogs
                                        .image(fit: BoxFit.fill),
                                  ),
                                ),
                              ),
                              Tab(
                                text: "Cats",
                                icon: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    width: 80,
                                    height: 50,
                                    child: Assets.images.cat1
                                        .image(fit: BoxFit.fill),
                                  ),
                                ),
                              ),
                              Tab(
                                text: "Birds",
                                icon: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    width: 80,
                                    height: 50,
                                    child: Assets.images.bird1
                                        .image(fit: BoxFit.fill),
                                  ),
                                ),
                              ),
                              // Tab(
                              //   text: "Rabbits",
                              //   icon: ClipRRect(
                              //     borderRadius: BorderRadius.circular(10),
                              //     child: Container(
                              //       width: 80,
                              //       height: 50,
                              //       child: Assets.images.rab
                              //           .image(fit: BoxFit.cover),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            height: 600,
                            child: TabBarView(children: [
                              DogView(),
                              CatView(),
                              BirdView(),
                              // RabbitView()
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
