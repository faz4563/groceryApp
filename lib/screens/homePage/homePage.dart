// ignore_for_file: file_names, unrelated_type_equality_checks

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_project/models/getProdModels.dart';
import 'package:grocery_project/screens/cart/cart.dart';

import '../../controller/apicontroller.dart';
import '../../utils/ApiConstants.dart';
import 'productViewPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

GetProdModel productDetails = GetProdModel();
bool dataFound = false;
bool searchEnabled = false;
GetProdModel? filteredList = productDetails;

class _HomePageState extends State<HomePage> {
  gettingProductDetails() async {
    var response = await ApiController.get(ApiConstants.getProdApi);
    productDetails = GetProdModel.fromJson(response);
    filteredList = productDetails;
    if (filteredList!.flag == "T") {
      setState(() {
        dataFound = true;
      });
    }
  }

  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    gettingProductDetails();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    searchEnabled = !searchEnabled;
                  });
                },
                icon: const Icon(Icons.search))
          ],
          title: searchEnabled == false
              ? Text(
                  "Friends Groceries",
                  style: TextStyle(
                      fontSize: 20.sp,
                      letterSpacing: 2,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic),
                )
              : TextFormField(
                  controller: searchController,
                  autofocus:
                      FocusManager.instance.primaryFocus == true ? false : true,
                  focusNode: FocusNode(canRequestFocus: true),
                  onChanged: (value) {
                    setState(() {
                      if (value.isEmpty) {
                        searchEnabled = false;
                        gettingProductDetails();
                        FocusManager.instance.primaryFocus?.unfocus();
                      } else {
                        filteredList!.status = productDetails.status!
                            .where((item) => item.prodName!
                                .toUpperCase()
                                .contains(value.toUpperCase()))
                            .toList();
                      }
                    });
                  },
                  onEditingComplete: () {},
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
        ),
        body: dataFound == true
            ? SizedBox(
                width: width,
                height: height,
                child: Column(children: <Widget>[
                  Expanded(
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      primary: true,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(5),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1,
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 20),
                      itemCount: filteredList!.status!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductView(
                                    id: filteredList!.status![index].id!.oid!,
                                    prodAmount: filteredList!
                                        .status![index].prodAmount!,
                                    prodCode:
                                        filteredList!.status![index].prodCode!,
                                    prodName:
                                        filteredList!.status![index].prodName!,
                                    prodExpiry: filteredList!
                                        .status![index].prodExpiry!,
                                    prodPrice:
                                        filteredList!.status![index].prodPrice!,
                                    prodImg:
                                        "http://${ApiConstants.ip}/vegetables/${filteredList!.status![index].prodImg!}",
                                  ),
                                ));
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: Card(
                                  elevation: 0,
                                  // shape: const BeveledRectangleBorder(
                                  //     side: BorderSide(
                                  //   color: Colors.black,
                                  //   width: 0.5,
                                  // )),
                                  child: FadeInDownBig(
                                    animate: true,
                                    from: 50,
                                    child: Image.network(
                                      width: 300,
                                      height: 200,
                                      "http://${ApiConstants.ip}/vegetables/${filteredList!.status![index].prodImg}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: ListTile(
                                  tileColor: const Color(0xff55DDFF),
                                  title: Text(
                                    filteredList!.status![index].prodName
                                        .toString()
                                        .toUpperCase(),
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  trailing: Text(
                                    "Rs ${filteredList!.status![index].prodPrice}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ]),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const MyCart();
              },
            ));
          },
          child: const Icon(Icons.shopping_basket),
        ),
      ),
    );
  }
}
