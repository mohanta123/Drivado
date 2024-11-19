import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/manage_controller.dart';
import '../model/companyDetailsModelClass.dart';
import '../services/companyDetails_service_api.dart';

class CompanyDetailsScreen extends StatefulWidget {
  final String companyId;
  CompanyDetailsScreen(this.companyId);

  @override
  State<CompanyDetailsScreen> createState() => _CompanyDetailsScreenState();
}

class _CompanyDetailsScreenState extends State<CompanyDetailsScreen> {
  final controller = Get.put(ManageController());

  CompanyDetailsModelClass? _companyDetails;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCompanyDetails();
  }

  Future<void> fetchCompanyDetails() async {
    try {
      setState(() {
        _isLoading = true;
      });

      final companyDetails = await CompanyDetailsApiService.fetchCompanyDetails(widget.companyId);
      setState(() {
        _companyDetails = companyDetails;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching company details: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.brown[900],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _companyDetails?.companyName ?? 'Loading...',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            Text(
              _companyDetails?.email ?? 'Loading...',
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  _companyDetails?.logo ?? 'https://example.com/default-avatar.png'),
            ),
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Company Details
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Row with Switch
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Company Details',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Obx(() => Switch(
                        value: controller.isActivated.value,
                        onChanged: (value) => controller.toggleActivation(),
                        activeColor: Colors.brown[900],
                      ))
                    ],
                  ),
                  Divider(),
                  // Details
                  _buildCompanyDetailRow(
                      'Website', 'drivado.com', Icons.language),
                  _buildCompanyDetailRow(
                      'Mob. number', _companyDetails?.mobileNumber ?? '+91 7385977561', Icons.phone),
                  _buildCompanyDetailRow(
                      'GST/VAT', _companyDetails?.gstNum.toString() ?? 'Undefined', Icons.info),
                  _buildCompanyDetailRow(
                      'Address', _companyDetails?.address ?? 'Address not available', Icons.location_on),
                ],
              ),
            ),
            SizedBox(height: 24),
            // Credit Limit
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Credit limit',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  _buildCreditLimitRow('Total unpaid booking', _companyDetails!.totalUnpaidBooking.toString()),
                  _buildCreditLimitRow(
                      'Available credit limit', _companyDetails!.availableCreditLimit.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyDetailRow(String title, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[700]),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
              SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCreditLimitRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
          Text(
            value,
            style: TextStyle(
                fontWeight: FontWeight.w500, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
