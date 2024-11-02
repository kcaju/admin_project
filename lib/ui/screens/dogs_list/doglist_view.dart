import 'package:admin_project/app/app.router.dart';
import 'package:admin_project/constants/app_colors.dart';
import 'package:admin_project/ui/screens/dogs_list/doglist_viewmodel.dart';
import 'package:admin_project/ui/screens/dogs_list/tab/dog_tab_view.dart';
import 'package:admin_project/ui/widgets/add_pets_bottomsheet.dart';
import 'package:admin_project/ui/widgets/editing_bottomsheet.dart';
import 'package:admin_project/ui/widgets/custom_floatingbutton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DoglistView extends StatelessWidget {
  const DoglistView(
      {super.key,
      required this.dogData,
      required this.id,
      required this.url,
      required this.breed,
      required this.category});
  final Map<String, dynamic> dogData;
  final String id, url, breed, category;

  @override
  Widget build(BuildContext context) {
    var newPets = FirebaseFirestore.instance.collection("NewPets");
    final dogData =
        ModalRoute.of(context)!.settings.arguments as DoglistViewArguments;
    var dogSubCollection = FirebaseFirestore.instance
        .collection("Dogbreeds")
        .doc(dogData.id)
        .collection(dogData.breed.toLowerCase());

    return ViewModelBuilder<DoglistViewmodel>.reactive(
      viewModelBuilder: () {
        return DoglistViewmodel();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          floatingActionButton: CustomFloatingbutton(
            pet: dogData.breed,
            onPressed: () async {
              QuerySnapshot subdataSnapshot = await dogSubCollection.get();
              Map<String, Map<String, dynamic>> subdata = {
                for (var doc in subdataSnapshot.docs)
                  doc.id: doc.data() as Map<String, dynamic>
              };

              showModalBottomSheet(
                backgroundColor: Palette.green,
                isScrollControlled: true,
                context: context,
                builder: (context) => AddPetsBottomsheet(
                    category: dogData.category,
                    collectionName: "Dogbreeds",
                    subId: dogSubCollection.id,
                    breed: dogData.breed,
                    data: subdata,
                    documentId: dogData.id),
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
                  size: 28,
                  color: Palette.black,
                )),
            title: Text(
              "Pick your buddy",
              style:
                  TextStyle(color: Palette.black, fontWeight: FontWeight.bold),
            ),
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: dogSubCollection.snapshots(),
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
                      "${dogData.breed} :",
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
                            mainAxisExtent: 340),
                        itemBuilder: (context, index) {
                          Map<String, dynamic> subData =
                              subCollectionDocuments[index].data()
                                  as Map<String, dynamic>;
                          return InkWell(
                              onTap: () {
                                viewModel.onTap(subData);
                              },
                              child: DogTabView(
                                  toEdit: () async {
                                    // Get the pet name to find the corresponding document in NewPets
                                    String dogName = subData['name'];

                                    // Query the NewPets collection for the document that matches the dog's name
                                    QuerySnapshot newPetsSnapshot =
                                        await newPets
                                            .where('name', isEqualTo: dogName)
                                            .get();

                                    if (newPetsSnapshot.docs.isNotEmpty) {
                                      // Assuming you want to take the first match (if multiple exist)
                                      String newpetsId =
                                          newPetsSnapshot.docs.first.id;

                                      showModalBottomSheet(
                                        backgroundColor: Palette.green,
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) =>
                                            EditingBottomsheet(
                                          newpetsId:
                                              newpetsId, // Pass the retrieved newpetsId here
                                          collectionName: "Dogbreeds",
                                          subId:
                                              subCollectionDocuments[index].id,
                                          breed: dogData.breed,
                                          data: subData,
                                          documentId: dogData.id,
                                        ),
                                      );
                                    } else {
                                      showModalBottomSheet(
                                        backgroundColor: Palette.green,
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) =>
                                            EditingBottomsheet(
                                          newpetsId: "",
                                          collectionName: "Dogbreeds",
                                          subId:
                                              subCollectionDocuments[index].id,
                                          breed: dogData.breed,
                                          data: subData,
                                          documentId: dogData.id,
                                        ),
                                      );
                                    }
                                    // DocumentSnapshot newPetsSnapshot =
                                    //     await newPets.doc(newPets.id).get();
                                    // showModalBottomSheet(
                                    //   backgroundColor: Palette.green,
                                    //   isScrollControlled: true,
                                    //   context: context,
                                    //   builder: (context) => EditingBottomsheet(
                                    //       newpetsId: newPetsSnapshot.id,
                                    //       collectionName: "Dogbreeds",
                                    //       subId:
                                    //           subCollectionDocuments[index].id,
                                    //       breed: dogData.breed,
                                    //       data: subData,
                                    //       documentId: dogData.id),
                                    // );
                                  },
                                  toDelete: () async {
                                    // Reference to the specific document in NewPets that corresponds to the dog being deleted
                                    String dogName = subData['name'];
                                    QuerySnapshot newPetsSnapshot =
                                        await newPets
                                            .where('name', isEqualTo: dogName)
                                            .get();

                                    // Delete from NewPets collection if it exists
                                    for (var doc in newPetsSnapshot.docs) {
                                      await newPets.doc(doc.id).delete();
                                    }
                                    await dogSubCollection
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
