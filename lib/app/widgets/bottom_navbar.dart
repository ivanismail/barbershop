import '../export.dart';
import '../modules/wrapper/controllers/wrapper_controller.dart';
import '../utils/utils.dart';

class BuildBottomNavBar extends StatefulWidget {
  final WrapperController controller;

  BuildBottomNavBar({
    required this.controller,
  });
  @override
  _BuildBottomNavBarState createState() => _BuildBottomNavBarState();
}

class _BuildBottomNavBarState extends State<BuildBottomNavBar>
// with MustLoginMiddleware {
{
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 18,
        unselectedItemColor: XColor.netral5(),
        selectedItemColor: XColor.primary(),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: h3,
        unselectedFontSize: h3,
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.controller.pageIndex.value,
        onTap: widget.controller.onTapBottomNavbar,
        items: widget.controller.bottomMenuItem,
      ),
    );
  }
}

class BuildIconNavBar extends StatelessWidget {
  const BuildIconNavBar({
    Key? key,
    required this.currentTab,
    required this.index,
    required this.svg,
    this.svgActive,
    this.showDot = false,
  }) : super(key: key);

  final int currentTab;
  final int index;
  final String svg;
  final String? svgActive;
  final bool showDot;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 30,
      child: Stack(
        alignment: Alignment.center,
        children: [
          currentTab != index
              ? SvgPicture.asset(
                  'assets/$svg.svg',
                  color:
                      currentTab != index ? XColor.netral5() : XColor.primary(),
                  width: 24,
                  height: 24,
                )
              : SvgPicture.asset(
                  'assets/$svgActive.svg',
                  color:
                      currentTab != index ? XColor.netral5() : XColor.primary(),
                  width: 24,
                  height: 24,
                ),
          showDot
              ? Positioned(
                  top: 0,
                  right: -200,
                  child: Icon(
                    Icons.circle,
                    color: XColor.primary(),
                    size: 4,
                  ),
                )
              : displayNone(),
        ],
      ),
    );
  }
}
