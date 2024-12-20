import 'package:admin_project/constants/app_colors.dart';
import 'package:admin_project/ui/widgets/custom_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditingBottomsheet extends StatefulWidget {
  const EditingBottomsheet(
      {super.key,
      this.isLoveBird = false,
      required this.data,
      required this.documentId,
      required this.breed,
      required this.subId,
      this.collectionName,
      required this.newpetsId});
  final Map<String, dynamic> data;
  final String documentId, breed, subId, newpetsId;
  final String? collectionName;
  final bool isLoveBird;

  @override
  State<EditingBottomsheet> createState() => _EditingBottomsheetState();
}

class _EditingBottomsheetState extends State<EditingBottomsheet> {
  TextEditingController petname = TextEditingController();
  TextEditingController ownername = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController color = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController sex = TextEditingController();
  TextEditingController url = TextEditingController();
  TextEditingController phone = TextEditingController();

  final formkey = GlobalKey<FormState>();
  String? pair;
  List<String> selectSex = ["male", 'female'];
  List<String> selectCategory = ["Dog", 'Cat', 'Bird'];
  List<String> selectBreed = [
    "Siberian-Husky",
    'Rottweiler',
    'Golden-Retriever',
    'Beagle',
    'St.Bernard',
    'British-Shorthair',
    'Persian-Cat',
    'Siberian-Cat',
    'Ragdoll',
    'Maine-Coon',
    'Macaw',
    'Conure',
    'Cockatiel',
    'Love-Birds',
    'Dove'
  ];
  String? petCategory;
  String? chooseBreed;
  String? chooseSex;
  @override
  void initState() {
    super.initState();
    petname.text = widget.data['name'];
    ownername.text = widget.data['owner'];
    age.text = widget.data['age'].toString();
    color.text = widget.data['color'];
    desc.text = widget.data['desc'];
    location.text = widget.data['location'];
    chooseSex = widget.data['sex'].toString();
    price.text = widget.data['price'].toString();
    url.text = widget.data['url'];
    petCategory = widget.data['category'];
    chooseBreed = widget.data['breed'];
    phone.text = widget.data['phone'];
    // Set the pair variable based on the isBird property
    pair = widget.isLoveBird ? 'pair' : '';
    if (pair!.isNotEmpty) {
      selectSex.add(pair!); // Add pair to selectSex if it's not empty
    }
  }

  Future<void> updateData() async {
    var newPets = FirebaseFirestore.instance.collection("NewPets");

    var allBreeds = FirebaseFirestore.instance
        .collection("${widget.collectionName}")
        .doc(widget.documentId)
        .collection(widget.breed.toLowerCase());
    await allBreeds.doc(widget.subId).update({
      'name': petname.text,
      'location': location.text,
      'price': num.parse(price.text),
      'age': num.parse(age.text),
      'sex': chooseSex,
      'color': color.text,
      'url': url.text,
      'owner': ownername.text,
      'desc': desc.text,
      'breed': chooseBreed,
      'category': petCategory,
      'phone': phone.text,
    });
    await newPets.doc(widget.newpetsId).update({
      'name': petname.text,
      'location': location.text,
      'price': num.parse(price.text),
      'age': num.parse(age.text),
      'sex': chooseSex,
      'color': color.text,
      'url': url.text,
      'owner': ownername.text,
      'desc': desc.text,
      'breed': chooseBreed,
      'category': petCategory,
      'phone': phone.text,
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
          child: Form(
            key: formkey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextfield(data: "Pet's name", controller: petname),
                Row(
                  children: [
                    Expanded(
                        child: CustomTextfield(
                            data: "Owner's name", controller: ownername)),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: CustomTextfield(
                            isPhone: true,
                            data: "Phone number",
                            controller: phone)),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButton(
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Palette.black),
                        dropdownColor: Palette.green,
                        value: petCategory,
                        hint: Text(
                          "Pet Category",
                          style: TextStyle(
                              color: Palette.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        items: List.generate(
                          selectCategory.length,
                          (index) => DropdownMenuItem(
                              value: selectCategory[index],
                              child: Text(selectCategory[index])),
                        ),
                        onChanged: (value) {
                          setState(() {
                            petCategory = value!;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: DropdownButton(
                        alignment: Alignment.centerRight,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Palette.black),
                        dropdownColor: Palette.green,
                        value: chooseBreed,
                        hint: Text(
                          "Breed",
                          style: TextStyle(
                              color: Palette.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        items: List.generate(
                          selectBreed.length,
                          (index) => DropdownMenuItem(
                              value: selectBreed[index],
                              child: Text(selectBreed[index])),
                        ),
                        onChanged: (value) {
                          setState(() {
                            chooseBreed = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextfield(data: "Price", controller: price),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomTextfield(data: "Color", controller: color),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomTextfield(data: "Age", controller: age),
                    ),
                  ],
                ),
                CustomTextfield(data: "ImageUrl", controller: url),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextfield(
                          data: "Location", controller: location),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: DropdownButton(
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Palette.black),
                        dropdownColor: Palette.green,
                        value: chooseSex,
                        hint: Text(
                          "Sex",
                          style: TextStyle(
                              color: Palette.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        items: List.generate(
                          selectSex.length,
                          (index) => DropdownMenuItem(
                              value: selectSex[index],
                              child: Text(selectSex[index])),
                        ),
                        onChanged: (value) {
                          setState(() {
                            chooseSex = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                CustomTextfield(
                    maxlines: 5, data: "Description", controller: desc),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        updateData();
                        Navigator.pop(
                            context); // Close the bottom sheet after updating
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Palette.green1,
                            content: Text(
                              "Data Updated",
                              style: TextStyle(
                                  color: Palette.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )));
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Palette.black)),
                      child: Text(
                        "Update",
                        style: TextStyle(
                            color: Palette.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
