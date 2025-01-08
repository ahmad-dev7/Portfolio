import 'dart:convert';

import 'package:aali_portfolio/constants/k_constants.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:multi_state_button/multi_state_button.dart';

class MyController extends GetxController {
  var isDark = true.obs;
  var autoPlayCarousel = true.obs;
  var carouselCtrl = CarouselSliderController();
  var activeIndex = 2.obs;
  var scrollCtrl = ScrollController();
  var hoveredProject = (-1).obs;
  var isProfileHovered = false.obs;
  var formKey = GlobalKey<FormState>();
  var multiStateButtonController = MultiStateButtonController(initialStateName: submitState).obs;
  Rx<String?> name = ''.obs;
  Rx<String?> email = ''.obs;
  Rx<String?> subject = ''.obs;
  Rx<String?> message = ''.obs;

  submitForm(
      {required String? name, required String? subject, required String? email, required String? message}) async {
    var web3Url = 'https://api.web3forms.com/submit';
    var web3AccessKey = ''; // Get your access key from web3Form [Ahmad you can check you email for this]

    if (formKey.currentState!.validate()) {
      try {
        multiStateButtonController.value.setButtonState = loadingState;
        var postResponse = await http.post(
          Uri.parse(web3Url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: jsonEncode({
            'access_key': web3AccessKey,
            'Name': name,
            'Subject': subject,
            'Email': email,
            'Message': message,
          }),
        );
        print("Reached here");
        if (postResponse.statusCode == 200) {
          formKey.currentState!.reset();
          multiStateButtonController.value.setButtonState = successState;
        } else {
          multiStateButtonController.value.setButtonState = errorState;
          Future.delayed(const Duration(seconds: 4)).then(
            (value) => multiStateButtonController.value.setButtonState = submitState,
          );
        }
      } catch (e) {
        Get.printError(info: e.toString());
        multiStateButtonController.value.setButtonState = errorState;
        Future.delayed(const Duration(seconds: 4)).then(
          (value) => multiStateButtonController.value.setButtonState = submitState,
        );
      }
    }
  }
}



// const response = await fetch("https://api.web3forms.com/submit", {
//           method: "POST",
//           headers: {
//             "Content-Type": "application/json",
//             Accept: "application/json",
//           },
//           body: JSON.stringify({
//             access_key: WEB3FORMS_ACCESS_KEY,
//             name: this.name,
//             email: this.email,
//             message: this.message,
//           }),
//         });
//         const result = await response.json();
//         if (result.success) {
//           console.log(result);
//         }
//       },
//     },
