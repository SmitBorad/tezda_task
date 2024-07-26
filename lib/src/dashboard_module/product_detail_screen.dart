import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezda_smit_task/model/product_model.dart';
import 'package:tezda_smit_task/service/shared_Preference/preferences_helper.dart';
import 'package:tezda_smit_task/utills/commonButton.dart';
import 'package:tezda_smit_task/utills/extentions_custom.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  const ProductDetailScreen({required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.name ?? "--")),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.height(),
            Align(
              alignment: Alignment.topCenter,
              child: Image.network(
                widget.product.imageUrl ?? "--",
                height: 160.h,
              ),
            ),
            20.height(),
            Text(
              widget.product.name ?? "--",
              style: textTheme.displayMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            20.height(),
            Text('Rate : \$${widget.product.price}', style: textTheme.displayMedium),
            20.height(),
            Text('Ratting : ${widget.product.rate} ★', style: textTheme.displayMedium),
            20.height(),
            Text('Discription:', style: textTheme.displayMedium),
            Text('${widget.product.discription}', style: textTheme.bodyLarge),
            40.height(),
            Align(
              alignment: Alignment.center,
              child: CommonButton(
                textTheme: textTheme,
                minWidth: 150.w,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.r)),
                onPressed: () async {
                  List data = jsonDecode(PreferenceUtils.getString(favourites) == '' ? "[]" : PreferenceUtils.getString(favourites));

                  if (data.any((element) => element['title'] == widget.product.name)) {
                    data.removeWhere(
                      (element) => element['title'] == widget.product.name,
                    );
                  } else {
                    data.add({
                      'title': widget.product.name,
                      'price': widget.product.price,
                      'image': widget.product.imageUrl,
                      'description': widget.product.discription,
                      'category': widget.product.category,
                      'rating': {'rate': widget.product.rate},
                    });
                  }
                  setState(() {});
                  await PreferenceUtils.setString(favourites, jsonEncode(data));
                  log(PreferenceUtils.getString(favourites).toString());
                },
                name: "Add To Favourite",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
