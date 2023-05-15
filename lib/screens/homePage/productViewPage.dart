// ignore_for_file: prefer_typing_uninitialized_variables, implementation_imports, avoid_print

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_project/controller/apicontroller.dart';
import 'package:grocery_project/models/saveOrderModel.dart';
import 'package:grocery_project/utils/ApiConstants.dart';

class ProductView extends StatefulWidget {
  const ProductView(
      {super.key,
      this.id,
      this.prodCode,
      this.prodName,
      this.prodPrice,
      this.prodAmount,
      this.prodExpiry,
      this.prodImg});
  final id;
  final prodCode;
  final prodName;
  final prodPrice;
  final prodAmount;
  final prodExpiry;
  final prodImg;

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final TextEditingController priceController = TextEditingController();
  SaveOrderModel saveOrder = SaveOrderModel();

  savingOrder(prodCode, prodName, prodPrice, prodAmount, prodImg) async {
    var data = {
      "prod_code": prodCode,
      "prod_name": prodName,
      "prod_price": prodPrice,
      "prod_amount": prodAmount,
      "prod_img": prodImg
    };
    var response =
        await ApiController.post(ApiConstants.saveOrderApi, jsonEncode(data));
    saveOrder = SaveOrderModel.fromJson(response);
  }

  String? price;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.prodName),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 200,
                  child: Image.network(
                    widget.prodImg,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Product Name :- ",
                              style: TextStyle(
                                fontSize: 22,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              widget.prodName.toString().toUpperCase(),
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.red,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Product Code :- ",
                              style: TextStyle(
                                fontSize: 22,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              widget.prodCode.toString().toUpperCase(),
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.red,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Product Expiry :- ",
                              style: TextStyle(
                                fontSize: 22,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              widget.prodExpiry.toString().toUpperCase(),
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.red,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Product Amount :- ",
                              style: TextStyle(
                                fontSize: 22,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              widget.prodAmount.toString().toUpperCase(),
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.red,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Product Price :- ",
                              style: TextStyle(
                                fontSize: 22,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "${widget.prodPrice.toString().toUpperCase()} Rs /-",
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.red,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Amount of Kilograms Required",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 50,
                              width: 70,
                              child: TextFormField(
                                controller: priceController,
                                keyboardType: TextInputType.phone,
                                style: const TextStyle(fontSize: 18),
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    setState(() {
                                      price = (int.parse(widget.prodPrice) *
                                              int.parse(priceController.text))
                                          .toString();
                                      print(price.toString());
                                    });
                                  } else {
                                    setState(() {
                                      price = "0";
                                    });
                                  }
                                },
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    hintText: "1 kg",
                                    hintStyle: TextStyle(),
                                    border: OutlineInputBorder()),
                              ),
                            ),
                            const Text("------>"),
                            Container(
                              decoration: BoxDecoration(border: Border.all()),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text(priceController.text.isNotEmpty
                                    ? price
                                    : widget.prodPrice),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    savingOrder(
                        widget.prodCode,
                        widget.prodName,
                        price.toString(),
                        priceController.text.isNotEmpty
                            ? priceController.text
                            : "1",
                        widget.prodImg);
                    Navigator.pop(context);
                  },
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(200, 50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Icon(
                        Icons.shopping_bag,
                        size: 30,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
