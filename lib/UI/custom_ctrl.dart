import 'package:connect_1000/models/lop.dart';
import 'package:connect_1000/models/place.dart';
import 'package:connect_1000/models/profile.dart';
import 'package:flutter/material.dart';

import 'AppConstant.dart';

class CustomPlaceDropDown extends StatefulWidget {
  CustomPlaceDropDown({
    super.key,
    required this.width,
    required this.title,
    required this.callback,
    required this.list,
    required this.valueid,
    required this.valuename,
  });

  final double width;
  final String title;
  final int valueid;
  final String valuename;
  final List<Place> list;
  final Function(int outputid, String outputname) callback;
  @override
  State<CustomPlaceDropDown> createState() => _CustomPlaceDropDownState();
}

class _CustomPlaceDropDownState extends State<CustomPlaceDropDown> {
  int status = 0;
  int outputid = 0;
  String outputname = "";
  @override
  void initState() {
    outputid = widget.valueid;
    outputname = widget.valuename;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: AppConstant.textfancyheader_2,
          ),
          status == 0
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      status = 1;
                    });
                  },
                  child: Text(
                    widget.valuename == "" ? "Khong co!" : widget.valuename,
                    style: AppConstant.textbody,
                  ),
                )
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[200]),
                  width: widget.width - 10,
                  child: DropdownButton(
                      value: outputid,
                      items: widget.list
                          .map((e) => DropdownMenuItem(
                                value: e.id,
                                child: SizedBox(
                                    width: widget.width * 0.6,
                                    child: Text(
                                      e.name,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          outputid = value!;
                          for (var dropitem in widget.list) {
                            if (dropitem.id == outputid) {
                              outputname = dropitem.name;
                              widget.callback(outputid, outputname);
                              break;
                            }
                          }
                          status = 0;
                        });
                      }),
                ),
          const Divider(
            thickness: 1,
          )
        ],
      ),
    );
  }
}

// class CustomInputTextFormField extends StatefulWidget {
//   CustomInputTextFormField({
//     super.key,
//     required this.width,
//     required this.title,
//     required this.value,
//     required this.callback,
//     this.type = TextInputType.text,
//   });

//   final double width;
//   final String title;
//   final String value;
//   final TextInputType type;
//   final Function(String output) callback;
//   @override
//   State<CustomInputTextFormField> createState() =>
//       _CustomInputTextFormFieldState();
// }

// class _CustomInputTextFormFieldState extends State<CustomInputTextFormField> {
//   int status = 0;
//   String output = "";

//   @override
//   void initState() {
//     output = widget.value;
//   }

//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           widget.title,
//           style: AppConstant.textfancyheader_2,
//         ),
//         status == 0
//             ? GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     status = 1;
//                   });
//                 },
//                 child: Text(
//                   widget.value == "" ? "Khong co!" : widget.value,
//                   style: AppConstant.textbody,
//                 ),
//               )
//             : Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         color: Colors.grey[200]),
//                     width: widget.width - 50,
//                     child: TextFormField(
//                       keyboardType: widget.type,
//                       decoration:
//                           const InputDecoration(border: InputBorder.none),
//                       initialValue: output,
//                       onChanged: (value) {
//                         setState(() {
//                           output = value;
//                         });
//                       },
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         status = 0;
//                         widget.callback(output);
//                       });
//                     },
//                     child: const Icon(
//                       Icons.save,
//                       size: 15,
//                     ),
//                   )
//                 ],
//               ),
//         const Divider(
//           thickness: 1,
//         )
//       ],
//     );
//   }
// }

class CustomInputDropDown extends StatefulWidget {
  CustomInputDropDown({
    super.key,
    required this.width,
    required this.title,
    required this.callback,
    required this.list,
    required this.valueid,
    required this.valuename,
  });

  final double width;
  final String title;
  final int valueid;
  final String valuename;
  final List<Lop> list;
  final Function(int outputid, String outputname) callback;
  @override
  State<CustomInputDropDown> createState() => _CustomInputDropDownState();
}

