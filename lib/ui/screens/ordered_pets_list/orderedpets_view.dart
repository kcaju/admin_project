import 'package:admin_project/constants/app_colors.dart';
import 'package:admin_project/ui/screens/ordered_pets_list/orderedpets_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OrderedpetsView extends StatelessWidget {
  const OrderedpetsView({super.key});

  @override
  Widget build(BuildContext context) {
    var orderDetails = FirebaseFirestore.instance.collection("Orderdetails");
    return ViewModelBuilder<OrderedpetsViewmodel>.reactive(
      viewModelBuilder: () {
        return OrderedpetsViewmodel();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            leading: Icon(null),
            backgroundColor: Palette.first,
            centerTitle: true,
            title: Text(
              "Ordered Pets Status",
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: Palette.black),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Container(
              decoration: BoxDecoration(
                  color: Palette.white,
                  border: Border.all(color: Palette.grey),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pets List :",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Palette.black),
                    ),
                    Divider(
                      color: Palette.grey,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Pet name & Price:",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Palette.violet),
                        ),
                        Text(
                          "OrderId:",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Palette.violet),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          "Status:",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Palette.violet),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                      ],
                    ),
                    Divider(
                      color: Palette.grey,
                    ),
                    Expanded(
                      child: StreamBuilder<QuerySnapshot>(
                        stream: orderDetails.snapshots(),
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

                          return SingleChildScrollView(
                            child: Column(
                              children: List.generate(
                                documents.length,
                                (index) {
                                  Map<String, dynamic> data = documents[index]
                                      .data()! as Map<String, dynamic>;
                                  return Card(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image:
                                                        CachedNetworkImageProvider(
                                                            data['image'])),
                                                shape: BoxShape.rectangle),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                data['petname'],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: Palette.black),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "${data['price'].toString()} ₹",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: Palette.black),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                            child: Text(
                                              data['OrderId'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                  color: Palette.black),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          DropdownButton(
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                                color: Palette.blue2),
                                            dropdownColor:
                                                Palette.scaffoldBackgroundColor,
                                            value: data['status'] ??
                                                viewModel.status,
                                            hint: Text(
                                              "Status",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15,
                                                  color: Palette.black),
                                            ),
                                            items: List.generate(
                                              viewModel.selectStatus.length,
                                              (index) => DropdownMenuItem(
                                                  value: viewModel
                                                      .selectStatus[index],
                                                  child: Text(viewModel
                                                      .selectStatus[index])),
                                            ),
                                            onChanged: (value) {
                                              // Update Firestore status
                                              orderDetails
                                                  .doc(documents[index].id)
                                                  .update({'status': value});
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
