import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.filter_list, color: AppColors.primaryColor),
          label: Text("filter", style: AppTextStyles.regular13),
        ),
      ],
    );
  }
}
