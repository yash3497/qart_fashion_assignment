import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:qart_fashion_assignment/backend/storage/local_storage.dart';
import 'package:qart_fashion_assignment/screens/home_screen.dart';
import 'package:qart_fashion_assignment/utils/keys.dart';

class ProductApiCalling extends GetxController {
  List produtList = [];
  List tempList = [];

  callApi() async {
    try {
      String url =
          "https://ios.qartsolutions.com/api/product/GetProductsWithSizes?retailerCode=40984";
      Map<String, String> headers = {
        'content-type': 'application/json',
        'Accept': 'application/json',
      };
      var response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        produtList = data['Products'];
        tempList = produtList;
        LocalStorage.save(StorageKey.productList, jsonEncode(produtList));
        update();
        Get.off(() => HomeScreen());
      } else {
        print("ERROR: ${response.statusCode}");
      }
    } catch (e) {
      print("API Error: $e");
    }
  }

  checkDataInLocalStorage() async {
    var data = await LocalStorage.read(StorageKey.productList);
    if (data != null) {
      await Future.delayed(Duration(seconds: 3));
      produtList = jsonDecode(data);
      tempList = produtList;
      update();
      Get.off(() => HomeScreen());
    } else {
      callApi();
    }
  }

  searchProduct(String value) async {
    if (value != null || value != "") {
      produtList = tempList;
      produtList = produtList
          .where((element) => element['QRCode']
              .toString()
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
      update();
    } else {
      produtList = tempList;
      update();
    }
  }

  updateData() {
    produtList = tempList;
    update();
  }
}
