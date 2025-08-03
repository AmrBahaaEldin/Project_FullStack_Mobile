// import 'package:e_commerce_app/core/constants/app_color.dart';
// import 'package:e_commerce_app/features/cart/presentation/cart_screen.dart';
// import 'package:e_commerce_app/features/home/presentation/home_screen.dart';

// import 'package:e_commerce_app/features/layout/logic/layout_cubit.dart';
// import 'package:e_commerce_app/features/layout/logic/layout_state.dart';
// import 'package:e_commerce_app/features/profile/presentation/widget/profile_screen.dart';
// import 'package:e_commerce_app/features/search/presentation/search_screen.dart';
// import 'package:e_commerce_app/features/wishlist/presentation/wishlist_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class LayoutScreen extends StatelessWidget {
//   const LayoutScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => BottomNavigatorBarCubit(),
//       child: BlocConsumer<BottomNavigatorBarCubit, BottomNavigatorBarState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           int selectedIndex =
//           (state is BottomNavigatorBarChanges) ? state.index : 0;
//           return Scaffold(
//             body: BlocBuilder<BottomNavigatorBarCubit, BottomNavigatorBarState>(
//                 builder: (context, state) {
//               if (state is BottomNavigatorBarChanges) {
//                 switch (state.item) {
//                   case 'Home':
//                     return const HomeScreen();

//                   case 'Search':
//                     return SearchScreen();

//                   case 'Wishlist':
//                     return WishListScreen();

//                   case 'Cart':
//                     return CartScreen();

//                   case 'Profile':
//                     return const ProfileScreen();
//                 }
//               }
//               return Container();
//             }),
//             bottomNavigationBar: (BottomNavigationBar(
//               onTap: (index) {
//                 switch (index) {
//                   case 0:
//                     BlocProvider.of<BottomNavigatorBarCubit>(context)
//                         .getNavBarItem('Home');
//                     break;
//                   case 1:
//                     BlocProvider.of<BottomNavigatorBarCubit>(context)
//                         .getNavBarItem('Search');
//                     break;
//                   case 2:
//                     BlocProvider.of<BottomNavigatorBarCubit>(context)
//                         .getNavBarItem('Wishlist');
//                     break;
//                   case 3:
//                     BlocProvider.of<BottomNavigatorBarCubit>(context)
//                         .getNavBarItem('Cart');
//                     break;
//                   case 4:
//                     BlocProvider.of<BottomNavigatorBarCubit>(context)
//                         .getNavBarItem('Profile');
//                     break;
//                 }
//               },
//               items: [
//                 BottomNavigationBarItem(
//                     icon: Icon(FontAwesomeIcons.home), label: "Home"),
//                 BottomNavigationBarItem(
//                     icon: Icon(FontAwesomeIcons.search), label: "Search"),
//                 BottomNavigationBarItem(
//                     icon: Icon(FontAwesomeIcons.heart), label: "Wishlist"),
//                 BottomNavigationBarItem(
//                     icon: Icon(FontAwesomeIcons.cartShopping), label: "Cart"),
//                 BottomNavigationBarItem(
//                     icon: Icon(FontAwesomeIcons.user), label: "Profile"),
//               ],

//               unselectedItemColor: AppColor.subFontColor,
//               showUnselectedLabels: true,
//               selectedItemColor: AppColor.buttonColor,
//               landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
//               type: BottomNavigationBarType.shifting,
//               backgroundColor: Colors.white,
//               currentIndex:  selectedIndex,
//             )),
//           );
//         },
//       ),
//     );
//   }
// }
