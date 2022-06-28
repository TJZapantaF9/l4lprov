import 'package:flutter/material.dart';
import 'package:handyman_provider_flutter/main.dart';
import 'package:handyman_provider_flutter/models/dashboard_response.dart';
import 'package:handyman_provider_flutter/provider/dashboard/widgets/total_widget.dart';
import 'package:handyman_provider_flutter/provider/handyman/all_handyman_list_screen.dart';
import 'package:handyman_provider_flutter/provider/services/service_list_screen.dart';
import 'package:handyman_provider_flutter/provider/wallet/wallet_history_screen.dart';
import 'package:handyman_provider_flutter/screens/total_earning_screen.dart';
import 'package:handyman_provider_flutter/utils/common.dart';
import 'package:handyman_provider_flutter/utils/constant.dart';
import 'package:handyman_provider_flutter/utils/extensions/context_ext.dart';
import 'package:handyman_provider_flutter/utils/images.dart';
import 'package:nb_utils/nb_utils.dart';

class TotalComponent extends StatelessWidget {
  final DashboardResponse snap;

  TotalComponent({required this.snap});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        TotalWidget(
                title: context.translate.lblTotalBooking,
                total: snap.totalBooking.toString(),
                icon: total_booking)
            .onTap(
          () {
            LiveStream().emit(providerAllBooking, 1);
          },
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        TotalWidget(
          title: context.translate.lblTotalService,
          total: snap.total_service.validate().toString(),
          icon: total_services,
        ).onTap(
          () {
            ServiceListScreen()
                .launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
          },
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        if (snap.earningType == EARNING_TYPE_SUBSCRIPTION && isUserTypeProvider)
          TotalWidget(
            title: context.translate.lblTotalHandyman,
            total: snap.total_handyman.validate().toString(),
            icon: handyman,
          ).onTap(
            () {
              AllHandymanListScreen().launch(context,
                  pageRouteAnimation: PageRouteAnimation.Slide);
            },
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
        TotalWidget(
          title: context.translate.lblTotalRevenue,
          total:
              "P ${snap.totalRevenue.validate().toStringAsFixed(decimalPoint).formatNumberWithComma()}",
          icon: percent_line,
        ).onTap(
          () {
            TotalEarningScreen().launch(context);
          },
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        if (snap.earningType == EARNING_TYPE_COMMISSION)
          TotalWidget(
            title: context.translate.lblWallet,
            total:
                "P ${snap.providerWallet != null ? snap.providerWallet?.amount.validate().toStringAsFixed(decimalPoint).formatNumberWithComma() : "0"}",
            icon: unfill_wallet,
          ).onTap(
            () {
              WalletHistoryScreen().launch(context);
            },
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
      ],
    ).paddingAll(16);
  }
}
