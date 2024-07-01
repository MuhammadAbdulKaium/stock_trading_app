// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCategories extends StatelessWidget {
  const ProductCategories({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
                'Agri-Product Categories',
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
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Container()
            ),
            Expanded(
              flex: 100,
              child: Container(
                decoration: BoxDecoration(
                  // color: const Color(0xFFF4FCF7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GridView.count(
                  shrinkWrap: true, // Add shrinkWrap
                  primary: false,
                  childAspectRatio: 0.80,
                  padding: const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
                  crossAxisSpacing: screenWidth * 0.0550,
                  mainAxisSpacing: screenWidth * 0.0500,
                  crossAxisCount: 3,
                  children: <Widget>[
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 80,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF7F0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: SizedBox(
                                  height: screenWidth * 0.1390,
                                  width: screenWidth * 0.1390,
                                  child: Image.asset(
                                    'images/grain.png',
                                    fit: BoxFit.contain,
                                    // height: 74,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 20,
                            child: Text('Grain',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF52525B),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 80,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF9F1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: SizedBox(
                                  height: screenWidth * 0.1390,
                                  width: screenWidth * 0.1390,
                                  child: Image.asset(
                                    'images/jute.png',
                                    fit: BoxFit.contain,
                                    // height: 74,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 20,
                            child: Text('Jute',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF52525B),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 80,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFE7E7),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: SizedBox(
                                  height: screenWidth * 0.1390,
                                  width: screenWidth * 0.1390,
                                  child: Image.asset(
                                    'images/fruit.png',
                                    fit: BoxFit.contain,
                                    // height: 74,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 20,
                            child: Text('Fruit',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF52525B),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 80,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFF7FFEF),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: SizedBox(
                                  height: screenWidth * 0.1390,
                                  width: screenWidth * 0.1390,
                                  child: Image.asset(
                                    'images/tea.png',
                                    fit: BoxFit.contain,
                                    // height: 74,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 20,
                            child: Text('Tea',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF52525B),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 80,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF4E4),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: SizedBox(
                                  height: screenWidth * 0.1390,
                                  width: screenWidth * 0.1390,
                                  child: Image.asset(
                                    'images/vegetable.png',
                                    fit: BoxFit.contain,
                                    // height: 74,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 20,
                            child: Text('Vegetable',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF52525B),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 80,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFFBEDE5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: SizedBox(
                                  height: screenWidth * 0.1390,
                                  width: screenWidth * 0.1390,
                                  child: Image.asset(
                                    'images/spices.png',
                                    fit: BoxFit.contain,
                                    // height: 74,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 20,
                            child: Text('Spices',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF52525B),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 80,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFEBEE),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: SizedBox(
                                  height: screenWidth * 0.1390,
                                  width: screenWidth * 0.1390,
                                  child: Image.asset(
                                    'images/textiles.png',
                                    fit: BoxFit.contain,
                                    // height: 74,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 20,
                            child: Text('Textiles',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF52525B),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 80,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFE9FFF5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: SizedBox(
                                  height: screenWidth * 0.1390,
                                  width: screenWidth * 0.1390,
                                  child: Image.asset(
                                    'images/agriculture.png',
                                    fit: BoxFit.contain,
                                    // height: 74,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 20,
                            child: Text('Agriculture',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF52525B),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 80,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFF4FCF7),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: SizedBox(
                                  height: screenWidth * 0.1390,
                                  width: screenWidth * 0.1390,
                                  child: Image.asset(
                                    'images/others.png',
                                    fit: BoxFit.contain,
                                    // height: 74,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 20,
                            child: Text('Others',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF52525B),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container()
            ),
          ],
        ),
      ],
    );
  }
}