import 'package:flutter/material.dart';
import 'package:task_app/core/utils/accent_color.dart';

class CustomLabelTextField extends StatelessWidget {
  final String label;
  final String initialValue;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  final bool isDate;
  final TextEditingController? controller;
  final VoidCallback? onDatePressed;
  final int maxLines;

  const CustomLabelTextField({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
    this.isDate = false,
    this.controller,
    this.onDatePressed,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15, bottom: 30),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(241, 238, 238, 1),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextFormField(
            controller: controller ?? TextEditingController(text: initialValue),
            onChanged: onChanged,
            keyboardType: keyboardType,
            maxLines: isDate ? 1 : maxLines,
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.transparent,
              contentPadding: EdgeInsets.symmetric(
                  vertical: isDate ? 25 : 15, horizontal: 15),
              suffixIcon: isDate
                  ? Padding(
                      padding: const EdgeInsetsDirectional.only(end: 1),
                      child: IconButton(
                        icon: const Icon(
                          Icons.event,
                          color: AppColors.primaryColor,
                          size: 24,
                        ),
                        onPressed: onDatePressed,
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
