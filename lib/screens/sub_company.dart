import 'package:drivado/screens/userDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/manage_controller.dart';
import '../model/companyModelClass.dart';
import '../services/companyApiService.dart';
import 'companyDetailsScreen.dart';

class SubCompany extends StatefulWidget {
  const SubCompany({super.key});
  @override
  _SubCompanyState createState() => _SubCompanyState();
}

class _SubCompanyState extends State<SubCompany> {
  final ManageController controller = Get.put(ManageController());
  int? expandedIndex;
  int? selectedIndex;
  bool _isLoading = true;
  List<CompanyModelClass>? _companies;

  @override
  void initState() {
    super.initState();
    loadCompanies();
  }

  Future<void> loadCompanies() async {
    try {
      List<CompanyModelClass> companies = await CompanyApiService.fetchUsers();
      setState(() {
        _companies = companies;
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading companies: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
      itemCount: _companies?.length ?? 0,
      itemBuilder: (context, index) {
        bool isExpanded = expandedIndex == index;
        bool isSelected = selectedIndex == index;

        return Column(
          children: [

            ListTile(
              leading: Icon(
                Icons.business,
                color: isSelected ? Colors.pink : Colors.grey,
              ),
              title: Text(
                _companies![index].companyName ?? "Company Name",
                style: TextStyle(
                  color: isSelected ? Colors.pink : Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              trailing: Icon(
                isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: Colors.grey,
              ),
              onTap: () {
                setState(() {
                  // Toggle expanded state for the item
                  expandedIndex = isExpanded ? null : index;
                  // Toggle selected state for the item
                  selectedIndex = isSelected ? null : index;
                });
              },
            ),
            if (isExpanded)
              Container(
                color: Colors.grey[200],
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CompanyDetailsScreen('${_companies![index].id}'),
                            ),
                          );
                        },
                        child: const Card(
                          margin: EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            title: Text(
                              'Company Details',
                              style: TextStyle(color: Colors.black),
                            ),
                            leading: Icon(Icons.details, color: Colors.black),
                            trailing: Icon(Icons.arrow_forward, color: Colors.black),
                          ),
                        ),
                      ),

                      Card(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          leading: Icon(Icons.email, color: Colors.grey),
                          title: Text(
                            '${_companies![index].email}', // Update based on your model
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          leading: Icon(Icons.phone, color: Colors.grey),
                          title: Text(
                            '${_companies![index].mobileNumber}', // Update based on your model
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          leading: Icon(Icons.location_on_outlined, color: Colors.grey),
                          title: Text(
                            '${_companies![index].address}', // Update based on your model
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          leading: Icon(Icons.info, color: Colors.grey),
                          title: Text(
                            '${_companies![index].gstNum}', // Update based on your model
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      // Sub Item 2
                      Card(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          leading: Icon(Icons.info_outline, color: Colors.grey),
                          title: Text(
                            'Available Credit Limit :- ${_companies![index].availableCreditLimit}',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
