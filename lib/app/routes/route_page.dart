part of 'import.dart';

class MyRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return PageTransition(
          child: const SplashScreen(),
          type: PageTransitionType.fade, // efek halus untuk splash
          settings: settings,
          duration: const Duration(milliseconds: 300),
        );

      case RoutesName.onBoarding:
        return PageTransition(
          child: const OnboardingPage(),
          type: PageTransitionType.fade, // efek halus untuk splash
          settings: settings,
          duration: const Duration(milliseconds: 300),
        );

      case RoutesName.home:
        return PageTransition(
          child: const HomeWrapper(),
          type: PageTransitionType.sharedAxisScale, // geser dari kanan
          settings: settings,
          duration: const Duration(milliseconds: 100),
        );

      case RoutesName.login:
        return PageTransition(
          child: const LoginPage(),
          type: PageTransitionType.fade, // balik ke kiri
          settings: settings,
          duration: const Duration(milliseconds: 100),
        );

      case RoutesName.register:
        return PageTransition(
          child: const RegisterPage(),
          type: PageTransitionType.fade, // 🌈 efek fade khusus register
          settings: settings,
          duration: const Duration(milliseconds: 100),
        );
      case RoutesName.cekNIK:
        return PageTransition(
          child: const CekNIK(),
          type: PageTransitionType.fade, // efek halus untuk splash
          settings: settings,
          duration: const Duration(milliseconds: 300),
        );

      case RoutesName.detailBerita:
        return PageTransition(
          child: DetailBeritaPage(
            detailBeritaDto: settings.arguments as DetailBeritaDto,
          ),
          type: PageTransitionType.fade, // efek halus untuk splash
          settings: settings,
          duration: const Duration(milliseconds: 300),
        );
      case RoutesName.detailProduct:
        return PageTransition(
          child: DetailProductPage(id: settings.arguments as String),
          type: PageTransitionType.fade, // efek halus untuk splash
          settings: settings,
          duration: const Duration(milliseconds: 300),
        );
      case RoutesName.detailToko:
        return PageTransition(
          child: const DetailTokoPage(),
          type: PageTransitionType.fade, // efek halus untuk splash
          settings: settings,
          duration: const Duration(milliseconds: 300),
        );
      case RoutesName.searchGlobal:
        return PageTransition(
          child: const SearchGlobalPage(),
          type: PageTransitionType.fade, // efek halus untuk splash
          settings: settings,
          duration: const Duration(milliseconds: 300),
        );
      case RoutesName.twakto:
        return PageTransition(
          child: const TwaktoPage(),
          type: PageTransitionType.fade, // efek halus untuk splash
          settings: settings,
          duration: const Duration(milliseconds: 300),
        );

      case RoutesName.profile:
        return PageTransition(
          child: const ProfilePage(),
          type: PageTransitionType.fade, // efek halus untuk splash
          settings: settings,
          duration: const Duration(milliseconds: 300),
        );

      default:
        return PageTransition(
          child: const NotFoundPage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 300),
        );
    }
  }
}
