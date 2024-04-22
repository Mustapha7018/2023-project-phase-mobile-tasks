import 'package:flutter/material.dart';
import 'package:task_app/core/utils/accent_color.dart';

class CustomLabelTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final int maxLines;
  final VoidCallback? onSuffixIconPressed;
  final bool hasSuffixIcon;

  const CustomLabelTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.onChanged,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.onSuffixIconPressed,
    this.hasSuffixIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              labelText,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 136, 136, 136).withOpacity(0.1),
                  spreadRadius: 1.0,
                ),
              ],
            ),
            margin: const EdgeInsets.symmetric(
              vertical: 15,
            ),

            child: Card(
              borderOnForeground: true,
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: TextField(
                  onChanged: onChanged,
                  controller: controller,
                  keyboardType: keyboardType,
                  maxLines: maxLines,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(137, 137, 137, 1),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 20,
                    ),
                    border: InputBorder.none,
                    suffixIcon: hasSuffixIcon
                        ? IconButton(
                            icon: const Icon(
                              Icons.event,
                              color: AppColors.primaryColor,
                            ),
                            onPressed: onSuffixIconPressed,
                          )
                        : null,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
