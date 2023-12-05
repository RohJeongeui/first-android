
import 'package:connect_1000/UI/AppConstant.dart';
import 'package:connect_1000/UI/page_forgot.dart';
import 'package:connect_1000/UI/page_register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/loginviewmodel.dart';
import 'custom_ctrl.dart';
import 'page_main.dart';

class PageLogin extends StatelessWidget {
 PageLogin({super.key});
    static String routename = '/login';
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<LoginViewModel>(context);
    final size = MediaQuery.of(context).size;
    if(viewmodel.status == 3){
      Future.delayed(Duration.zero,(){
          Navigator.popAndPushNamed(context, PageMain.routename);
      },
    );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal:100.0),
                          
                          child: AppLogo(),
                        ),
                      ),
                          const SizedBox(
                            height: 10),
                    const Text("Wechat", 
                       style: TextStyle(fontSize:  50 ,fontWeight: FontWeight.bold, color: Color.fromARGB(255, 110, 224, 114)),),
                    const Text("Đăng nhập tài khoản", 
                      style: TextStyle(fontSize:  30 ,fontWeight: FontWeight.bold, color: Color.fromARGB(255, 110, 224, 114)),),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        hintText: "Username",//xntruong || ads || boboiiboy(1-9)
                        textController: _emailController, 
                        obscureText: false,
                      ),
                        const SizedBox(height: 10),
                      CustomTextField(
                        hintText: "Password", //123456789 || 12345678
                        textController: _passwordController, 
                        obscureText: true,
                      ),
                        const SizedBox(height: 20),
                        viewmodel.status == 2? Text(viewmodel.errorMessage,
                        style: const TextStyle(color: Colors.red)): const Text(""),
                        const SizedBox(height: 10,),
                        GestureDetector(
                          onTap: (){
                            String username = _emailController.text.trim();
                            String password = _passwordController.text.trim();
                            viewmodel.login(username, password);
                          },
                          child: const Custom_Button(textButton: "Đăng nhập",),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              const Text("Chưa có tài khoản?"),
                              GestureDetector(
                                onTap: () => Navigator.of(context)
                                                .popAndPushNamed(PageRegister.routename),
                                child: Text("Đăng ký",style:TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[300])),
                              )
                              ],),
                          const SizedBox(height: 10,),
                          GestureDetector(
                            onTap: () => Navigator.of(context).popAndPushNamed(PageForgot.routename),
                            child: Text("Quên mật khẩu!" ,
                                  style: AppConstant.textlink,),
                          )
                      ],
                    ),
                ),
                    viewmodel.status == 1? 
                    CustomSpinner(size: size):Container(),
              ],
            ),
          ),
        )),
    );

  }
}


