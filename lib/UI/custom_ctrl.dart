import 'package:flutter/material.dart';

class Custom_Button extends StatelessWidget {
  const Custom_Button({
    super.key, required this.textButton,
  });
  final String textButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: Text(textButton,
          style: const TextStyle(color: Colors.white,
                          fontSize: 20,),
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
        decoration: InputDecoration(border: InputBorder.none ,hintText: hintText),
        
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
    return const Image(image: AssetImage('assets/images/logo.png'),width: 200,);
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
