import 'package:flutter/material.dart';
import 'package:hrms_uis/common/navigation_service/navigation_service.dart';
import 'package:hrms_uis/common/utils/constants/decorations.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import 'package:hrms_uis/common/widgets/button/custom_button.dart';
import 'package:hrms_uis/common/widgets/checkbox/custom_checkbox.dart';

import '../../../common/utils/constants/colors.dart';
import '../../../common/utils/constants/text_styles.dart';
import '../../../common/widgets/appbar/custom_appbar.dart';
import 'approve_attend_emp_details.dart';

class ApproveAttendEmpListScreen extends StatefulWidget {
  static const route = '/approve_attendance_emp_list';

  const ApproveAttendEmpListScreen({super.key});

  @override
  State<ApproveAttendEmpListScreen> createState() =>
      _ApproveAttendEmpListScreenState();
}

class _ApproveAttendEmpListScreenState
    extends State<ApproveAttendEmpListScreen> {
  final List<Map<String, dynamic>> employees = [
    {
      "name": "KUNDAN KUMAR - UISPAT332",
      "date": "04-Nov-2025 09:54 AM",
      "status": "IN",
      "selected": false,
    },
    {
      "name": "KUNDAN KUMAR - UISPAT332",
      "date": "03-Nov-2025 06:12 PM",
      "status": "OUT",
      "selected": false,
    },
    {
      "name": "KUNDAN KUMAR - UISPAT332",
      "date": "02-Nov-2025 10:05 AM",
      "status": "IN",
      "selected": false,
    },
  ];

  bool selectAll = false;
  final TextEditingController remarkController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Colors.blue.shade700;

    final filteredEmployees = employees
        .where(
          (e) => e["name"].toString().toLowerCase().contains(
            searchController.text.toLowerCase(),
          ),
        )
        .toList();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        elevation: 0,
        title: context.loc.approveAttendance,
        subtitle: "02-Nov-25 - 08-Nov-25",
        showAvatar: false,
        showBackButton: true,
        showNavigation: false,
        showCalendarIcon: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppSizes.padding16,
            horizontal: AppSizes.padding16,
          ),
          child: Column(
            children: [
              // Date range
              Column(
                children: [
                  // Select all + Search
                  Row(
                    children: [
                      CustomCheckBox(
                        value: selectAll,
                        title: "Select All",
                        scale: 1,
                        onChanged: (value) {
                          setState(() {
                            selectAll = value;
                            for (var e in employees) {
                              e["selected"] = selectAll;
                            }
                          });
                        },
                      ),
                      // const Spacer(),
                      // InkWell(
                      //   onTap: () {
                      //     setState(() {
                      //       searchController.clear();
                      //     });
                      //   },
                      //   child: const Icon(
                      //     Icons.refresh_rounded,
                      //     color: Colors.grey,
                      //   ),
                      // ),
                    ],
                  ),

                  SizedBox(height: AppSizes.space8),

                  // Search bar
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: "Search...",
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) => setState(() {}),
                  ),
                  SizedBox(height: AppSizes.space16),
                ],
              ),

              // Employee list
              Expanded(
                child: ListView.separated(
                  itemCount: filteredEmployees.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 0),
                  itemBuilder: (context, index) {
                    final emp = filteredEmployees[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: AppSizes.space16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withFixedOpacity(0.05),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: CustomCheckBox(
                          value: emp["selected"],
                          scale: 1,
                          onChanged: (value) {
                            setState(() {
                              emp["selected"] = value;
                              selectAll = employees.every((e) => e["selected"]);
                            });
                          },
                        ),
                        title: Text(
                          emp["name"],
                          style: AppTextStyles.w400_14(
                            context,
                            color: AppColors.textColor,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month,
                                  size: 16,
                                  color: AppColors.iconColor,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  emp["date"],
                                  style: AppTextStyles.w400_12(
                                    context,
                                    color: AppColors.secondaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(
                                  Icons.access_time,
                                  size: 16,
                                  color: AppColors.iconColor,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  emp["status"],
                                  style: AppTextStyles.w400_12(
                                    context,
                                    color: AppColors.secondaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: InkWell(
                          onTap: () {
                            NavigationService.navigateTo(
                              ApproveAttendEmpDetails.route,
                              arguments: EmployeeSwipeModel(
                                name: "KUNDAN KUMAR",
                                empCode: "UISPAT332",
                                department: "IT",
                                dateTime: DateTime(2025, 11, 4, 9, 54),
                                inOut: "IN",
                                remark: "On time swipe",
                                location:
                                    "AIIMS - DIGHA Service road, Patna, Bihar, 801503, India",
                                imageUrl: "https://example.com/photo.jpg",
                              ),
                            );
                          },
                          child: Icon(
                            Icons.visibility_outlined,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Bottom remark + button
              Container(
                padding: const EdgeInsets.all(16),
                decoration: AppDecorations.card(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: remarkController,
                      maxLines: 2,
                      decoration: InputDecoration(
                        hintText: "Enter remarks...",
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        // icon: const Icon(Icons.check_circle_outline),
                        // label: const Text(
                        //   "Approve Selected",
                        //   style: TextStyle(
                        //     fontSize: 16,
                        //     fontWeight: FontWeight.w600,
                        //   ),
                        // ),
                        text: "Approve Selected",
                        onTap: () {
                          final selected = employees
                              .where((e) => e["selected"])
                              .toList();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "${selected.length} requests approved",
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
