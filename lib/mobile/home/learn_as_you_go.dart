// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stock_trading_app/controller/home_page_controller.dart';

final HomePageController homePageController = Get.put(HomePageController());

class LearnAsYouGo extends StatelessWidget {
  const LearnAsYouGo({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Container()
            ),
            Expanded(
              flex: 100,
              child: Text(
                'Learn as you go',
                style: TextStyle(
                  fontSize: 17.25.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1D192B),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container()
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.0190,),
        SizedBox( // <-- Added SizedBox to constrain PageView's height
          height: screenHeight * 0.2095,  // <-- Adjust this height as needed
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: homePageController.pageController,
                  children: [
                    _buildCard('images/how_to_upload_NID.png', 'How to upload NID', 'Description'),
                    _buildCard('images/how_to_upload_NID.png', 'How to make Payment', 'Description'),
                    _buildCard('images/how_to_upload_NID.png', 'How to upload NID', 'Description'),
                    _buildCard('images/how_to_upload_NID.png', 'How to upload NID', 'Description'),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.0150,),
              SmoothPageIndicator(
                controller: homePageController.pageController,
                count: 4, // Number of cards
                effect: const ExpandingDotsEffect(
                  activeDotColor: Color(0xFF008037),  
                  dotColor: Color(0xFF7FBF9A),
                  dotHeight: 4,
                  dotWidth: 8,
                  expansionFactor: 6,  // Adjust expansion factor as needed
                  spacing: 5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  Widget _buildCard(String imagePath, String title, String description) { 
    return SizedBox(
      // width: width,
      child: Card(
        elevation: 3,
        color: const Color(0xFFF4FCF7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Set the desired radius here
        ),
        child: InkWell(
          onTap: () { 
            // Navigate to the relevant learning content screen (use GetX's Get.to())
            // ...
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: 63,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Flexible(
                flex: 37,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(title,
                        style: TextStyle(
                          fontSize: 11.65.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF008037),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(description,
                        style: TextStyle(
                          fontSize: 9.9.sp,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF1D192B),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}