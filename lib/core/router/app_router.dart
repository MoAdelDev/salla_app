import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/di/dependency_injection.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/router/screen_args.dart';
import 'package:salla_app/features/add_or_edit_address/logic/cubit/add_or_edit_address_cubit.dart';
import 'package:salla_app/features/add_or_edit_address/ui/screens/add_or_edit_address_screen.dart';
import 'package:salla_app/features/addresses/logic/cubit/addresses_cubit.dart';
import 'package:salla_app/features/addresses/ui/screens/addresses_screen.dart';
import 'package:salla_app/features/checkout/logic/cubit/checkout_cubit.dart';
import 'package:salla_app/features/checkout/ui/screens/checkout_screen.dart';
import 'package:salla_app/features/edit_profile/logic/cubit/edit_profile_cubit.dart';
import 'package:salla_app/features/edit_profile/ui/screens/edit_profile_screen.dart';
import 'package:salla_app/features/favorites/logic/cubit/favorites_cubit.dart';
import 'package:salla_app/features/home/logic/cubit/home_cubit.dart';
import 'package:salla_app/features/home/ui/screens/home_screen.dart';
import 'package:salla_app/features/home_body/logic/cubit/home_body_cubit.dart';
import 'package:salla_app/features/login/logic/cubit/login_cubit.dart';
import 'package:salla_app/features/login/ui/screens/login_screen.dart';
import 'package:salla_app/features/on_boarding/ui/screens/on_boarding_screen.dart';
import 'package:salla_app/features/order_details/logic/cubit/order_details_cubit.dart';
import 'package:salla_app/features/order_details/ui/screens/order_details_screen.dart';
import 'package:salla_app/features/orders/logic/cubit/orders_cubit.dart';
import 'package:salla_app/features/orders/ui/screens/orders_screen.dart';
import 'package:salla_app/features/product_details/logic/cubit/product_details_cubit.dart';
import 'package:salla_app/features/product_details/ui/screens/product_details_screen.dart';
import 'package:salla_app/features/profile/ui/screens/language_screen.dart';
import 'package:salla_app/features/register/logic/cubit/register_cubit.dart';
import 'package:salla_app/features/register/ui/screens/register_screen.dart';
import 'package:salla_app/features/search/ui/screens/search_screen.dart';
import 'package:salla_app/features/splash/ui/screens/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<LoginCubit>(
            create: (context) => getIt(),
            child: const LoginScreen(),
          ),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<RegisterCubit>(
            create: (context) => getIt(),
            child: const RegisterScreen(),
          ),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<HomeCubit>(
                create: (context) => getIt()..emitUserState(),
              ),
              BlocProvider<HomeBodyCubit>(
                create: (context) => getIt()
                  ..emitBannersState()
                  ..emitCategoriesState()
                  ..emitProductsState(),
              ),
              BlocProvider<FavoritesCubit>(
                create: (context) => getIt()..emitFavoritesState(),
              ),
            ],
            child: const HomeScreen(),
          ),
        );

      case Routes.productDetails:
        ProductDetailsScreenArgs args =
            settings.arguments as ProductDetailsScreenArgs;
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ProductDetailsCubit>(
            create: (context) =>
                getIt()..emitProductDeatilsState(args.productId),
            child: const ProductDetailsScreen(),
          ),
        );

      case Routes.checkout:
        CheckoutScreenArgs args = settings.arguments as CheckoutScreenArgs;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<CheckoutCubit>()..emitAddressesState(),
            child: CheckoutScreen(
              args: args,
            ),
          ),
        );

      case Routes.search:
        SearchScreenArgs args = settings.arguments as SearchScreenArgs;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: args.context.read<HomeBodyCubit>(),
              ),
              BlocProvider.value(
                value: args.context.read<FavoritesCubit>(),
              ),
            ],
            child: SearchScreen(
              context: args.context,
            ),
          ),
        );

      case Routes.editProfile:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<EditProfileCubit>(),
            child: const EditProfileScreen(),
          ),
        );

      case Routes.language:
        return MaterialPageRoute(
          builder: (context) => const LanguageScreen(),
        );
      case Routes.addresses:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<AddressesCubit>()..emitAddressState(),
            child: const AddressesScreen(),
          ),
        );
      case Routes.addAddress:
        AddOrEditScreenArgs? args = settings.arguments as AddOrEditScreenArgs?;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                getIt<AddOrEditAddressCubit>()..emitControllers(args?.address),
            child: AddOrEditAddressScreen(
              address: args?.address,
            ),
          ),
        );
      case Routes.orders:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<OrdersCubit>()..emitOrdersState(),
            child: const OrdersScreen(),
          ),
        );
      case Routes.orderDetails:
        OrderDetailsScreenArgs args =
            settings.arguments as OrderDetailsScreenArgs;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                getIt<OrderDetailsCubit>()..emitOrderDetailsState(args.orderId),
            child: const OrderDetailsScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
