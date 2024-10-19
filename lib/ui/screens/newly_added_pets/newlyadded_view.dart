import 'package:admin_project/constants/app_colors.dart';
import 'package:admin_project/ui/screens/newly_added_pets/newlyadded_viewmodel.dart';
import 'package:admin_project/ui/widgets/custom_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NewlyaddedView extends StatelessWidget {
  const NewlyaddedView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewlyaddedViewmodel>.reactive(
      viewModelBuilder: () {
        return NewlyaddedViewmodel();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            leading: Icon(null),
            backgroundColor: Palette.first,
            centerTitle: true,
            title: Text(
              "Add New Pets here !!",
              style:
                  TextStyle(color: Palette.black, fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Form(
                key: viewModel.formkey,
                child: Column(
                  children: [
                    CustomTextfield(
                        data: "Pet's name", controller: viewModel.petname),
                    CustomTextfield(
                        data: "Owner's name", controller: viewModel.ownername),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButton(
                            dropdownColor: Palette.thrid,
                            value: viewModel.petCategory,
                            hint: Text(
                              "Pet Category",
                              style: TextStyle(
                                  color: Palette.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                            items: List.generate(
                              viewModel.selectCategory.length,
                              (index) => DropdownMenuItem(
                                  value: viewModel.selectCategory[index],
                                  child: Text(viewModel.selectCategory[index])),
                            ),
                            onChanged: (value) {
                              viewModel.onChangedCategory(value);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: DropdownButton(
                            dropdownColor: Palette.thrid,
                            value: viewModel.chooseBreed,
                            hint: Text(
                              "Breed",
                              style: TextStyle(
                                  color: Palette.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                            items: List.generate(
                              viewModel.selectBreed.length,
                              (index) => DropdownMenuItem(
                                  value: viewModel.selectBreed[index],
                                  child: Text(viewModel.selectBreed[index])),
                            ),
                            onChanged: (value) {
                              viewModel.onChangedBreed(value);
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextfield(
                              data: "Price", controller: viewModel.price),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: CustomTextfield(
                              data: "Color", controller: viewModel.color),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: CustomTextfield(
                              data: "Age", controller: viewModel.age),
                        ),
                      ],
                    ),
                    CustomTextfield(
                        data: "ImageUrl", controller: viewModel.url),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextfield(
                              data: "Location", controller: viewModel.location),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: DropdownButton(
                            dropdownColor: Palette.thrid,
                            value: viewModel.chooseSex,
                            hint: Text(
                              "Sex",
                              style: TextStyle(
                                  color: Palette.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                            items: List.generate(
                              viewModel.selectSex.length,
                              (index) => DropdownMenuItem(
                                  value: viewModel.selectSex[index],
                                  child: Text(viewModel.selectSex[index])),
                            ),
                            onChanged: (value) {
                              viewModel.onChangedSex(value);
                            },
                          ),
                        ),
                      ],
                    ),
                    CustomTextfield(
                        maxlines: 5,
                        data: "Description",
                        controller: viewModel.desc),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                          onPressed: () async {
                            var newPets = FirebaseFirestore.instance
                                .collection("NewPets");
                            num parsedPrice = num.parse(viewModel.price.text);
                            num parsedAge = num.parse(viewModel.age.text);
                            if (viewModel.formkey.currentState!.validate()) {
                              await newPets.add({
                                "age": parsedAge,
                                "breed": viewModel.chooseBreed,
                                "color": viewModel.color.text,
                                "category": viewModel.petCategory,
                                "desc": viewModel.desc.text,
                                "url": viewModel.url.text,
                                "location": viewModel.location.text,
                                "price": parsedPrice,
                                "name": viewModel.petname.text,
                                "owner": viewModel.ownername.text,
                                "sex": viewModel.chooseSex,
                              });
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      backgroundColor: Palette.blue,
                                      content: Text(
                                        "${viewModel.petname.text} Added ",
                                        style: TextStyle(
                                            color: Palette.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )));

                              viewModel
                                  .clearForm(); //to clear the Textformfield
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Palette.black)),
                          child: Text(
                            "Submit",
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
      },
    );
  }
}
