import 'package:admin_project/constants/app_colors.dart';
import 'package:admin_project/ui/widgets/custom_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditSupplies extends StatefulWidget {
  const EditSupplies(
      {super.key,
      required this.data,
      this.collectionName,
      required this.Id,
      this.isAccessory = false});
  final Map<String, dynamic> data;
  final String? collectionName;
  final String Id;
  final bool isAccessory;

  @override
  State<EditSupplies> createState() => _EditSuppliesState();
}

class _EditSuppliesState extends State<EditSupplies> {
  TextEditingController productName = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController size = TextEditingController();
  TextEditingController imgeUrl = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController benefits = TextEditingController();
  //dropdown values
  List<String> selectCategory = ["Petfoods", 'Petmedicines', 'Petssupplies'];
  String? category;

  @override
  void initState() {
    productName.text = widget.data['name'];
    price.text = widget.data['price'].toString();
    size.text = widget.data['size'];
    imgeUrl.text = widget.data['url'];
    benefits.text = widget.data['benefits'];
    desc.text = widget.data['desc'];
    super.initState();
  }

  Future<void> updateData() async {
    var allSupplies =
        FirebaseFirestore.instance.collection(widget.collectionName.toString());
    await allSupplies.doc(widget.Id).update({
      'name': productName.text,
      "price": num.parse(price.text),
      "desc": desc.text,
      "benefits": benefits.text,
      "url": imgeUrl.text,
      "size": size.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextfield(
                data: "Product name",
                controller: productName,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextfield(
                      data: "Price",
                      controller: price,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: CustomTextfield(
                      data: "Size",
                      controller: size,
                    ),
                  ),
                ],
              ),
              CustomTextfield(
                data: "ImageUrl",
                controller: imgeUrl,
              ),
              widget.isAccessory
                  ? SizedBox()
                  : CustomTextfield(
                      maxlines: 5,
                      data: "Benefits",
                      controller: benefits,
                    ),
              CustomTextfield(
                maxlines: 5,
                data: "Description",
                controller: desc,
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () async {
                    updateData();
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Palette.green1,
                      content: Text(
                        "Data Updated",
                        style: TextStyle(
                          color: Palette.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ));
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Palette.black),
                  ),
                  child: Text(
                    "Update",
                    style: TextStyle(
                      color: Palette.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
