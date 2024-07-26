import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezda_smit_task/model/product_model.dart';
import 'package:tezda_smit_task/service/shared_Preference/preferences_helper.dart';
import 'package:tezda_smit_task/utills/extentions_custom.dart';
import 'package:tezda_smit_task/src/dashboard_module/product_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  List data = jsonDecode(PreferenceUtils.getString(favourites) == '' ? "[]" : PreferenceUtils.getString(favourites));

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text("Favourite Screen")),
      body: data.isNotEmpty
          ? GridView.builder(
              itemCount: data.length,
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
              ),
              itemBuilder: (context, index) {
                final product = Product.fromJson(data[index]);
                return InkWell(
                  onTap: () {
                    context.push(ProductDetailScreen(product: product));
                  },
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.r),
                      child: Column(
                        children: [
                          Expanded(child: Image.network(product.imageUrl ?? "--")),
                          Text(
                            product.name ?? "--",
                            style: textTheme.bodyLarge,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                          Text('\$${product.price}', style: textTheme.displayMedium),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Text(
                'No favorite products',
                style: textTheme.headline6,
              ),
            ),
    );
  }
}
