import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/toasts.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/router/screen_args.dart';
import 'package:salla_app/core/widgets/custom_app_bar.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
import 'package:salla_app/generated/l10n.dart';

class HomeAppBar extends StatelessWidget {
  final List<ProductModel> products;
  const HomeAppBar({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: S.of(context).homeTitle,
      icon2: CupertinoIcons.search,
      onTap2: () {
        if (context.read<HomeBodyCubit>().products.isNotEmpty) {
          context.push(
            Routes.search,
            arguments: SearchScreenArgs(
                products: context.read<HomeBodyCubit>().products),
          );
        } else {
          showToast(S.of(context).pleaseWaitToLoadProducts);
        }
      },
    );
  }
}
