import 'dart:io';

import 'package:connect_1000/models/profile.dart';
import 'package:connect_1000/providers/diachiviewmodel.dart';
import 'package:connect_1000/providers/profileviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../providers/mainviewmodel.dart';
import 'AppConstant.dart';
import 'custom_ctrl.dart';

class SPageYourprofile extends StatelessWidget {
  SPageYourprofile({super.key});
  static int idpage = 1;
  XFile? image;

  Future<void> init(DiachiModel dcmodel, ProfileViewModel viewModel) async {
    Profile profile = Profile();

    if (dcmodel.listCity.isEmpty ||
        dcmodel.curCityid != profile.user.provinceid ||
        dcmodel.curDistid != profile.user.districtid ||
        dcmodel.curWardid != profile.user.wardid) {
      viewModel.displaySpinner();
      await dcmodel.initialize(profile.user.provinceid, profile.user.districtid,
          profile.user.wardid);
      viewModel.hideSpinner();
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<ProfileViewModel>(context);
    final dcmodel = Provider.of<DiachiModel>(context);
    final size = MediaQuery.of(context).size;
    final profile = Profile();
    Future.delayed(Duration.zero, () => init(dcmodel, viewmodel));
    return GestureDetector(
      onTap: () => MainViewModel().closeMenu(),
      child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  // start header
                  Create_header(size, profile, viewmodel),
                  // end header

                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomInputTextFormField(
                                  width: size.width * 0.4,
                                  title: 'Số điện thoại',
                                  value: profile.user.phone,
                                  callback: (output) {
                                    profile.user.phone = output;
                                    viewmodel.updatescreen();
                                  },
                                  type: TextInputType.phone,
                                ),
                                CustomInputTextFormField(
                                  width: size.width * 0.4,
                                  title: 'Ngày sinh',
                                  value: profile.user.birthday,
                                  callback: (output) {
                                    if (AppConstant.isDate(output)) {
                                      profile.user.birthday = output;
                                    }
                                    viewmodel.updatescreen();
                                  },
                                  type: TextInputType.datetime,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomPlaceDropDown(
                                    width: size.width * 0.4,
                                    title: 'Thành phố/Tỉnh',
                                    valueid: profile.user.provinceid,
                                    valuename: profile.user.provincename,
                                    callback: ((outputid, outputname) async {
                                      viewmodel.displaySpinner();
                                      profile.user.provinceid = outputid;
                                      profile.user.provincename = outputname;
                                      await dcmodel.setCity(outputid);
                                      viewmodel.hideSpinner();
                                    }),
                                    list: dcmodel.listCity),
                                CustomPlaceDropDown(
                                    width: size.width * 0.4,
                                    title: "Quận/Huyện: ",
                                    valueid: profile.user.districtid,
                                    valuename: profile.user.districtname,
                                    callback: ((outputid, outputname) async {
                                      viewmodel.displaySpinner();
                                      profile.user.districtid = outputid;
                                      profile.user.districtname = outputname;
                                      await dcmodel.setDistrict(outputid);
                                      profile.user.wardid = 0;
                                      profile.user.wardname = "Không có";
                                      viewmodel.setModified();
                                      viewmodel.hideSpinner();
                                    }),
                                    list: dcmodel.listDistrict)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomPlaceDropDown(
                                    width: size.width * 0.4,
                                    title: "Phường/Xã",
                                    valueid: profile.user.wardid,
                                    valuename: profile.user.wardname,
                                    callback: ((outputid, outputname) async {
                                      viewmodel.displaySpinner();
                                      profile.user.wardid = outputid;
                                      profile.user.wardname = outputname;
                                      await dcmodel.setWard(outputid);
                                      viewmodel.setModified();
                                      viewmodel.hideSpinner();
                                    }),
                                    list: dcmodel.listWard),
                                CustomInputTextFormField(
                                  title: 'Tên đường/Số nhà',
                                  value: profile.user.address,
                                  width: size.width * 0.4,
                                  callback: (output) {
                                    profile.user.address = output;
                                    viewmodel.setModified();
                                    viewmodel.updatescreen();
                                  },
                                  type: TextInputType.streetAddress,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: size.width * 0.3,
                              width: size.width * 0.3,
                              child: QrImageView(
                                data: '{userid:' +
                                    profile.user.id.toString() +
                                    '}',
                                version: QrVersions.auto,
                                gapless: false,
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
              viewmodel.status == 1 ? CustomSpinner(size: size) : Container(),
            ],
          )),
    );
  }

  Container Create_header(
      Size size, Profile profile, ProfileViewModel viewModel) {
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Icon(
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
                child: viewModel.updateavatar == 1 && image != null
                    ? Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Image.file(
                                File(image!.path),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                viewModel.uploadAvatar(image!);
                              },
                              child: Container(
                                  color: Colors.white,
                                  child: Icon(size: 30, Icons.save)),
                            ),
                          )
                        ],
                      )
                    : GestureDetector(
                        onTap: () async {
                          final ImagePicker _picker = ImagePicker();
                          image = await _picker.pickImage(
                              source: ImageSource.gallery);
                          viewModel.setUpdateAvatar();
                        },
                        child: CustomAvatar1(size: size)),
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
                    'MSSV: ',
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
                    'Lớp: ',
                    style: AppConstant.textbodyWhite,
                  ),
                  Text(
                    profile.student.tenlop,
                    style: AppConstant.textbody_2,
                  ),
                  profile.student.duyet == 0
                      ? Text(
                          "(Chưa Duyệt)",
                          style: AppConstant.text_error,
                        )
                      : Text(''),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Vai trò: ',
                    style: AppConstant.textbody_2,
                  ),
                  profile.user.role_id == 4
                      ? Text('Sinh viên', style: AppConstant.textbody_2)
                      : Text('Giảng viên', style: AppConstant.textbody_2)
                ],
              ),
              SizedBox(
                width: size.width * 0.4,
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: viewModel.modified == 1
                        ? GestureDetector(
                            onTap: () {
                              viewModel.updateProfile();
                            },
                            child: Icon(Icons.save))
                        : Container()),
              )
            ],
          )
        ],
      ),
    );
  }
}
