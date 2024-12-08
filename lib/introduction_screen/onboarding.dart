import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:maktabati2/Pages_View/auth/login.dart';
import 'package:maktabati2/const/constance.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Pages_View/Main_pages/Navigtion_Bar.dart';
import '../const/CustomPageRoute.dart';
class onboarding extends StatefulWidget {
  const onboarding({Key? key}) : super(key: key);



  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  final List<PageViewModel> pages = [
    PageViewModel(
        title: '    اكثر من 6000   زائر شھریا    ً',
        body: 'یزور موقع مكتبتي اكثر من 6 ألف زائر  مھتم بالكتب العربیة شھریاً حول العالم',
        footer: SizedBox(
          height: 45,
          width: 300,
        ),
        image: Center(
          child: Lottie.asset("assets/person.json",width: 250,),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            )
        )
    ),
    PageViewModel(

        title: 'اكثر من    4000   عملیة بحث یومیاً',
        body: 'أكثر من 4 ألف عملیة بحث عن كتاب  عربي تحدث یومیاً على مكتبتي',
        footer: SizedBox(
          height: 45,
          width: 300,

        ),
        image: Center(
          child: Lottie.asset("assets/book-search.json",width: 250,),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            )
        )
    ),
    PageViewModel(
        title: 'الهدف من مكتبتي',
        body: 'تھدف مكتبتي إلى إنشاء أكبر قاعدة بیانات لمؤلفین الكتب العربی',
        footer: SizedBox(
          height: 45,
          width: 300,

        ),
        image: Center(
          child: Lottie.asset("assets/people.json",width: 250,),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            )
        )
    ),
    PageViewModel(
        title: ' اكثر من   9,835    كتاب  ',
        body: 'آلاف الكتب المنشورة على مكتبتي منھا ما  نشره المؤلف بنفسھ أو فریق المكتب',
        footer: SizedBox(
          height: 45,
          width: 300,

        ),
        image: Center(
          child: Lottie.asset("assets/books.json",width: 250,),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            )
        )
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: const DotsDecorator(
            size: Size(15,15),
            color: Colors.black12,
            activeSize: Size.square(20),
            activeColor: primary_Color,
          ),
          showDoneButton: true,
          done: const Text('ابدأ', style: TextStyle(fontSize: 20,color: primary_Color,fontWeight: FontWeight.bold),),
          showSkipButton: true,
          skip: const Text('تخطي', style: TextStyle(fontSize: 20,color: primary_Color,fontWeight: FontWeight.bold),),
          showNextButton: true,
          next: const Icon(Icons.arrow_forward, size: 25,color: primary_Color),
          onDone: () => onDone(context),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }
}
void onDone(context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('ON_BOARDING', false);
  Navigator.pushReplacement(
      context,
      CustomPageRoute(  child:  Login()));
}