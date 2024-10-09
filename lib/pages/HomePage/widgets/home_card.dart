import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gamify/utils/app_responsive.dart';
import 'package:gamify/utils/color.dart';
import 'package:gamify/utils/extension.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../utils/text_style.dart';

class HomePageCard extends StatelessWidget {
  final String gameName;
  final int id;
  final DateTime releaseDate;
  final String imagePath;
  final double rating;
  const HomePageCard(
      {super.key,
      required this.gameName,
      required this.releaseDate,
      required this.imagePath,
      required this.rating, required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(
          context,
          '/detail-page', // Pastikan rute ini sudah terdaftar
          arguments: id, // Kirim id sebagai argumen
        );
        // Get.toNamed("/detail-page", arguments: id);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: AppColors.background),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppResponsive().screenWidth(context) * 0.20,
              width: AppResponsive().screenWidth(context) * 0.30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  gameName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle()
                      .descriptionBold(context, AppColors.fontAppBar),
                ),
                Text(
                  DateFormat('dd-MM-yyyy').format(releaseDate),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle()
                      .descriptionBold(context, AppColors.cardIconFill),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 20,
                      color: AppColors.bintang,
                    ),
                    Text(
                      rating.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle()
                          .descriptionBold(context, AppColors.cardIconFill),
                    ),
                  ].withSpaceBetween(width: 5),
                )
              ],
            ))
          ].withSpaceBetween(width: 10),
        ),
      ),
    );
  }
}
