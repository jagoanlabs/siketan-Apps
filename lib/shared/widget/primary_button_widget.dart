import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  final VoidCallback mainButton;
  final bool isGradient;
  final String mainButtonMessage;
  final Color color;
  final Gradient? gradient;
  final bool isLoading;

  const ButtonPrimary({
    super.key,
    required this.color,
    required this.mainButtonMessage,
    required this.mainButton,
    this.gradient,
    this.isGradient = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: isGradient
              ? gradient ??
                  const LinearGradient(
                    colors: [
                      Color(0xFF4CAF50), // hijau muda
                      Color(0xFF087F23), // hijau tua
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
              : null,
          color: isGradient ? null : color,
        ),
        child: ElevatedButton(
          onPressed: isLoading ? null : mainButton,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  mainButtonMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
        ),
      ),
    );
  }
}
