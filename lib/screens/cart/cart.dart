import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_project/controller/apicontroller.dart';
import 'package:grocery_project/models/cartModel.dart';
import 'package:grocery_project/utils/ApiConstants.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  GetCartModel cartData = GetCartModel();
  bool dataFound = false;
  gettingCartData() async {
    var response = await ApiController.get(ApiConstants.getOrderApi);
    cartData = GetCartModel.fromJson(response);
    if (cartData.flag == "T") {
      setState(() {
        dataFound = true;
      });
    }
  }

  @override
  void initState() {
    gettingCartData();
    super.initState();
  }

  deleteAll() async {
    var response = await ApiController.post(ApiConstants.deleteOrderApi, null);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Cart"),
          automaticallyImplyLeading: true,
          actions: [
            IconButton(
                onPressed: () {
                  deleteAll();
                },
                icon: const Icon(Icons.delete))
          ],
        ),
        body: dataFound == true
            ? SizedBox(
                width: width,
                height: height,
                child: ListView.builder(
                  itemCount: cartData.status!.length,
                  itemBuilder: (context, index) => SizedBox(
                    height: 100,
                    width: width,
                    child: Card(
                      child: Center(
                        child: ListTile(
                          title: Text(
                              "${cartData.status![index].prodName}  ( ${cartData.status![index].prodCode} )"),
                          subtitle: Text(
                              cartData.status![index].prodAmount.toString()),
                          trailing: Text(
                              "\u{20B9} ${cartData.status![index].prodPrice}"),
                        ),
                      ),
                    ),
                  ),
                ))
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
