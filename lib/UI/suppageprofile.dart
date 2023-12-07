import 'package:connect_1000/models/profile.dart';
import 'package:connect_1000/providers/profileviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/mainviewmodel.dart';
import 'AppConstant.dart';
import 'custom_ctrl.dart';

class SPageYourprofile extends StatelessWidget {
  const SPageYourprofile({super.key});
  static int idpage = 1;

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<ProfileViewModel>(context);
    final size = MediaQuery.of(context).size;
    final profile = Profile();
    return GestureDetector(
      onTap: () => MainViewModel().closeMenu(),
      child: Container(
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              // start header
              Create_header(size, profile),
              // end header
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    CustomInputTextFormField(
                      title: 'Số điện thoại',
                      value: profile.user.phone,
                      width: size.width * 0.45,
                      callback: (output) {
                        profile.user.phone = output;
                        viewmodel.updateScreen();
                      },
                      type: TextInputType.phone,
                    ),
                    CustomInputTextFormField(
                      title: 'Ngày sinh',
                      value: profile.user.birthday,
                      width: size.width * 0.45,
                      callback: (output) {
                        if (AppConstant.isDate(output)) {
                          profile.user.birthday = output;
                        }
                        viewmodel.updateScreen();
                      },
                      type: TextInputType.datetime,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  Container Create_header(Size size, Profile profile) {
    return Container(
      height: size.height * 0.21,
      width: double.infinity, //Rong max
      decoration: BoxDecoration(
        color: AppConstant.mainColor,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(80),
            topLeft: Radius.circular(80),
            bottomRight: Radius.circular(80),
            topRight: Radius.circular(80)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Text(
                    profile.student.diem.toString(),
                    style: AppConstant.textbody_2,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Custom_avatar(size: size),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                profile.user.first_name,
                style: AppConstant.textbody_2,
              ),
              Row(
                children: [
                  Text(
                    'Mssv : ',
                    style: AppConstant.textbody_2,
                  ),
                  Text(
                    profile.student.mssv,
                    style: AppConstant.textbody_2,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Lớp : ',
                    style: AppConstant.textbody_2,
                  ),
                  Text(
                    profile.student.tenlop,
                    style: AppConstant.textbody_2,
                  ),
                  profile.student.duyet == 0
                      ? Text(
                          " (Chưa duyệt)",
                          style: AppConstant.text_error,
                        )
                      : Text(""),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Vai trò : ',
                    style: AppConstant.textbody_2,
                  ),
                  profile.user.role_id == 4
                      ? Text('Sinh viên', style: AppConstant.textbody_2)
                      : Text('Giảng viên', style: AppConstant.textbody_2)
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
