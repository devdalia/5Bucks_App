import 'package:device_preview/device_preview.dart';
import 'package:bucks_app/providers/details_realestate_provider.dart';
import 'package:bucks_app/providers/home_provider.dart';
import 'package:bucks_app/providers/order_provider.dart';
import 'package:bucks_app/providers/profile_provider.dart';
import 'package:bucks_app/providers/review_provider.dart';
import 'package:bucks_app/providers/verification_code_provider.dart';
import 'package:bucks_app/ui/Screen/add_location_screen.dart';
import 'package:bucks_app/ui/Screen/check_screen.dart';
import 'package:bucks_app/ui/Screen/comp_order_screen.dart';
import 'package:bucks_app/ui/Screen/location_screen.dart';
import 'package:bucks_app/ui/Screen/details_product_sreen.dart';
import 'package:bucks_app/ui/Screen/edit_profile_screen.dart';
import 'package:bucks_app/ui/Screen/favorite_screen.dart';
import 'package:bucks_app/ui/Screen/forgotpassword/enter_email_screen.dart';
import 'package:bucks_app/ui/Screen/home_application.dart';
import 'package:bucks_app/ui/Screen/home_screen.dart';
import 'package:bucks_app/ui/Screen/information_screen.dart';

import 'package:bucks_app/ui/Screen/mycart_screen.dart';
import 'package:bucks_app/ui/Screen/rest_password.dart';
import 'package:bucks_app/ui/Screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:bucks_app/ui/Screen/profile_screen.dart';
import 'package:bucks_app/ui/Screen/registers_screen.dart';
import 'package:bucks_app/ui/Screen/login_screen.dart';
import 'package:bucks_app/utilities/const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'get_it.dart';
import 'package:bucks_app/providers/register_provider.dart';
import 'package:bucks_app/providers/add_cart_provider.dart';
import 'package:bucks_app/ui/Screen/Cash_on_delivery_screen.dart';
import 'package:bucks_app/providers/location_provider.dart';

import 'ui/Screen/forgotpassword/forgot_screen.dart';
import 'ui/Screen/forgotpassword/new_password_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp()
    /*DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),*/
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: getIt<RegisterProvider>()),
        ChangeNotifierProvider.value(value: getIt<HomeProvider>()),
        ChangeNotifierProvider.value(value: getIt<DetailsProductsProvider>()),
        ChangeNotifierProvider.value(value: getIt<ProfileProvider>()),
        ChangeNotifierProvider.value(value: getIt<VerificationCodeProvider>()),
        ChangeNotifierProvider.value(value: getIt<ReviewProvider>()),
        ChangeNotifierProvider.value(value: getIt<AddCartProvider>()),
        ChangeNotifierProvider.value(value: getIt<CreateOrderProvider>()),
        ChangeNotifierProvider.value(value: getIt<LocationProvider>()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
              builder: DevicePreview.appBuilder,
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primarySwatch: Colors.blue,
                  primaryColor: kPrimaryColor,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  fontFamily: 'Shamel'),
              initialRoute: SplashScreen.id,
              routes: {
                SplashScreen.id: (context) => SplashScreen(),
                LoginScreen.id: (context) => LoginScreen(),
                RegisterScreen.id: (context) => RegisterScreen(),
                EnterEmailScreen.id: (context) => EnterEmailScreen(),
                ForgetpasswordScreen.id: (context) => ForgetpasswordScreen(),
                NewPasswordScreen.id: (context) => NewPasswordScreen(),
                HomeApplication.id: (context) => HomeApplication(),
                HomeScreen.id: (context) => HomeScreen(),
                InformationScreen.id: (context) => InformationScreen(),
                ProfileScreen.id: (context) => ProfileScreen(),
                DetailsPreoductScreen.id: (context) => DetailsPreoductScreen(
                    ProdectId: ModalRoute.of(context)!.settings.arguments),
                MyCartScreen.id: (context) => MyCartScreen(),
                FavoriteScreen.id: (context) => FavoriteScreen(),
                EditProfileScreen.id: (context) => EditProfileScreen(),
                RestPassword.id: (context) => RestPassword(),
                CheckOutScreen.id: (context) => CheckOutScreen(),
                locationScreen.id: (context) => locationScreen(),
                CompleteOrderScreem.id: (context) => CompleteOrderScreem(),
                CashOnDeliveryScreeen.id: (context) =>
                    CashOnDeliveryScreeen(),
                AddLocationScreen.id: (context) => AddLocationScreen(),
              });
        },
      ),
    );
  }
}
