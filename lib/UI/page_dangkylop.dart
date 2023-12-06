import 'package:connect_1000/UI/AppConstant.dart';
import 'package:connect_1000/UI/custom_ctrl.dart';
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; 
    Profile profile = Profile();
    String mssv = profile.student.mssv;
    String ten = profile.user.first_name;
    int idlop = profile.student.idlop;
    String tenlop = profile.student.tenlop;
    
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
                        Text("Rời khỏi trang")

              ],),
          ),
        ),
      ),
    );
  }
}

class CustomInputTextFormField extends StatefulWidget {
  CustomInputTextFormField({
    super.key,
    required this.width, required this.title, required this.value, required this.callback,
  });

  final double width;
  final String title;
  final String value;
  final Function (String output) callback;
  @override
  State<CustomInputTextFormField> createState() => _CustomInputTextFormFieldState();
}

class _CustomInputTextFormFieldState extends State<CustomInputTextFormField> {
  int status = 0;
  String output = "";

  @override
  void initState(){
    output = widget.value;
  }
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppConstant.textfancyheader_2,
        ),
        status == 0 ?
        GestureDetector(
          onTap: () {
            setState(() {
              status = 1;
            });
          },
          child: Text(
            output == "" ?"Khong co!":output,
              style: AppConstant.textbody,),
        )
            :Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: 
                    BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[200]),
                  width: widget.width - 50,
                  child: TextFormField(
                    decoration: InputDecoration(border: InputBorder.none),
                    initialValue: output,
                    onChanged: (value) {
                      setState(() {
                        output = value;
                      });
                      
                    },
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      status = 0;
                      widget.callback(output);
                    });
                  },
                  child: Icon(
                    Icons.save,
                    size: 15,
                  ),
                )
              ],
            ),
        Divider(thickness: 1,)
      ],
    );
  }
}
class CustomInputDropDown extends StatefulWidget {
  CustomInputDropDown({
    super.key,
    required this.width, required this.title, required this.callback, required this.list, required this.valueid, required this.valuename,
  });

  final double width;
  final String title;
  final int valueid;
  final String valuename;
  final List<Lop> list;
  final Function (int outputid,String outputname) callback;
  @override
  State<CustomInputDropDown> createState() => _CustomInputDropDownState();
}

class _CustomInputDropDownState extends State<CustomInputDropDown> {
  int status = 0;
  int outputid = 0;
  String outputname = "";
  @override
  void initState(){
    outputid = widget.valueid;
    outputname = widget.valuename;
  }
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppConstant.textfancyheader_2,
        ),
        status == 0 ?
        GestureDetector(
          onTap: () {
            setState(() {
              status = 1;
            });
          },
          child: Text(
            outputname == "" ?"Khong co!":outputname,
              style: AppConstant.textbody,),
        )
            :Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: 
                BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200]),
              width: widget.width - 25,
              child: DropdownButton(value: outputid, 
              items: widget.list.map((e) => DropdownMenuItem(
                value: e.id,
                child: Container(
                  width: widget.width * 0.8,
                  child:
                    Text(e.ten, overflow: TextOverflow.ellipsis,
                    )),
              )).toList(),
                onChanged: (value){
                  setState(() {
                    outputid = value!;
                    for(var dropitem in widget.list){
                      if(dropitem.id == outputid){
                        outputname = dropitem.ten;
                        widget.callback(outputid, outputname);
                        break;
                      }
                    }
                    status = 0;
                  });
                }
                ),
            ),
        Divider(thickness: 1,)
      ],
    );
  }
}