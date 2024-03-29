import 'package:barbershop/app/utils/utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../export.dart';
import '../../../widgets/cache_image.dart';
import '../../../widgets/ripple.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController pageController = PageController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // this.controller.initHome();

      _animateSlider();
    });
    super.initState();
  }

  void _animateSlider() {
    Future.delayed(Duration(seconds: 3)).then((_) {
      int nextPage = this.pageController.page!.round() + 1;
      // if (nextPage == this.controller.listBanner.length) {
      nextPage = 0;
      // }

      this
          .pageController
          .animateToPage(nextPage,
              duration: Duration(seconds: 1), curve: Curves.easeInOut)
          .then((_) => _animateSlider());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: pageWrapper(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('nobre', style: h7n),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: XTheme.borderRadius(),
                      color: XColor.netral2(),
                    ),
                    child: SvgPicture.asset(
                      'assets/notification.svg',
                      color: XColor.netral6(),
                    ),
                  )
                ],
              ),
            ),
            Spacing(height: 20),
            HomeSliderSection(pageController: pageController),
            Spacing(height: 24),
            Padding(
              padding: pageWrapper(),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: XTheme.borderRadius(radius: 8),
                  color: XColor.netral2(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Our \nService', style: h5n),
                        Text(
                          'See All',
                          style: h5n.copyWith(color: XColor.primary()),
                        ),
                      ],
                    ),
                    Spacing(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MenuItem(
                          tipe: 'menu',
                          title: 'Cut',
                          icon: 'cut',
                        ),
                        MenuItem(
                          tipe: 'menu',
                          title: 'Beard',
                          icon: 'beard',
                        ),
                        MenuItem(
                          tipe: 'menu',
                          title: 'Color',
                          icon: 'color',
                        ),
                      ],
                    ),
                    Spacing()
                  ],
                ),
              ),
            ),
            Spacing(height: 20),
            Padding(
              padding: pageWrapper(),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: XTheme.borderRadius(radius: 8),
                  color: XColor.netral2(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Our \nShavers', style: h5n),
                        Text(
                          'See All',
                          style: h5n.copyWith(color: XColor.primary()),
                        ),
                      ],
                    ),
                    Spacing(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MenuItem(
                          title: 'John',
                          icon:
                              'https://captainbarbershop.co.id/assets-frontend/images/guest/Kaesang.jpeg',
                        ),
                        MenuItem(
                          title: 'Mark',
                          icon:
                              'https://captainbarbershop.co.id/assets-frontend/images/guest/Boy-William.jpeg',
                        ),
                        MenuItem(
                          title: 'Jason',
                          icon:
                              'https://captainbarbershop.co.id/assets-frontend/images/guest/Kunto-Aji.jpeg',
                        ),
                      ],
                    ),
                    Spacing()
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class BannerItem extends StatelessWidget {
  final String urlImage;

  const BannerItem({
    Key? key,
    required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: pageWrapper(),
      decoration: BoxDecoration(
        color: XColor.netral4(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: Get.width / 2,
          child: XNetworkImage(
            fit: BoxFit.fitHeight,
            url:
                'https://captainbarbershop.co.id/uploads/header/FAA5ACB8F99E4B75259BB3FCD0A5228C.jpg',
          ),
        ),
      ),
    );
  }
}

class HomeSliderSection extends StatelessWidget {
  // final HomeController controller;
  final PageController pageController;
  const HomeSliderSection({
    Key? key,
    // required this.controller,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // this.controller.isLoadingBanner
        //     ? HomeSliderLoading()
        //     : this.controller.listBanner.length > 0
        //         ?
        Column(
      children: [
        AspectRatio(
          aspectRatio: 2 / 1,
          child: Container(
            // width: Get.width,
            // padding: pageWrapper(),
            child: PageView.builder(
              controller: this.pageController,
              itemCount: 3,
              itemBuilder: (_, index) {
                // DataBanner current =
                //     this.controller.listBanner[index];

                return BannerItem(
                  // urlImage: current.image ?? '',
                  urlImage: '',
                );
              },
            ),
          ),
        ),
        Spacing(),
        // this.controller.isLoadingBanner
        //     ? displayNone()
        //     : this.controller.listBanner.length == 0
        //         ? displayNone()
        //         :
        SmoothPageIndicator(
          controller: this.pageController,
          // count: this.controller.listBanner.length,
          count: 3,
          effect: SlideEffect(
            dotHeight: 8,
            dotWidth: 8,
            dotColor: XColor.netral4(),
            paintStyle: PaintingStyle.stroke,
            activeDotColor: XColor.primary(),
          ),
        ),
      ],
    )
        // : displayNone()
        ;
  }
}

class MenuItem extends StatelessWidget {
  final String? title, icon, tipe;
  final double? size;
  final Function()? onTap;
  final Color? color;

  const MenuItem({
    Key? key,
    this.title,
    this.icon,
    this.tipe,
    this.onTap,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          XRipple(
            borderRadius: BorderRadius.circular(12),
            onTap: this.onTap ?? () {},
            child: Container(
              padding: EdgeInsets.all(tipe == 'menu' ? 8 : 0),
              width: this.size ?? 48,
              height: this.size ?? 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: XColor.primaryLight(),
              ),
              child: tipe == 'menu'
                  ? SvgPicture.asset(
                      'assets/$icon.svg',
                      color: this.color ?? XColor.secondary(),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: XCachedImage(
                        fit: BoxFit.fitWidth,
                        url: icon,
                        errorImage: title,
                      ),
                    ),
            ),
          ),
          Spacing(height: 8),
          Text(this.title ?? '',
              textAlign: TextAlign.center,
              style: h4b.copyWith(
                color: this.color ?? XColor.netral7(),
              ))
        ],
      ),
    );
  }
}
