import 'package:barbershop/app/routes/app_pages.dart';
import 'package:barbershop/app/widgets/ripple.dart';

import '../../../export.dart';
import '../../../utils/utils.dart';
import '../../../widgets/appbar.dart';

class ServiceView extends StatefulWidget {
  const ServiceView({Key? key}) : super(key: key);

  @override
  State<ServiceView> createState() => _ServiceViewState();
}

class _ServiceViewState extends State<ServiceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XAppBar.normal('Our Service'),
      body: Container(
        padding: pageWrapper(),
        child: Column(
          children: [
            Spacing(height: PAGE_WRAPPER),
            ListService(),
          ],
        ),
      ),
    );
  }
}

class ListService extends StatelessWidget {
  // final TransactionController controller;
  // final List<DataTransaction> listService;
  const ListService({
    Key? key,
    // required this.controller,
    // required this.listService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        // itemCount: listService.length,
        itemCount: 8,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        primary: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          // DataService current = listService[index];
          return ServiceCard();
        },
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  const ServiceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        XRipple(
          onTap: () => Get.toNamed(Routes.ORDER),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: XColor.primaryLight(),
                      ),
                      child: SvgPicture.asset(
                        'assets/beard.svg',
                        height: 32,
                      ),
                    ),
                    Spacing(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Potong Rambut'),
                        Text('Rp. 18.000,-'),
                      ],
                    ),
                  ],
                ),
                SvgPicture.asset('assets/arrow-right.svg', width: 24)
              ],
            ),
          ),
        ),
        Spacing()
      ],
    );
  }
}
