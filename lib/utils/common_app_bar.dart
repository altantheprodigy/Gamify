import 'package:flutter/material.dart';
import 'package:gamify/utils/color.dart';
import 'package:gamify/utils/text_style.dart';


class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback route;

  const CommonAppBar({
    required this.title,
    Key? key, required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      surfaceTintColor: AppColors.background,
      elevation: null,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_sharp ,color:AppColors.fontAppBar  ,),
        onPressed: route,
        iconSize: 15,
      ),
      title: Text(
          title,
          style: AppTextStyle().descriptionBold(context, AppColors.fontAppBar)
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}