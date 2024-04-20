import '../../../export.dart';
import '../../../utils/utils.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/cache_image.dart';
import '../../../widgets/container.dart';
import '../../../widgets/dialog.dart';
import '../../../widgets/ripple.dart';
import '../../../widgets/shared_text.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final ProfileController controller = Get.put(ProfileController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // this.controller.initProfile();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: GetBuilder<ProfileController>(
        init: ProfileController(),
        initState: (_) {},
        builder: (_) {
          return Container(
            color: XColor.netral1(),
            padding: EdgeInsets.only(bottom: PAGE_WRAPPER),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '', // this.controller.version.toString(),
                  style: h3l,
                ),
              ],
            ),
          );
        },
      ),
      body: GetBuilder<ProfileController>(
        init: ProfileController(),
        initState: (_) {},
        builder: (_) {
          return SingleChildScrollView(
            child: this.controller.isLoading
                ? Column(
                    children: [
                      Spacing(height: Get.height / 2),
                      Center(
                        child: CircularProgressIndicator(
                          color: XColor.primary(),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Container(
                        height: 240,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          color: XColor.primary(),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Spacing(height: 30),
                            Stack(
                              children: [
                                this.controller.image == null
                                    ? Container(
                                        height: 96,
                                        width: 96,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: XCachedImage(
                                            fit: BoxFit.fitWidth,
                                            url: this.controller.photo ?? '',
                                            errorImage: this.controller.name,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        width: 96,
                                        height: 96,
                                        child: CircleAvatar(
                                          backgroundImage:
                                              FileImage(this.controller.image!),
                                        ),
                                      ),
                                Positioned(
                                    bottom: 2,
                                    right: 2,
                                    child: XRipple(
                                      onTap: this.controller.getImageCamera,
                                      child: Container(
                                        height: 28,
                                        width: 28,
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: XColor.netral1(),
                                        ),
                                        child: SvgPicture.asset(
                                            'assets/image-edit-fill.svg'),
                                      ),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                      Spacing(),
                      Container(
                        padding: pageWrapper(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LabelProfile(
                              svg: 'user-line',
                              title: 'Profil',
                              subTitle: 'Ubah',
                              // onTap: () => Get.toNamed(Routes.PROFILE_EDIT),
                            ),
                            XCard(
                              child: Container(
                                width: Get.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ColumnTextProfile(
                                      title: 'Nama Lengkap',
                                      subTitle: this.controller.name ?? '',
                                    ),
                                    Spacing(height: 8),
                                    ColumnTextProfile(
                                      title: 'Nomor Telepon',
                                      subTitle: '+62' +
                                          this.controller.phone.toString(),
                                    ),
                                    Spacing(height: 8),
                                    ColumnTextProfile(
                                      title: 'Email',
                                      subTitle: this.controller.email ?? '',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // LabelProfile(
                            //   svg: 'settings-line',
                            //   title: 'Pengatuan',
                            // ),
                            // XRipple(
                            //   // onTap: () => Get.toNamed(Routes.PRIVACY_POLICY),
                            //   child: XCard(
                            //     spacing: 0,
                            //     padding: EdgeInsets.symmetric(
                            //         horizontal: 16, vertical: 12),
                            //     child: Row(
                            //       mainAxisAlignment:
                            //           MainAxisAlignment.spaceBetween,
                            //       children: [
                            //         Text(
                            //           'Kebijakan Privasi',
                            //           style: h3n,
                            //         ),
                            //         SvgPicture.asset('assets/arrow-right.svg')
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // Spacing(),
                            // XRipple(
                            //   // onTap: () => Get.toNamed(Routes.TERM_CONDITION),
                            //   child: XCard(
                            //     spacing: 0,
                            //     padding: EdgeInsets.symmetric(
                            //         horizontal: 16, vertical: 12),
                            //     child: Row(
                            //       mainAxisAlignment:
                            //           MainAxisAlignment.spaceBetween,
                            //       children: [
                            //         Text(
                            //           'Syarat & Ketentuan',
                            //           style: h3n,
                            //         ),
                            //         SvgPicture.asset('assets/arrow-right.svg')
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // Spacing(),
                            // XRipple(
                            //   onTap: () => _getConfirmDeleteAccount(controller),
                            //   child: XCard(
                            //     color: XColor.dangerLight(),
                            //     spacing: 0,
                            //     padding: EdgeInsets.symmetric(
                            //         horizontal: 16, vertical: 12),
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.start,
                            //       children: [
                            //         SvgPicture.asset(
                            //           'assets/trash.svg',
                            //           color: XColor.danger(),
                            //         ),
                            //         Spacing(width: 10),
                            //         Text(
                            //           'Hapus Akun',
                            //           style:
                            //               h3n.copyWith(color: XColor.danger()),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // Spacing(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SolidButton(
                                  backgroudColor: XColor.primary(),
                                  borderSide: BorderSide.none,
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  text: 'Logout',
                                  onTap: () => _getConfirm(controller),
                                  style: TextStyle(color: XColor.netral1()),
                                  prefixIcon: SvgPicture.asset(
                                    'assets/door-open-fill.svg',
                                    color: XColor.netral1(),
                                  ),
                                ),
                              ],
                            ),
                            Spacing(height: SAVE_FAB * 2)
                          ],
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}

_getConfirm(ProfileController controller) {
  XDialog.confirmDefault(
    title: Text(
      'Keluar dari Aplikasi',
      style: TextStyle(
        color: XColor.netral7(),
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    ),
    content: Text(
      'Kamu yakin ingin keluar?',
      style: TextStyle(
        fontSize: 16,
        color: XColor.netral7(),
      ),
    ),
    actions: [
      XTextButton(
        onTap: () => Get.back(),
        text: 'Batal',
        style: TextStyle(
          color: XColor.netral6(),
        ),
      ),
      SolidButton(
        text: 'Keluar',
        // onTap: controller.doLogout,
        backgroudColor: XColor.primaryDark(),
        borderSide: BorderSide.none,
        padding: EdgeInsets.symmetric(horizontal: 12),
        style: TextStyle(color: XColor.primary()),
      ),
    ],
  );
}

class LabelProfile extends StatelessWidget {
  final String? svg, title, subTitle;
  final VoidCallback? onTap;

  const LabelProfile({
    Key? key,
    this.svg,
    this.title,
    this.subTitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/$svg.svg',
                  height: 20,
                  width: 20,
                ),
                Spacing(width: 12),
                Text(title ?? '', style: h3b),
              ],
            ),
            XRipple(
              onTap: this.onTap ?? () {},
              child: Text(this.subTitle ?? '', style: h3n),
            ),
          ],
        ),
        Spacing()
      ],
    );
  }
}
