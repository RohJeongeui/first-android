import 'package:connect_1000/UI/AppConstant.dart';
import 'package:connect_1000/UI/custom_ctrl.dart';
import 'package:connect_1000/UI/page_login.dart';
import 'package:connect_1000/UI/page_main.dart';
import 'package:connect_1000/models/profile.dart';
import 'package:connect_1000/providers/registerviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PageRegister extends StatelessWidget {
  PageRegister({super.key});
  static String routename = '/register';
  final _usernameControler = TextEditingController();
  final _emailController = TextEditingController();
  final _password1Controller =TextEditingController();
  final _password2Controller = TextEditingController();
  bool agree = true;
  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<RegisterViewModel>(context);
    final profile = Profile();
    final size = MediaQuery.of(context).size;
    if(profile.token != ""){
       Future.delayed(
        Duration.zero,()
        {
         Navigator.pop(context);
          Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => const PageMain(),
                ));
        },
    );
    }

    return  Scaffold(
      backgroundColor :Colors.white,
      body :SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: 
            viewmodel.status == 3 || viewmodel.status == 4 ?
             Column(
              children: [
                const Image(image: AssetImage('assets/images/giphy.gif'),width: 100),
                Text("Đăng ký thành công",style: AppConstant.textfancyheader,),
              viewmodel.status == 3? 
                    const Text("Bạn cần xác nhận email để hoàn thành đăng ký!")
                    :const Text(""),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: 
                    [GestureDetector
                    
                (onTap: () => Navigator.popAndPushNamed(context, PageLogin.routename),
                child: Text("Bấm vào đây ",style: AppConstant.textlink,)), Text("để đăng nhập ")],
               )     
            ],)
            :Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(23),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    const AppLogo(),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Đăng ký tài khoản', 
                                style: AppConstant.textfancyheader,
                               ), 
                              const SizedBox(height: 20,),
                              CustomTextField(textController: _emailController, 
                                              hintText: 'Email', 
                                              obscureText: false
                              ),
                              const SizedBox(height: 10,),
                              CustomTextField(textController: _usernameControler, 
                                              hintText: 'Username', 
                                              obscureText: false
                              ),
                              const SizedBox(height: 10,),
                              CustomTextField(textController: _password1Controller, 
                                              hintText: 'Password', 
                                              obscureText: false
                              ),
                              const SizedBox(height: 10,),
                              CustomTextField(textController: _password2Controller, 
                                              hintText: 'Re-password', 
                                              obscureText: false
                              ),
                              const SizedBox(height: 10,),
                              Text(viewmodel.errorMessage ,style: AppConstant.text_error,),
                              const SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                Checkbox(value: viewmodel.agree,
                                        onChanged: (value) {
                                              viewmodel.setAgree(value!);
                                        },),
                                        const Text("Đồng ý "),
                                        GestureDetector(onTap: (){
                                          showDialog(context: context, builder: (context) => 
                                                 AlertDialog(
                                                  title: const Text("Quy định!"),
                                                  content: SingleChildScrollView(child: Text(viewmodel.Quydinh)),
                                          ),);
                                        }, child: Text('các điều khoản',style: AppConstant.textlink,))
                              ],),
                               const SizedBox(height: 10),
                              GestureDetector(
                                onTap: (){
                                  final email = _emailController.text.trim();
                                  final username = _usernameControler.text.trim();
                                  final password1 = _password1Controller.text.trim();
                                  final password2 = _password2Controller.text.trim();
                
                                  viewmodel.register(username, password1, password2, email);
                                } , 
                                child: 
                                  const Custom_Button(textButton: 'Đăng ký')),
                                  const SizedBox(height: 10),
                                  GestureDetector(
                                    onTap:  () => Navigator.of(context).popAndPushNamed(PageLogin.routename),
                                    child: Text("Đăng nhập!>>",
                                    style: AppConstant.textlink
                                  ))
                      ],
                      ),
                ),
                    viewmodel.status == 1? CustomSpinner(size: size):Container(),
                    
              ],
            ),
          ),
      ))
   );
  }
}