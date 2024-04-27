import 'package:barbershop/app/modules/order/controllers/order_controller.dart';
import 'package:barbershop/app/utils/utils.dart';
import 'package:barbershop/app/widgets/appbar.dart';
import 'package:barbershop/app/widgets/divider.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

import '../../../export.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/ripple.dart';

class OrderView extends StatefulWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  final OrderController orderController = OrderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XAppBar.normal('Order'),
      body: GetBuilder<OrderController>(
        init: OrderController(),
        initState: (_) {},
        builder: (_) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  height: Get.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacing(height: 20),
                      Container(
                        padding: pageWrapper(),
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
                                Spacing(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Potong Rambut', style: h5n),
                                    // Text('Rp. 18.000,-'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      XDivider(),
                      ChoseCard(
                        title: 'Shaver',
                        icon: '',
                        content: 'Pilih Shaver',
                      ),
                      XDivider(),
                      Padding(
                        padding: pageWrapper(),
                        child: Text('Date', style: h3b),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: WeeklyDatePicker(
                          selectedDay: orderController.selectedDay,
                          changeDay: (value) => setState(() {
                            orderController.selectedDay = value;
                          }),
                          enableWeeknumberText: false,
                          selectedBackgroundColor: XColor.primary(),
                          weeknumberColor: XColor.netral8(),
                          weeknumberTextColor: Colors.white,
                          backgroundColor: XColor.netral1(),
                          weekdayTextColor: XColor.netral8(),
                          digitsColor: XColor.netral8(),
                          // selectedDigitBackgroundColor: const Color(0xFF57AF87),
                          weekdays: const [
                            "Mo",
                            "Tu",
                            "We",
                            "Th",
                            "Fr",
                            "St",
                            "Su"
                          ],
                          daysInWeek: 7,
                        ),
                      ),
                      XDivider(),
                      ChoseCard(
                        title: 'Payment',
                        icon: '',
                        content: 'Pilih Metode Pembayaran',
                      ),
                      XDivider(),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding: pageWrapper().copyWith(bottom: 12, top: 12),
                  width: Get.width,
                  decoration: BoxDecoration(
                    boxShadow: XTheme.botShadow(),
                    border: Border.all(color: XColor.netral3()),
                    color: XColor.netral1(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GetBuilder<OrderController>(
                        init: OrderController(),
                        initState: (_) {},
                        builder: (_) {
                          return Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Total', style: h3n),
                                Text('RP. 38.000,-',
                                    // rupiah(int.parse(this
                                    //         .controller
                                    //         .nominalCon
                                    //         .text
                                    //         .replaceAll(',', '')
                                    //         .replaceAll('.', '')
                                    //         .replaceAll('-', '')) +
                                    //     this.controller.adminFee.toInt() -
                                    //     this.controller.discount.toInt()),
                                    style: h4b),
                              ],
                            ),
                          );
                        },
                      ),
                      Expanded(
                        child: GetBuilder<OrderController>(
                          init: OrderController(),
                          initState: (_) {},
                          builder: (_) {
                            return SolidButton(
                              text: 'Confirm',
                              // onTap:
                              //     this.controller.selectedPaymentMethod == null
                              //         ? () {}
                              //         : this.controller.doCheckout,
                              // inactive:
                              //     this.controller.selectedPaymentMethod == null
                              //         ? true
                              //         : false,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ChoseCard extends StatelessWidget {
  final String? title, icon, content;
  final Function()? onTap;
  const ChoseCard({Key? key, this.title, this.icon, this.content, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: pageWrapper(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(this.title ?? '', style: h3b),
          Spacing(),
          XRipple(
            onTap: this.onTap ?? () {},
            child: Container(
              width: Get.width,
              padding: paddingAll().copyWith(top: 12, bottom: 12),
              decoration: BoxDecoration(
                borderRadius: XTheme.borderRadius(),
                border: Border.all(color: XColor.netral4()),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/$icon.svg',
                        height: 24,
                        color: XColor.netral5(),
                      ),
                      Spacing(width: 12),
                      Container(
                        width: Get.width / 1.6,
                        child: Text(
                          this.content ?? '',
                          style: h4n,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: XColor.netral5(),
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          Spacing()
        ],
      ),
    );
  }
}
