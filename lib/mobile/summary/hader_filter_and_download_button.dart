import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stock_trading_app/common/common_button.dart';
import 'package:stock_trading_app/helpers/custom_icons.dart';

class HaderFilterAndDownloadButton extends StatelessWidget {
  const HaderFilterAndDownloadButton({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(),
        ),
        Expanded(
          flex: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: screenWidth * 0.214,
                height: screenHeight * 0.045,
                child: CommonButton(
                  borderRadius: 8,
                  padding: EdgeInsets.only(left: screenWidth * 0.036, right: screenWidth * 0.036),
                  backgroundColor: const Color(0xFF008037),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Filter',
                        style: TextStyle(
                          fontSize: 11.9.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(
                        CustomIcons.filterSquare,
                        color: Colors.white,
                        size: screenWidth * 0.0425,
                      ),
                    ],
                  ),
                  onPressed: () {
                    
                  },
                ),
              ),
              SizedBox(width: screenWidth * 0.0414,),
              CircleAvatar(
                radius: screenWidth * 0.0510,
                backgroundColor: const Color(0xFF008037),
                child: Center(
                  child: Icon(
                    CustomIcons.import2,
                    size: screenWidth * 0.0575,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(),
        ),
      ],
    );
  }
}