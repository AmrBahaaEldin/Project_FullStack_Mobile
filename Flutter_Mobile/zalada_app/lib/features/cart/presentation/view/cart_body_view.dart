import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/core/constant/style_app.dart';
import 'package:zalada_app/core/widgets/custom_button_app.dart';
import 'package:zalada_app/core/widgets/custom_loading_widget.dart';
import 'package:zalada_app/core/widgets/toast_message_app.dart'
    show ToastMessage;
import 'package:zalada_app/features/cart/data/model/user_cart_model/cart.dart';
import 'package:zalada_app/features/cart/manager/logic/cubit/products_cubit.dart';
import 'package:zalada_app/features/cart/manager/logic/cubit/products_state.dart';
import 'package:zalada_app/features/cart/manager/logic/showcart/cart_cubit.dart';
import 'package:zalada_app/features/cart/manager/logic/showcart/cart_state.dart';
import 'package:zalada_app/features/cart/presentation/view/widget/cart_empty.dart';
import 'package:zalada_app/features/cart/presentation/view/widget/product_list.dart';

import 'widget/cart_list_product.dart';

class CartBodyView extends StatelessWidget {
  const CartBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: CustomScrollView(
        slivers: [
          BlocConsumer<CartCubit, CartState>(
            listener: (context, state) {
              if (state is CartLoaded) {
                ToastMessage.showToast(
                  backGroundColor: ColorApp.green100,
                  message: "Fetched Cart",
                );
              }
              if (state is CartFailure) {
                ToastMessage.showToast(
                  backGroundColor: ColorApp.red100,
                  message: state.failure.errorMessage,
                );
              }
            },
            builder: (context, state) {
              if (state is CartLoaded &&
                  state.userCartModel.carts!.isNotEmpty) {
                return CartListproduct(
                  itemCount: state.userCartModel.carts![0].products!.length,
                  cart: state.userCartModel.carts![0].products!,
                );
              } else if (state is CartLoading) {
                return const SliverToBoxAdapter(
                  child: Center(child: CustomLoadingWidget()),
                );
              } else {
                return const SliverToBoxAdapter(child: CartEmpty());
              }
            },
          ),
          SliverToBoxAdapter(child: SizedBox(height: 30.h)),
          const SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Products May You Like",
                style: StylesTextApp.textStyle18,
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16.h)),
          BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              if (state is ProductsLoaded) {
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: 200.h,
                    child: ProductList(products: state.userCartModel.products!),
                  ),
                );
              } else {
                return const SliverToBoxAdapter(
                  child: Center(child: CustomLoadingWidget()),
                );
              }
            },
          ),

          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is CartLoaded &&
                  state.userCartModel.carts!.isNotEmpty) {
                return SliverToBoxAdapter(
                  child: CustomButtonApp(
                    isTwins: true,
                    widget: Text(state.userCartModel.carts!.length.toString()),
                    text: "Checkout",
                    boxColor: ColorApp.blue60,
                  ),
                );
              } else {
                return const SliverToBoxAdapter();
              }
            },
          ),
        ],
      ),
    );
  }
}
