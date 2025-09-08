import 'package:flutter/material.dart';

class AuroralActivityAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AuroralActivityAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Color(0xFF2196F3),
                    size: 30,
                  ),
                  onPressed: () {},
                  splashRadius: 24,
                ),
              ],
            ),
            const SizedBox(height: 4),
            const Text(
              'Auroral Activity',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
