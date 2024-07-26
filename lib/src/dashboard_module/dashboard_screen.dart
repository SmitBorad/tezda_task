import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezda_smit_task/src/auth_module/controller/login_controller.dart';
import 'package:tezda_smit_task/src/auth_module/login_screen.dart';

import 'package:tezda_smit_task/src/dashboard_module/controller/dashboard_controller.dart';
import 'package:tezda_smit_task/src/dashboard_module/favourtite_screen.dart';
import 'package:tezda_smit_task/src/dashboard_module/product_detail_screen.dart';
import 'package:tezda_smit_task/utills/extentions_custom.dart';

class DashBoardScreen extends ConsumerWidget {
  final String userName;

  const DashBoardScreen({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsyncValue = ref.watch(productProvider);

    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text("Hello, $userName"), actions: [
        InkWell(
            onTap: () {
              context.push(FavoritesScreen());
            },
            child: Icon(Icons.favorite)),
        16.width(),
        InkWell(
            onTap: () async {
              ///implement logout code

              final authRepository = ref.read(authRepositoryProvider);
              try {
                await authRepository.signOut();
                // Handle successful login (e.g., navigate to home screen)
                context.pushReplacement(LoginScreen());
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.greenAccent,
                  content: Text("Logout Successfully!"),
                ));
              } on FirebaseAuthException catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(e.message ?? 'An error occurred'),
                ));
              }
            },
            child: Icon(Icons.logout)),
        16.width(),
      ]),
      body: productAsyncValue.when(
        data: (products) => GridView.builder(
          itemCount: products.length,
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
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
              )),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
