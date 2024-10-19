import 'package:admin_project/app/app.router.dart';
import 'package:admin_project/constants/app_colors.dart';
import 'package:admin_project/ui/screens/birds_list/birdlist_viewmodel.dart';
import 'package:admin_project/ui/screens/birds_list/tab/bird_tab_view.dart';
import 'package:admin_project/ui/widgets/add_pets_bottomsheet.dart';
import 'package:admin_project/ui/widgets/custom_floatingbutton.dart';
import 'package:admin_project/ui/widgets/editing_bottomsheet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BirdlistView extends StatelessWidget {
  const BirdlistView(
      {super.key,
      required this.birdData,
      required this.id,
      required this.url,
      required this.breed});
  final Map<String, dynamic> birdData;
  final String id, url, breed;

  @override
  Widget build(BuildContext context) {
    var newPets = FirebaseFirestore.instance.collection("NewPets");

    final birdData =
        ModalRoute.of(context)!.settings.arguments as BirdlistViewArguments;

    var birdSubCollection = FirebaseFirestore.instance
        .collection("Birdbreeds")
        .doc(birdData.id)
        .collection(birdData.breed.toLowerCase());
    return ViewModelBuilder<BirdlistViewmodel>.reactive(
      viewModelBuilder: () {
        return BirdlistViewmodel();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          floatingActionButton: CustomFloatingbutton(
            onPressed: () async {
              QuerySnapshot subdataSnapshot = await birdSubCollection.get();
              Map<String, Map<String, dynamic>> subdata = {
                for (var doc in subdataSnapshot.docs)
                  doc.id: doc.data() as Map<String, dynamic>
              };

              showModalBottomSheet(
                backgroundColor: Palette.green,
                isScrollControlled: true,
                context: context,
                builder: (context) => AddPetsBottomsheet(
                    collectionName: "Birdbreeds",
                    subId: birdSubCollection.id,
                    breed: birdData.breed,
                    data: subdata,
                    documentId: birdData.id),
              );
            },
          ),
          appBar: AppBar(
            backgroundColor: Palette.first,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  viewModel.goBack();
                },
                icon: Icon(
                  Icons.pets,
                  size: 26,
                  color: Palette.black,
                )),
            title: Text(
              "Pick your buddy",
              style:
                  TextStyle(color: Palette.black, fontWeight: FontWeight.bold),
            ),
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: birdSubCollection.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              final subCollectionDocuments = snapshot.data!.docs;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Container(
                  //     height: 250,
                  //     decoration: BoxDecoration(
                  //       color: Palette.blueGrey,
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: Column(
                  //       children: [
                  //         Container(
                  //           height: 200,
                  //           decoration: BoxDecoration(
                  //             color: Palette.blueGrey,
                  //             image: DecorationImage(
                  //                 fit: BoxFit.cover,
                  //                 image: CachedNetworkImageProvider(
                  //                     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8x1-7sQlvgNwQSNaGYYqOTvAnyXNZo1wFqw&s")),
                  //             borderRadius: BorderRadius.circular(10),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "${birdData.breed} :",
                      style: TextStyle(
                          color: Palette.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                        itemCount: subCollectionDocuments.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 15,
                            mainAxisExtent: 350),
                        itemBuilder: (context, index) {
                          Map<String, dynamic> subData =
                              subCollectionDocuments[index].data()
                                  as Map<String, dynamic>;
                          return InkWell(
                              onTap: () {
                                viewModel.onTap(subData);
                              },
                              child: BirdTabView(
                                  toEdit: () {
                                    showModalBottomSheet(
                                      backgroundColor: Palette.green,
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) => EditingBottomsheet(
                                          collectionName: "Birdbreeds",
                                          subId:
                                              subCollectionDocuments[index].id,
                                          breed: birdData.breed,
                                          data: subData,
                                          documentId: birdData.id),
                                    );
                                  },
                                  toDelete: () async {
                                    // Reference to the specific document in NewPets that corresponds to the dog being deleted
                                    String birdName = subData['name'];
                                    QuerySnapshot newPetsSnapshot =
                                        await newPets
                                            .where('name', isEqualTo: birdName)
                                            .get();

                                    // Delete from NewPets collection if it exists
                                    for (var doc in newPetsSnapshot.docs) {
                                      await newPets.doc(doc.id).delete();
                                    }
                                    await birdSubCollection
                                        .doc(subCollectionDocuments[index].id)
                                        .delete();
                                  },
                                  name: subData['name'],
                                  location: subData['location'],
                                  url: subData['url'],
                                  price: subData['price']));
                        }),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
