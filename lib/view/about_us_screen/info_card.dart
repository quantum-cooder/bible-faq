import 'package:bible_app/components/componets.dart';
import 'package:bible_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String description;
  final Widget? contentWidget;

  const InfoCard({
    super.key,
    required this.title,
    required this.description,
    this.contentWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.05 * 255).toInt()),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelText(
            text: title,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            textColor: AppColors.aquaBlue,
          ),
          const Gap(8),
          if (contentWidget != null)
            contentWidget!
          else
            LabelText(
              text: description,
              fontSize: 14,
              textColor: AppColors.lightBlack,
            ),
        ],
      ),
    );
  }
}
