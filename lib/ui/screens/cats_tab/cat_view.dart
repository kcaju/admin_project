import 'package:admin_project/constants/app_colors.dart';
import 'package:admin_project/ui/screens/cats_tab/cat_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

class CatView extends StatelessWidget {
  const CatView({super.key});

  @override
  Widget build(BuildContext context) {
    var catBreeds = FirebaseFirestore.instance.collection("Catbreeds");
    return ViewModelBuilder<CatViewmodel>.reactive(
      viewModelBuilder: () {
        return CatViewmodel();
      },
      builder: (context, viewModel, child) {
        return StreamBuilder<QuerySnapshot>(
          stream: catBreeds.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            // Extract documents into a list
            final documents = snapshot.data!.docs;

            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: documents.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 300,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        Map<String, dynamic> data =
                            documents[index].data()! as Map<String, dynamic>;

                        return InkWell(
                          onTap: () {
                            viewModel.navigate(data, documents[index].id,
                                data['breed'], data['url']);
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 250,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(50),
                                        ),
                                        color: Palette.blue,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(50),
                                        ),
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
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(50),
                                                ),
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  data['breed'],
                                  style: TextStyle(
                                      color: Palette.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Palette.thrid,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        );
                      })
                ],
              ),
            );
          },
        );
      },
    );
  }
}
