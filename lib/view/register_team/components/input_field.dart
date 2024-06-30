import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField(
      {super.key,
      required this.title,
      required this.hint,
        this.showText=true,
      this.controller,
      this.sufix,
      this.validator, this.onChanged});

  final String title;
  final Widget? sufix;
  final void Function(String)? onChanged;
  final bool showText;
  final String hint;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: '',
                fontSize: 12
              ),
            ),
            const SizedBox(
              width: 3,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 3),
              child: Text(
                '*',
                style: TextStyle(color: Colors.red, fontSize: 14,fontFamily: ''),
              ),
            )
          ],
        ),
        SizedBox(
          child: TextFormField(
            style: const TextStyle(
              fontSize: 12
            ),
            validator: validator??(value){
              if(value==null || value.isEmpty){
                return 'This field is required';
              }
              return null;
            },
            controller: controller,
            obscureText: !showText,
            onChanged: onChanged,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(
                    color: Colors.grey,
                    height: 0,
                    fontFamily: '',
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
                suffixIcon: sufix,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.black12,
                      width: 2,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2,
                    )),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2,
                    ))),
          ),
        )
      ],
    );
  }
}
