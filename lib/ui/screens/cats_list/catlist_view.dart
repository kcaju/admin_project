import 'package:admin_project/app/app.router.dart';
import 'package:admin_project/constants/app_colors.dart';
import 'package:admin_project/ui/screens/cats_list/catlist_viewmodel.dart';
import 'package:admin_project/ui/screens/cats_list/tab/cattab_view.dart';
import 'package:admin_project/ui/widgets/add_pets_bottomsheet.dart';
import 'package:admin_project/ui/widgets/custom_floatingbutton.dart';
import 'package:admin_project/ui/widgets/editing_bottomsheet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CatlistView extends StatelessWidget {
  const CatlistView(
      {super.key,
      required this.catData,
      required this.id,
      required this.url,
      required this.breed});
  final Map<String, dynamic> catData;
  final String id, url, breed;

  @override
  Widget build(BuildContext context) {
    var newPets = FirebaseFirestore.instance.collection("NewPets");

    final catData =
        ModalRoute.of(context)!.settings.arguments as CatlistViewArguments;

    var catSubCollection = FirebaseFirestore.instance
        .collection("Catbreeds")
        .doc(catData.id)
        .collection(catData.breed.toLowerCase());
    return ViewModelBuilder<CatlistViewmodel>.reactive(
      viewModelBuilder: () {
        return CatlistViewmodel();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          floatingActionButton: CustomFloatingbutton(
            onPressed: () async {
              QuerySnapshot subdataSnapshot = await catSubCollection.get();
              Map<String, Map<String, dynamic>> subdata = {
                for (var doc in subdataSnapshot.docs)
                  doc.id: doc.data() as Map<String, dynamic>
              };
              showModalBottomSheet(
                backgroundColor: Palette.green,
                isScrollControlled: true,
                context: context,
                builder: (context) => AddPetsBottomsheet(
                    collectionName: "Catbreeds",
                    subId: catSubCollection.id,
                    breed: catData.breed,
                    data: subdata,
                    documentId: catData.id),
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
            stream: catSubCollection.snapshots(),
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
                      "${catData.breed} :",
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
                              child: CatTabView(
                                  toEdit: () {
                                    showModalBottomSheet(
                                      backgroundColor: Palette.green,
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) => EditingBottomsheet(
                                          collectionName: "Catbreeds",
                                          subId:
                                              subCollectionDocuments[index].id,
                                          breed: catData.breed,
                                          data: subData,
                                          documentId: catData.id),
                                    );
                                  },
                                  toDelete: () async {
                                    // Reference to the specific document in NewPets that corresponds to the dog being deleted
                                    String catName = subData['name'];
                                    QuerySnapshot newPetsSnapshot =
                                        await newPets
                                            .where('name', isEqualTo: catName)
                                            .get();
                                    await catSubCollection
                                        .doc(subCollectionDocuments[index].id)
                                        .delete();
                                    // Delete from NewPets collection if it exists
                                    for (var doc in newPetsSnapshot.docs) {
                                      await newPets.doc(doc.id).delete();
                                    }
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
