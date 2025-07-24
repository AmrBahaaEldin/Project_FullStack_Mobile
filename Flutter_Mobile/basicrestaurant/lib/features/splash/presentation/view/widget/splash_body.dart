import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constant/color_app.dart';
import '../../../../../core/constant/router_app.dart';
import '../../../../../core/constant/style_app.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({
    super.key,
  });
  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>   with SingleTickerProviderStateMixin {
  late Animation<Offset> slideAnimation;
  late AnimationController  animationController;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slideInitAnimation();
    routerToLogin();
  }
  @override
  void dispose() {
    animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlideTransition(position: slideAnimation, child: Text("App",style: AppTextStyle.textStyle16.copyWith(
            color: AppColor.white,
          ),),),
          SizedBox(
            width: 10.w,
          ),
          SlideTransition(
            position: slideAnimation,
            child: Text("Restaurant",style: AppTextStyle.textStyle24.copyWith(
              color: AppColor.white,
            ),),
          ),
        ],
      ),
    );
  }


  void slideInitAnimation(){
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    slideAnimation = Tween<Offset>(
      begin: const Offset(4, 12),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    ));
    animationController.forward();
  }

  Future<void> routerToLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    GoRouter.of(context).push(RouterApp.login);
  }
}