class _CustomInputDropDownState extends State<CustomInputDropDown> {
  int status = 0;
  int outputid = 0;
  String outputname = "";
  @override
  void initState() {
    outputid = widget.valueid;
    outputname = widget.valuename;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: AppConstant.textfancyheader_2,
          ),
          status == 0
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      status = 1;
                    });
                  },
                  child: Text(
                    outputname == "" ? "Khong co!" : outputname,
                    style: AppConstant.textbody,
                  ),
                )
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[200]),
                  width: widget.width - 25,
                  child: DropdownButton(
                      value: outputid,
                      items: widget.list
                          .map((e) => DropdownMenuItem(
                                value: e.id,
                                child: SizedBox(
                                    width: widget.width * 0.8,
                                    child: Text(
                                      e.ten,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          outputid = value!;
                          for (var dropitem in widget.list) {
                            if (dropitem.id == outputid) {
                              outputname = dropitem.ten;
                              widget.callback(outputid, outputname);
                              break;
                            }
                          }
                          status = 0;
                        });
                      }),
                ),
          const Divider(
            thickness: 1,
          )
        ],
      ),
    );
  }
}

class CustomAvatar1 extends StatelessWidget {
  const CustomAvatar1({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size.height * 0.25),
      child: Container(
          width: 100,
          height: 100,
          child: Image.network(
            Profile().user.avatar,
            fit: BoxFit.cover,
          )),
    );
  }
}
class CustomInputTextFormField extends StatefulWidget {
  const CustomInputTextFormField({
    super.key,
    required this.width,
    required this.title,
    required this.value,
    required this.callback,
    this.type = TextInputType.text,
  });

  final double width;
  final String title;
  final String value;
  final TextInputType type;
  final Function(String output) callback;

  @override
  State<CustomInputTextFormField> createState() =>
      _CustomInputTextFormFieldState();
}

class _CustomInputTextFormFieldState extends State<CustomInputTextFormField> {
  int status = 0;
  String output = "";

  @override
  void initState() {
    output = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: AppConstant.textfancyheader_2,
          ),
          status == 0
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      status = 1;
                    });
                  },
                  child: Text(
                    widget.value == "" ? "Không có" : widget.value,
                    style: AppConstant.textbody,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[200]),
                      width: widget.width - 50,
                      child: TextFormField(
                        keyboardType: widget.type,
                        onChanged: (value) {
                          setState(() {
                            output = value;
                            widget.callback(output);
                          });
                        },
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        initialValue: output,
                        style: AppConstant.textbodyfocus,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          status = 0;
                          widget.callback(output);
                        });
                      },
                      child: Icon(
                        Icons.save,
                        size: 18,
                      ),
                    )
                  ],
                ),
          Divider(
            thickness: 1,
          )
        ],
      ),
    );
  }
}

class Custom_Button extends StatelessWidget {
  const Custom_Button({
    super.key,
    required this.textButton,
  });
  final String textButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: Text(
          textButton,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required TextEditingController textController,
    required this.hintText,
    required this.obscureText,
  }) : _textController = textController;

  final TextEditingController _textController;
  final String hintText;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white),
      ),
      child: TextField(
        obscureText: obscureText,
        controller: _textController,
        decoration:
            InputDecoration(border: InputBorder.none, hintText: hintText),
      ),
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // return const Image(
    //   image: AssetImage('assets/images/logo.png'),
    //   width: 200,
    // );
     final size = MediaQuery.of(context).size;
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(size.height),
          child: SizedBox(
              height: size.height * 0.16,
              width: size.height * 0.16,
              child: Image(image: AssetImage('assets/images/logo.png'))),
        )
      ],
    );
  }
}

class ImageProfile extends StatelessWidget {
  const ImageProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/images/imageprofile.png'),
      fit: BoxFit.cover,
      width: 200,
    );
  }
}

class CustomSpinner extends StatelessWidget {
  const CustomSpinner({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      color: Colors.deepPurple.withOpacity(0.5),
      child: const Center(
        child: Image(
          width: 50,
          image: AssetImage('assets/images/spinnervlll.gif'),
        ),
      ),
    );
  }
}

class Custom_avatar extends StatelessWidget {
  const Custom_avatar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size.height * 0.25),
      child: SizedBox(
          width: 100,
          height: 100,
          child: Image.network(
            Profile().user.avatar,
            fit: BoxFit.cover,
          )
          // ImageProfile()
          ),
    );
  }
}
