import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/routers/routes.dart';
import '../controller/wellcome_controller.dart';

class WellcomePage extends GetView<wellcomeController> {
  const WellcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/Images/background_login2.jpg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          // Lớp phủ màu đen với độ mờ
          Container(
            color: Colors.black.withOpacity(0.6), // Màu đen với độ mờ 70%
          ),

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Wellcome to',
                    style: TextStyle(
                        fontFamily: 'Playwrite Danmark Loopet',
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.orange
                        ),
                  ),
                  Text(
                    'Agri Shop',
                    style: TextStyle(
                        fontFamily: 'Playwrite Danmark Loopet',
                        fontSize: 30,
                        color: Colors.white
                        ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: Column( // Sử dụng Column để chứa nhiều Container
                      children: [
                        InkWell(
                          onTap:(){
                            Get.toNamed(Routes.login);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),

                            child: Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                          ),
                        ),
                        SizedBox(height: 20), // Khoảng cách giữa hai Container
                        InkWell(
                          onTap:(){
                            Get.toNamed(Routes.register);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),

                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
