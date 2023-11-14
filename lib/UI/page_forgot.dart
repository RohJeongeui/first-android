import 'package:connect_1000/UI/AppConstant.dart';
import 'package:connect_1000/UI/custom_ctrl.dart';
import 'package:connect_1000/UI/page_login.dart';
import 'package:connect_1000/providers/forgotviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageForgot extends StatelessWidget {
  PageForgot({super.key});
  static String routename  = "/forgot";
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<ForgotViewmodel>(context);
    final size = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: viewmodel.status == 3?
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(image: AssetImage('assets/images/giphy.gif'),width: 100),
                const Text("Đã gửi yêu cầu thành công!",),
                const Text("Truy cập vào email và làm theo hướng dẫn.",),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: 
                    [GestureDetector
                    
                (onTap: () {
                  viewmodel.status = 0;
                  Navigator.popAndPushNamed(context, PageLogin.routename);
                },
                child: Text("Bấm vào đây ",style: AppConstant.textlink,)), 
                      const Text("để đăng nhập ")],
               )     
                      ],),
            )
          :
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(image: AssetImage('assets/images/wechat.gif'),width: 200,),
                    const SizedBox(width: 20,),
                    const Text("Hãy điền các thông tin cần thiết!"),
                    const SizedBox(height: 10,),
                    CustomTextField(
                      textController: _emailController,
                      hintText:"email" ,
                      obscureText: false,),
                      const SizedBox(height: 10,),
                      Text(viewmodel.errorMessage,style: AppConstant.text_error,),
                      GestureDetector(
                        onTap: (){
                          final email = _emailController.text.trim();
                          viewmodel.forgotPassword(email);
                        },
                        child: const Custom_Button(textButton: 'Gửi yêu cầu!')),
                      const SizedBox(height: 10,),
                      GestureDetector(
                        onTap:  () => Navigator.of(context).popAndPushNamed(PageLogin.routename),
                          child: Text("Đăng nhập!",
                          style: AppConstant.textlink
                      ))
                  ],
                ),
              ),
              viewmodel.status == 1?CustomSpinner(size: size):Container(),
            ],
          ),
        ),
      ),
    );
  }
}