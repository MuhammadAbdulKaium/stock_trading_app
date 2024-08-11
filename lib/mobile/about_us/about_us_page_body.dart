import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsPageBody extends StatelessWidget {
  const AboutUsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.046296296),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: screenWidth * 0.215,
                child: Image.asset(
                  'images/app_icon_inner_page.png',
                  fit: BoxFit.contain,
                  height: screenWidth * 0.215,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.013,),
          Text(
            'Welcome to Munafa',
            style: TextStyle(
              fontSize: 17.25.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w600,
              color: const Color(0xFF000000),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: screenHeight * 0.0115,),
          Text("Founded with the vision of simplifying agricultural commodity trading, Munafa ofers a unique platform where users can trade, store, and gain insights into various agricultural products. Our mission is to democratize access to the agricultural markets, making it easy for everyone to participate, from individual farmers to large-scale investors.",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 13.5.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w500,
              color: const Color(0xFF1D192B),
              // height: 1.85,
            ),
          ),
          SizedBox(height: screenHeight * 0.035,),
          Text(
            'Our Core Offerings',
            style: TextStyle(
              fontSize: 17.25.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w600,
              color: const Color(0xFF000000),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: screenHeight * 0.010,),
          const OfferingItem(
            title: 'Efficient Trading',
            description: 'Streamlined buying and selling of agricultural commodities.',
          ),
          SizedBox(height: screenHeight * 0.021,),
          const OfferingItem(
            title: 'Reliable Storage',
            description: 'Advanced storage solutions to maintain commodity quality.',
          ),
          SizedBox(height: screenHeight * 0.021,),
          const OfferingItem(
            title: 'Insightful Analytics',
            description: 'Real-time market trends and data to inform your decisions.',
          ),
          SizedBox(height: screenHeight * 0.0375,),
          Text("At Munafa, we're more than just a platform; we're a community committed to fostering sustainable trading practices and supporting the agricultural economy. Join us in redefining the future of agricultural trading.",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 13.5.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w500,
              color: const Color(0xFF1D192B),
              // height: 1.85,
            ),
          ),
        ],
      ),
    );
  }
}

class OfferingItem extends StatelessWidget {
  final String title;
  final String description;

  const OfferingItem({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.0225,),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.0225, top: screenHeight * 0.007),
            child: Icon(Icons.circle, size: screenWidth * 0.0125, color: Colors.black),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 13.5.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF1D192B),
                  // height: 1.85,
                ),
                children: [
                  TextSpan(
                    text: '$title: ',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: description,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}