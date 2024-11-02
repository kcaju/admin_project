import 'package:admin_project/constants/app_colors.dart';
import 'package:admin_project/ui/screens/pet_supplies/tabs/pet_accessories/petaccessories_viewmodel.dart';
import 'package:admin_project/ui/widgets/edit_supplies.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

class PetaccessoriesView extends StatelessWidget {
  const PetaccessoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    var petAccessory = FirebaseFirestore.instance.collection("Petssupplies");

    return ViewModelBuilder<PetaccessoriesViewmodel>.reactive(
      viewModelBuilder: () {
        return PetaccessoriesViewmodel();
      },
      builder: (context, viewModel, child) {
        return StreamBuilder<QuerySnapshot>(
          stream: petAccessory.snapshots(),
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

            return GridView.builder(
              padding: EdgeInsets.all(8),
              itemCount: documents.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  mainAxisExtent: 280),
              itemBuilder: (context, index) {
                Map<String, dynamic> data =
                    documents[index].data()! as Map<String, dynamic>;
                return InkWell(
                  onTap: () {
                    viewModel.onTap(data['name'], data['url'], data['size'],
                        data['desc'], data['benefits'], data['price'], true);
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 280,
                        width: 280,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                height: 150,
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  overflow: TextOverflow.fade,
                                  data['name'],
                                  style: TextStyle(
                                      color: Palette.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${data['price'].toString()} ₹",
                                    style: TextStyle(
                                        color: Palette.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                        backgroundColor: Palette.green,
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) => EditSupplies(
                                            isAccessory: true,
                                            collectionName: "Petssupplies",
                                            data: data,
                                            Id: documents[index].id),
                                      );
                                    },
                                    child: Icon(
                                      Icons.edit,
                                      color: Palette.violet,
                                      size: 30,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Palette.thrid),
                      ),
                      Positioned(
                        right: 0,
                        child: InkWell(
                          onTap: () async {
                            await petAccessory
                                .doc(documents[index].id)
                                .delete();
                          },
                          child: CircleAvatar(
                            backgroundColor: Palette.black,
                            radius: 15,
                            child: Icon(
                              Icons.delete,
                              color: Palette.red,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
