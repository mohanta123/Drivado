import 'package:get/get.dart';

class CompanyListController extends GetxController {
  var selectedTab = 1.obs;
  var companies = <String>[
    "Drivado Transfer Pvt Ltd.",
    "ExpressWay Freight Co.",
    "RapidTransit Solutions.",
    "SwiftMove Logistics Inc.",
    "QuickShift Transport Services.",
    "FastTrack Shipping Group",
    "SpeedyHaul Transport Ltd.",
    "VelocityExpress Logistics",
    "RushDeliveries Company",
  ].obs;

  void switchTab(int tabIndex) {
    selectedTab.value = tabIndex;
  }
}
