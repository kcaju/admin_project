import 'package:admin_project/constants/app_colors.dart';
import 'package:admin_project/ui/screens/add_supplies/add_supplies_viewmodel.dart';
import 'package:admin_project/ui/widgets/custom_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AddSuppliesView extends StatelessWidget {
  const AddSuppliesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddSuppliesViewmodel>.reactive(
      viewModelBuilder: () => AddSuppliesViewmodel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            leading: Icon(null),
            backgroundColor: Palette.first,
            centerTitle: true,
            title: Text(
              "Add New Supplies here !!",
              style: TextStyle(
                color: Palette.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                children: [
                  CustomTextfield(
                    data: "Product name",
                    controller: viewModel.productName,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextfield(
                          data: "Price",
                          controller: viewModel.price,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: CustomTextfield(
                          data: "Size",
                          controller: viewModel.size,
                        ),
                      ),
                    ],
                  ),
                  // Changed from Expanded to Container
                  Container(
                    height: 50, // Set a fixed height
                    child: DropdownButton(
                      dropdownColor: Palette.scaffoldBackgroundColor,
                      value: viewModel.category,
                      hint: Text(
                        "Category",
                        style: TextStyle(
                          color: Palette.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      items: List.generate(
                        viewModel.selectCategory.length,
                        (index) => DropdownMenuItem(
                          value: viewModel.selectCategory[index],
                          child: Text(viewModel.selectCategory[index]),
                        ),
                      ),
                      onChanged: (value) {
                        viewModel.onChangedCategory(value);
                      },
                    ),
                  ),
                  CustomTextfield(
                    data: "ImageUrl",
                    controller: viewModel.imgeUrl,
                  ),
                  CustomTextfield(
                    maxlines: 5,
                    data: "Benefits",
                    controller: viewModel.benefits,
                  ),
                  CustomTextfield(
                    maxlines: 5,
                    data: "Description",
                    controller: viewModel.desc,
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () async {
                        var allProducts = FirebaseFirestore.instance
                            .collection(viewModel.category.toString());
                        num parsedPrice = num.parse(viewModel.price.text);

                        await allProducts.add({
                          "desc": viewModel.desc.text,
                          "url": viewModel.imgeUrl.text,
                          "benefits": viewModel.benefits.text,
                          "price": parsedPrice,
                          "name": viewModel.productName.text,
                          "size": viewModel.size.text
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Palette.blue,
                          content: Text(
                            "Product Added",
                            style: TextStyle(
                              color: Palette.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ));

                        viewModel.clearForm();
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Palette.black),
                      ),
                      child: Text(
                        "Submit",
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
      },
    );
  }
}
