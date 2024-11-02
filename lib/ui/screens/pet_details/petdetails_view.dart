import 'package:admin_project/constants/app_colors.dart';
import 'package:admin_project/ui/screens/pet_details/petdetails_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

class PetdetailsView extends StatelessWidget {
  const PetdetailsView(
      {super.key,
      required this.name,
      required this.color,
      required this.owner,
      required this.desc,
      required this.sex,
      required this.location,
      required this.url,
      required this.price,
      required this.age,
      required this.phone});
  final String name, color, owner, desc, sex, location, url, phone;
  final num price, age;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PetdetailsViewmodel>.reactive(
      viewModelBuilder: () {
        return PetdetailsViewmodel();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: Palette.black,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            viewModel.goBack();
                          },
                          child: CircleAvatar(
                            backgroundColor: Palette.black,
                            child: Icon(
                              Icons.pets,
                              size: 35,
                              color: Palette.white,
                            ),
                          ),
                        ),
                        // CircleAvatar(
                        //   child: Icon(
                        //     Icons.favorite,
                        //     color: Palette.red,
                        //   ),
                        // )
                      ],
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(url))),
                  ),
                ),
                Container(
                  height: 500,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        //details column
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                    Text(
                                      "$price ₹",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.pin_drop_sharp,
                                      color: Palette.violet,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      location,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Palette.black,
                                          fontSize: 22),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Sex",
                                            style: TextStyle(
                                                color: Palette.violet,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            sex,
                                            style: TextStyle(
                                                color: Palette.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          border:
                                              Border.all(color: Palette.black)),
                                    ),
                                    Container(
                                      height: 100,
                                      width: 100,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Age",
                                            style: TextStyle(
                                                color: Palette.violet,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "$age Years",
                                            style: TextStyle(
                                                color: Palette.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          border:
                                              Border.all(color: Palette.black)),
                                    ),
                                    Container(
                                      height: 100,
                                      width: 100,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Color",
                                            style: TextStyle(
                                                color: Palette.violet,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            color,
                                            style: TextStyle(
                                                color: Palette.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          border:
                                              Border.all(color: Palette.black)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    // CircleAvatar(
                                    //   radius: 25,
                                    //   backgroundImage:
                                    //       Assets.images.profile1.image().image,
                                    // ),
                                    // SizedBox(
                                    //   width: 10,
                                    // ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Owned by :",
                                          style: TextStyle(
                                              color: Palette.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          owner,
                                          style: TextStyle(
                                              color: Palette.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),

                                    Spacer(),
                                    Text(
                                      phone,
                                      style: TextStyle(
                                          color: Palette.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CircleAvatar(
                                      radius: 18,
                                      child: Icon(
                                        size: 20,
                                        Icons.call,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                //description
                                Text(
                                  desc,
                                  style: TextStyle(
                                      color: Palette.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Palette.green),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
