import 'package:admin_project/constants/app_colors.dart';
import 'package:admin_project/ui/screens/cats_list/tab/cattab_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

class CatTabView extends StatelessWidget {
  const CatTabView(
      {super.key,
      required this.name,
      required this.location,
      required this.url,
      required this.price,
      this.toEdit,
      this.toDelete});
  final String name, location, url;
  final num price;
  final VoidCallback? toEdit, toDelete;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CattabViewmodel>.reactive(
      viewModelBuilder: () {
        return CattabViewmodel();
      },
      builder: (context, viewModel, child) {
        return Container(
          height: 200,
          width: 150,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
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
                        imageUrl: url,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Shimmer.fromColors(
                          direction: ShimmerDirection.btt,
                          baseColor: Palette.white,
                          highlightColor: Palette.grey,
                          child: Container(
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(50),
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
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                  color: Palette.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: toEdit,
                              child: Icon(
                                Icons.edit,
                                size: 30,
                                color: Palette.violet,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "$price₹",
                          style: TextStyle(
                              color: Palette.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.pin_drop,
                              color: Palette.black,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              location,
                              style: TextStyle(
                                  color: Palette.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                  right: 2,
                  top: 2,
                  child: InkWell(
                    onTap: toDelete,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Palette.white),
                      child: Icon(
                        Icons.delete,
                        color: Palette.red,
                      ),
                    ),
                  ))
            ],
          ),
          decoration: BoxDecoration(
              color: Palette.thrid, borderRadius: BorderRadius.circular(10)),
        );
      },
    );
  }
}
