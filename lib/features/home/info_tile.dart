import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final TextStyle? titleStyle;
  const InfoTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 19),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.whiteGray.withOpacity(0.49),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 27),
          Icon(
            icon,
            color: AppColors.darkOrange,
            opticalSize: 18,
          ),
          const SizedBox(width: 27),
          ColoredBox(
            color: AppColors.whiteGray.withOpacity(0.49),
            child: const SizedBox(width: 1, height: 42),
          ),
          const SizedBox(width: 22),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: titleStyle ?? Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                subtitle,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
