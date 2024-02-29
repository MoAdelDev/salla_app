import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/di/dependency_injection.dart';
import 'package:salla_app/core/widgets/custom_app_bar.dart';
import 'package:salla_app/features/cart/logic/cubit/cart_cubit.dart';
import 'package:salla_app/features/cart/ui/widgets/cart_list.dart';
import 'package:salla_app/generated/l10n.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CartCubit>(),
      child: Column(
        children: [
          CustomAppBar(
            title: S.of(context).cartTitle,
            icon2: Icons.clear_all,
            onTap2: () {},
          ),
          const CartList(),
        ],
      ),
    );
  }
}
