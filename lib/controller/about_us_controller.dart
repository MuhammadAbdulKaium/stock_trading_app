import 'package:get/get.dart';

class AboutUsController extends GetxController {
  var isLoading = false.obs;

  Future<void> loadAboutUsPage() async {
    isLoading(true);
    try {
      // bankDetails.value = BankDetailsModel(
      //   id: '1',
      //   bankName: 'Dutch Bangla Bank',
      //   branchName: 'Rangpur Branch',
      //   accountName: 'Stock House LTD',
      //   accountNumber: '03597561512145152152',
      //   routingNumber: '23546878984',
      // );

      // remainingLot.value = maximumLot.value = investmentOpportunityDetails.value.lotSize!.toInt();
      // currentBuyingPrice.value = investmentOpportunityDetails.value.pricePerUnit!.toDouble();

      Get.toNamed("/about_us_page");
    } catch (e) {
      // throw Exception('Error: $e');
      // Get.dialog(
      //   CustomAlartDialog(
      //     begin: 0,
      //     end: 0,
      //     alignment: Alignment.bottomCenter,
      //     duration: 300,
      //     borderRadius: const BorderRadius.all(Radius.circular(0)),
      //     horizontalPadding: 0,
      //     backgroundColor: Colors.red,
      //     dialogHeader: const SizedBox(
      //       height: 50,
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           Text(
      //             'Something went wrong please try again.',
      //             style: TextStyle(
      //               fontSize: 12.5,
      //               color: Colors.white,
      //               fontFamily: 'FontCircularStd',
      //               fontWeight: FontWeight.w500
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     dialogContent: Container(),
      //   )
      // );
    } finally {
      isLoading(false);
    }
  }
}