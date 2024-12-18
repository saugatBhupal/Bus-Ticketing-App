import 'package:flutter/material.dart';

class DarkRoundedButton extends StatelessWidget {
  final String title;
  final String? icon;
  final Function()? onPressed;
  const DarkRoundedButton({
    super.key,
    required this.title,
    this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      margin: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: const Color(0xFF0D0D52),
        borderRadius: const BorderRadius.all(Radius.circular(32)),
        child: InkWell(
          onTap: onPressed,
          splashColor: const Color(0xFFF1F0F0),
          borderRadius: const BorderRadius.all(Radius.circular(32)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null)
                  Image.asset(
                    icon!,
                    height: 24.0,
                    width: 24.0,
                  ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
