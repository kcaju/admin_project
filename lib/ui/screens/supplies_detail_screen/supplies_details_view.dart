import 'package:admin_project/constants/app_colors.dart';
import 'package:admin_project/ui/screens/supplies_detail_screen/supplies_details_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SuppliesDetailsView extends StatelessWidget {
  const SuppliesDetailsView(
      {super.key,
      required this.name,
      required this.desc,
      required this.size,
      required this.url,
      required this.benefits,
      required this.price,
      this.isAccessory = false});
  final String name, desc, size, url, benefits;
  final num price;
  final bool isAccessory;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SuppliesDetailsViewmodel>.reactive(
      viewModelBuilder: () {
        return SuppliesDetailsViewmodel();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Palette.scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: Palette.first,
            leading: IconButton(
                onPressed: () {
                  viewModel.goBack();
                },
                icon: Icon(
                  Icons.pets,
                  size: 26,
                  color: Palette.black,
                )),
            centerTitle: true,
            title: Text(
              "Pet Supplies Details",
              style:
                  TextStyle(color: Palette.black, fontWeight: FontWeight.bold),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Container(
              padding: EdgeInsets.all(15),
              // height: 700,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 280,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(url)),
                        borderRadius: BorderRadius.circular(15),
                        color: Palette.grey),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Palette.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "$price ₹",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Palette.black,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "Size: $size",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Palette.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Description:",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Palette.black,
                                  fontWeight: FontWeight.w800),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              desc,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Palette.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            isAccessory
                                ? SizedBox()
                                : Text(
                                    "Benefits:",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Palette.black,
                                        fontWeight: FontWeight.w800),
                                  ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              isAccessory ? "" : benefits,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Palette.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Center(
                  //   child: SizedBox(
                  //       height: 50,
                  //       width: 200,
                  //       child: ElevatedButton(
                  //           style: ButtonStyle(
                  //               backgroundColor:
                  //                   WidgetStatePropertyAll(Palette.blue3)),
                  //           onPressed: () async {
                  //             // viewModel.addtoCart();

                  //             viewModel.showOrderDialog(
                  //                 context, name, url, price, "Order Placed", 1);
                  //           },
                  //           child: Text(
                  //             "Add to Cart",
                  //             style: TextStyle(
                  //                 color: Palette.mainWhite,
                  //                 fontSize: 18,
                  //                 fontWeight: FontWeight.bold),
                  //           ))),
                  // )
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Palette.thrid),
            ),
          ),
        );
      },
    );
  }
}
