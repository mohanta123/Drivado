import 'package:get/get.dart';

class ManageController extends GetxController {
  var selectedTab = 0.obs;
  var companies = <String>[].obs;
  var isExpanded = <String, bool>{}.obs;
  var subDropdownExpanded = <String, bool>{}.obs;
  var companySubItems = <String, List<String>>{}.obs;
  var selectedIndex = Rx<int>(-1);
  var isActivated = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCompanies();
  }

  void fetchCompanies() {
    companies.value = [
      'Drivado Transfer Pvt Ltd.',
      'Velocity Van Lines LLC',
      'Express Cargo Services Ltd.',
    ];

    for (var company in companies) {
      isExpanded[company] = false;
      subDropdownExpanded[company] = false;
    }


    companySubItems.value = {
      'Drivado Transfer Pvt Ltd.': ['Sub-item 1', 'Sub-item 2'],
      'Velocity Van Lines LLC': ['Sub-item A', 'Sub-item B'],
      'Express Cargo Services Ltd.': ['Sub-item X', 'Sub-item Y'],
    };

  }

  // Toggle main dropdown expansion

  void toggleExpand(String companyName) {
    isExpanded[companyName] = !(isExpanded[companyName] ?? false);
    isExpanded.refresh();
    print('Expanded state of $companyName: ${isExpanded[companyName]}');
  }


  // Toggle sub-dropdown expansion
  void toggleSubDropdown(String companyName) {
    subDropdownExpanded[companyName] = !(subDropdownExpanded[companyName] ?? false);
    subDropdownExpanded.refresh();
  }

  void toggleActivation() {
    isActivated.value = !isActivated.value;
  }

  @override
  void onClose() {
    super.onClose();
    companies.clear();
    isExpanded.clear();
    subDropdownExpanded.clear();
    companySubItems.clear();
  }
}
