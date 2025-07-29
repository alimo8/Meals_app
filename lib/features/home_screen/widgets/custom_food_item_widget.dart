import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/styles/app_colors.dart';
import 'package:meals_app/core/styles/app_text_styles.dart';
import 'package:meals_app/core/widgets/spacing_widgets.dart';

class FoodItemWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double rate;
  final String time;
  final Function()? onTap;
  const FoodItemWidget(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.rate,
      required this.time,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        child: Container(
          padding: EdgeInsets.all(8.sp),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  width: 137.w,
                  height: 106.h,
                  errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.red,
                      )),
              const HeightSpace(8),
              SizedBox(
                width: 120.w,
                child: Text(
                  name,
                  maxLines: 1,
                  style: AppTextStyles.black16Medium,
                ),
              ),
              const HeightSpace(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.primaryColor,
                        size: 16.sp,
                      ),
                      const WidthSpace(4),
                      Text(
                        rate.toString(),
                        style: AppTextStyles.grey14Regular
                            .copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.lock_clock,
                        color: AppColors.primaryColor,
                        size: 16.sp,
                      ),
                      const WidthSpace(4),
                      Text(
                        time.toString(),
                        style: AppTextStyles.grey14Regular
                            .copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
