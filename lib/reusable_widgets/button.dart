import 'package:flutter/material.dart';

/// CUSTOM BUTTONS
class ImageTextButton extends StatelessWidget {
  final String buttonText;
  final TextStyle? textColor;
  final VoidCallback onPressed;
  final Color color;
  final double borderRadius;
  final double? height;
  final double? width;
  final String? imagePath;
  const ImageTextButton({super.key,
    required this.buttonText,
    required this.textColor,
    required this.onPressed,
    required this.color,
    this.borderRadius = 8.0,
    this.height,
    this.width,
    this.imagePath
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 0,
          side: const BorderSide(
            width: 1,
            color: Color(0xFF032B44),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
          child: Row(
            children: [
              if (imagePath != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.asset(
                   imagePath!,
                    height: 20,
                    width: 20,
                  ),
                ),
              Text(buttonText, style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                color: Color(0xFF032B44),
                    )),
            ],
          ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String buttonText;
  final TextStyle? textColor;
  final VoidCallback onPressed;
  final Color color;
  final double borderRadius;
  final double? height;
  final double? width;

   const CustomButton({super.key,
  required  this.buttonText,
     this.textColor,
     required this.onPressed,
     required this.color,
     required this.borderRadius,
     this.height,
     this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(buttonText, style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        )),
      ),
    );
  }
}


