import 'package:expensetracker/core/constant/color_app.dart';
import 'package:expensetracker/core/constant/image_app.dart';
import 'package:expensetracker/core/constant/style_app.dart';
import 'package:expensetracker/features/main_navigation/data/check_date_balance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.zero,
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.only(left: 3),
          height: 20.r,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: ColorApp.violet100,
              width: 1.w,
            ),
          ),
          child: const ClipOval(
            child: Image(
              image: AssetImage(ImageApp.profile),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(Icons.keyboard_arrow_down_outlined),
            ),
            const Text(
              "October",
              style: AppTextStyles.textStyle14,
            )
          ],
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: ColorApp.violet100,
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Account Balance",
                    style: AppTextStyles.textStyle14.copyWith(
                      color: ColorApp.light20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 9.h,
                ),
                const Center(
                  child: Text("\$9400", style: AppTextStyles.textStyle32),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    const TypePayment(),
                    SizedBox(
                      width: 20.w,
                    ),
                    const TypePayment(),
                  ],
                ),
                SizedBox(
                  height: 13.h,
                ),
                const CartesianChart(),
                const SegmentButton(),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Recent Transactions",
                        style: AppTextStyles.textStyle18),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(ColorApp.violet20),
                      ),
                      onPressed: () {},
                      child: Text(
                        "View All",
                        style: AppTextStyles.textStyle14
                            .copyWith(color: ColorApp.violet100),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),

              ],
            ),
          ),
      const    TransactionList(),

        ],

      ),
    );
  }
}

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: 8.h,
      ),
      itemCount: TransactionItemData.transactionItems.length,
      itemBuilder: (context, index) {
        final data = TransactionItemData.transactionItems[index];
        return  TransactionItem(
          data: data,
        );
      },

         );
  }
}

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
   required this.data,
  });
 final TransactionItemModel data ;
  @override
  Widget build(BuildContext context) {
    return ListTile(


      contentPadding: EdgeInsets.zero,
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data.price, style: AppTextStyles.textStyle16.copyWith(
            color: ColorApp.red100,
          )),
          SizedBox(height: 12.h,),
          Text(data.datetime, style: AppTextStyles.textStyle13.copyWith(
            color: ColorApp.light20,
          ),),
        ],
      ),
      title: Text (data.title,style: AppTextStyles.textStyle16,),
      subtitle:  Text(data.subtitle,style:AppTextStyles.textStyle13.copyWith(color: ColorApp.light20),),
      leading: SvgPicture.asset(data.image),
    );
  }
}

class CartesianChart extends StatelessWidget {
  const CartesianChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185.h,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: const CategoryAxis(
          isVisible: false,
        ),
        primaryYAxis: const NumericAxis(
          isVisible: false,
        ),
        series: <CartesianSeries>[
          SplineAreaSeries<int, int>(
            color: Colors.transparent, //
            dataSource: const [20, 4, -5, 15, 10, 80, 30, -1],
            xValueMapper: (value, index) => index,
            yValueMapper: (value, index) => value,
            borderColor: ColorApp.violet80,
            borderWidth: 8,
          )
        ],
      ),
    );
  }
}

class SegmentButton extends StatelessWidget {
  const SegmentButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<String>(
      showSelectedIcon: false,

      segments: [
        ButtonSegment(
            value: CheckDateBalance.selectDateCheck,
            label: Text(CheckDateBalance.selectDateCheck)),
        ButtonSegment(
            value: CheckDateBalance.selectWeekCheck,
            label: Text(CheckDateBalance.selectWeekCheck)),
        ButtonSegment(
            value: CheckDateBalance.selectMonthCheck,
            label: Text(CheckDateBalance.selectMonthCheck)),
        ButtonSegment(
            value: CheckDateBalance.selectYearCheck,
            label: Text(CheckDateBalance.selectYearCheck)),
      ],
      selected: {CheckDateBalance.selectDateCheck},
      onSelectionChanged: (newSelection) {
        debugPrint(newSelection.first);
        // هنا تقدر تحدث الحالة أو Bloc حسب الاختيار
      },

      // 🎨 تنسيق الأزرار
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return ColorApp.yellow20; // الخلفية المختارة
          }
          return Colors.transparent; // الخلفية العادية
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return ColorApp.yellow100; // لون النص لو مختار
          }
          return ColorApp.light20; // لون النص العادي
        }),
        side: WidgetStateProperty.all(BorderSide.none),
        shape: WidgetStateProperty.all(RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(28.r),
        )),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
      ),
    );
  }
}

class TypePayment extends StatelessWidget {
  const TypePayment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        height: 80.h,
        decoration: BoxDecoration(
            color: ColorApp.green100,
            borderRadius: BorderRadius.circular(
              28.r,
            )),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ImageApp.incomeSv),
            SizedBox(width: 10.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "income",
                  style: AppTextStyles.textStyle18.copyWith(
                    color: ColorApp.light80,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "\$5000",
                  style: AppTextStyles.textStyle18.copyWith(
                    color: ColorApp.light80,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class TransactionItemModel{
  const TransactionItemModel({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.price,
    required this.datetime,
  });
  final String title;
  final String subtitle;
  final String image;
  final String price;
  final String datetime;

}
class TransactionItemData{
  TransactionItemData._();
  static  List<TransactionItemModel> transactionItems=[
   const TransactionItemModel(
      image:ImageApp.shoppingSv,
  datetime: "03:30pm",
  price: "-\$5000",
  subtitle: "Buy some grocey",
  title: "Shopping",

      ),
    const TransactionItemModel(
      image:ImageApp.subscriptionsSv,
  datetime: "03:30pm",
  price: "-\$80",
  subtitle: "Disney +Annul",
  title: "subscriptions",),
    const TransactionItemModel(
      image:ImageApp.foodSv,
  datetime: "07:30Am",
  price: "-\$32",
  subtitle: "Buy a ramen",
  title: "food",),

  ];



}