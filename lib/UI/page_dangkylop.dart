import 'package:connect_1000/UI/AppConstant.dart';
import 'package:connect_1000/UI/custom_ctrl.dart';
import 'package:connect_1000/UI/page_main.dart';
import 'package:connect_1000/models/lop.dart';
import 'package:connect_1000/models/profile.dart';
import 'package:connect_1000/repositories/lop_repository.dart';
import 'package:connect_1000/repositories/student_repository.dart';
import 'package:connect_1000/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class PageDangKyLop extends StatefulWidget {
  PageDangKyLop({super.key});

  @override
  State<PageDangKyLop> createState() => _PageDangKyLopState();
}

class _PageDangKyLopState extends State<PageDangKyLop> {
  List<Lop>? listlop = [];
   Profile profile = Profile();
  String mssv = '';
  String ten = '';
  int idlop = 0;
  String tenlop = '';
  @override
  void initState() {
    // TODO: implement initState
    mssv = profile.student.mssv;
    ten = profile.user.first_name;
    idlop = profile.student.idlop;
    tenlop = profile.student.tenlop;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; 
   
    
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Thêm thông tin của bạn',
                      style: AppConstant.textlogo,),
                SizedBox(height: 10,),
                Text('Hay dien day du thong tin. Ban khong the roi khoi trang nay neu chua dien day du!',
                    style: AppConstant.text_error,),
                SizedBox(height: 20,),
                CustomInputTextFormField(
                  title: "TÊN",
                  value: ten,
                  width: size.width,
                  callback: (output) {
                    ten = output;
                  },
                ),
                CustomInputTextFormField(
                  title: "MSSV",
                  value: mssv,
                  width: size.width,
                  callback: (output) {
                    mssv = output;
                  },
                ),
                listlop!.isEmpty?
                FutureBuilder(
                  future: LopRepository().getDSLop(), 
                  builder: (context, AsyncSnapshot<List<Lop>> snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return const CircularProgressIndicator();
                    }else
                    if(snapshot.hasData){
                      listlop = snapshot.data;
                      return CustomInputDropDown(
                        width: size.width,
                        list: listlop!,
                        title: "Lớp",
                        valueid: idlop,
                        valuename: tenlop,
                        callback: (outputid, outputname) {
                          idlop = outputid;
                          tenlop = outputname;
                        },
                      );
                    }else{
                      return Text('loi xay ra');
                    }
                  },
                ):CustomInputDropDown(
                        width: size.width,
                        list: listlop!,
                        title: "Lớp",
                        valueid: idlop,
                        valuename: tenlop,
                        callback: (outputid, outputname) {
                          idlop = outputid;
                          tenlop = outputname;
                        },
                      ),
                      const SizedBox(height: 20,),
                      GestureDetector(
                        onTap: () async{
                          profile.student.mssv = mssv;
                          profile.student.idlop = idlop;
                          profile.student.tenlop = tenlop;
                          profile.user.first_name = ten;
                          await UserRepository().updateProfile();
                          await StudentRepository().dangkyLop();
                        },
                        child: 
                          Custom_Button(textButton: "Lưu thông tin")
                      ),
                        const SizedBox(height: 30,),
                        GestureDetector(
                          onTap: (){
                            Navigator.popAndPushNamed(context, PageMain.routename);
                          },
                          child: Text("Rời khỏi trang", 
                                      style: AppConstant.textlink,))

              ],),
          ),
        ),
      ),
    );
  }
}