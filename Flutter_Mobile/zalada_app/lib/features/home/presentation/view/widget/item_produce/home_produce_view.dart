import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:readmore/readmore.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/core/constant/style_app.dart';
import 'package:zalada_app/core/widgets/custom_button_app.dart';
import 'package:zalada_app/features/home/data/model/item_produce/products_data.dart';
import 'package:zalada_app/features/home/presentation/view/widget/item_produce/item_produce.dart';
import 'package:zalada_app/features/home/presentation/view/widget/item_produce/related_produce.dart';

class HomeProduceView extends StatelessWidget {
  const HomeProduceView({required this.produceData, super.key});
  final ProduceData produceData;

  @override
  Widget build(BuildContext context) {
    final double afterdiscount =
        produceData.dataItemProduce.price! -
        produceData.dataItemProduce.discountPercentage!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: ColorApp.dark100),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: 10.w, bottom: 5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ItemProduce(
                  data: produceData.dataItemProduce,
                  afterdiscount: afterdiscount,
                ),
              ),
              SizedBox(height: 25.h),
              const Text(
                "Product Description",
                style: StylesTextApp.textStyle18,
              ),
              SizedBox(height: 12.h),
              ReadMoreText(
                style: StylesTextApp.textStyle14.copyWith(
                  color: ColorApp.dark25,
                ),
                produceData.dataItemProduce.description!,
                trimLines: 2, // عدد السطور قبل إظهار more
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Read More',
                trimExpandedText: 'Less',
                moreStyle: StylesTextApp.textStyle14.copyWith(
                  color: ColorApp.blue100,
                ),
                lessStyle: StylesTextApp.textStyle14.copyWith(
                  color: ColorApp.red100,
                ),
              ),
              SizedBox(height: 52.h),
              const Text("Product Related", style: StylesTextApp.textStyle18),
              SizedBox(height: 16.h),
              SizedBox(
                height: 200.h,
                child: RelatedProduce(products: produceData.dataProducts),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_bag),
                  ),
                  SizedBox(width: 28.w),
                  CustomButtonApp(
                    width: 250.w,

                    text: "CheckOut",
                    onPressed: () {},
                    boxColor: ColorApp.blue100,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
