class IntroductionBoarding {
  final String title;
  final String subTitle;
  final String image;

  IntroductionBoarding({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}

List<IntroductionBoarding> introductionBoarding = [
  IntroductionBoarding(
    title: "Find the item you've\n   been looking for",
    subTitle: "   Here you'll see rich varieties of goods,\ncarefully classified for seamless browsing \n                                         experience",
    image:"assets/svg/onboarding_1.svg",
  ),
  IntroductionBoarding(
    title: "Get those shopping\n   bags filled",
    subTitle: "Add any item you want to your cart or save\nit on your wishlist, so you don't miss it in \n                           your future purchase.",
    image: "assets/svg/onboarding_2.svg",
  ),
  IntroductionBoarding(
    title: "Fast & Secure\n  payment",
    subTitle: "There are many payment options available\n   to speed up and simplify your payment\n                                           process.",
    image: "assets/svg/onboarding_3.svg",
  ),
];