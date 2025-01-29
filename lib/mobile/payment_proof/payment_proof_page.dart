import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stock_trading_app/common/custom_loader.dart';
import 'package:stock_trading_app/controller/payment_proof_controller.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';
import 'package:stock_trading_app/mobile/payment_proof/confirm_payment_button.dart';
import 'package:stock_trading_app/mobile/payment_proof/payment_proof_basic_info.dart';

class PaymentProofPage extends StatelessWidget {
  const PaymentProofPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentProofController paymentProofController = Get.put(PaymentProofController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PopScope(
            canPop: true,
            onPopInvoked: (_) async{
              Future.delayed(const Duration(milliseconds: 300), () {
                paymentProofController.resetVariables();
              });
            },
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  expandedHeight: screenHeight * 0.095,
                  floating: true,
          
                  automaticallyImplyLeading: false,
                  leading: null,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: screenWidth * 0.013, right: screenWidth * 0.013, top: screenHeight * 0.020, bottom: screenHeight * 0.020),
                          margin: const EdgeInsets.only(top: 0, left: 0, right: 0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Builder(builder: (context) => Padding(
                                    padding: const EdgeInsets.only(top: 0, left: 0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container()
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: CircleAvatar(
                                            radius: screenWidth * 0.0520,
                                            backgroundColor: const Color(0xFFF4FCF7),
                                            child: SizedBox(
                                              height: screenWidth * 0.1040,
                                              width: screenWidth * 0.1040,
                                              child: IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: Center(
                                                  child: Icon(
                                                    CustomIcons.backArrow2,
                                                    size: screenWidth * 0.054,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                splashRadius: screenWidth * 0.052,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 15,
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Payment Proof',
                                    style: TextStyle(
                                      fontSize: 23.sp,
                                      fontFamily: 'Gilroy',
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF1D192B),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: screenHeight - screenHeight * 0.1225,
                    alignment: Alignment.topCenter,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PaymentProofBasicInfo(),
                          ConfirmPaymentButton()
                        ],
                      ),
                  ),
                ),
              ],
            )
          ),

          Obx(() {
            return paymentProofController.isLoading.value ? const CustomLoader() : const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}