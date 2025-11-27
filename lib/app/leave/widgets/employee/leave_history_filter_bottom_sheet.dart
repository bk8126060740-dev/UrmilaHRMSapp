// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hrms_uis/common/utils/constants/sizes.dart';
// import 'package:hrms_uis/common/widgets/button/custom_button.dart';
//
// import '../../../../common/utils/popups/custom_toast.dart';
// import '../../../../common/widgets/date_time_picker/custom_date_picker.dart';
// import '../../../../common/widgets/dropdown/custom_animated_dropdown.dart';
// import '../../../../common/widgets/dropdown/dropdown_model.dart';
// import '../../../../common/widgets/text/custom_field_heading.dart';
// import '../../bloc/leave_bloc.dart';
//
// class LeaveHistoryFilterBottomSheet extends StatefulWidget {
//   const LeaveHistoryFilterBottomSheet({super.key});
//
//   @override
//   State<LeaveHistoryFilterBottomSheet> createState() =>
//       _LeaveHistoryFilterBottomSheetState();
// }
//
// class _LeaveHistoryFilterBottomSheetState
//     extends State<LeaveHistoryFilterBottomSheet> {
//   @override
//   Widget build(BuildContext context) {
//     var bloc = context.read<LeaveBloc>();
//     return BlocBuilder<LeaveBloc, LeaveState>(
//       builder: (context, state) {
//         return Column(
//           children: [
//             const CustomFieldHeading(title: "Filter By"),
//             CustomAnimatedDropdown<String>(
//               items: ["Date", "Status", "LeaveType"],
//               initialItem: state.selectedFilter,
//               hintText: '-- Select Filter Type --',
//               onChanged: (value) {
//                 // log("selected filter type : $value");
//                 // bloc.add(
//                 //   LeaveEvent.selectFilterType(selectedFilterType: value ?? ""),
//                 // );
//               },
//             ),
//             SizedBox(height: AppSizes.space16),
//             CustomFieldHeading(title: "From"),
//             CustomDatePicker(
//               enabled: state.selectedFilter.toLowerCase() == "custom",
//               key: ValueKey('fromDate_${state.fromDate ?? 'null'}'),
//               height: AppSizes.textFieldHeightLg,
//               hintText: 'From Date',
//               lastDate: DateTime.now(),
//               initialSelectedDate: state.fromDate,
//               onDateChanged: (DateTime picked) {
//                 bloc.add(
//                   LeaveEvent.selectDate(selectedDate: picked, isFromDate: true),
//                 );
//               },
//               validator: (date) {
//                 if (date == null) {
//                   return 'From Date is required';
//                 }
//                 return null;
//               },
//             ),
//             const SizedBox(height: AppSizes.space16),
//             CustomFieldHeading(title: "To"),
//             CustomDatePicker(
//               enabled: state.selectedFilter.toLowerCase() == "custom",
//               // key: ValueKey('toDate_${state.toDate ?? 'null'}'),
//               height: AppSizes.textFieldHeightLg,
//               hintText: 'To Date',
//               lastDate: DateTime.now(),
//               initialSelectedDate: state.toDate,
//               onDateChanged: (DateTime picked) {
//                 bloc.add(
//                   LeaveEvent.selectDate(
//                     selectedDate: picked,
//                     isFromDate: false,
//                   ),
//                 );
//               },
//               dependentFieldName: "From Date",
//               dependentDate: state.fromDate,
//               validator: (date) {
//                 if (date == null) {
//                   return 'To Date is required';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: AppSizes.space16),
//             CustomFieldHeading(title: "Status"),
//             CustomAnimatedDropdown<String>(
//               items: ["Approved", "Pending", "Rejected"],
//               initialItem: state.selectedFilter,
//               hintText: '-- Select Filter Type --',
//               onChanged: (value) {
//                 // log("selected filter type : $value");
//                 // bloc.add(
//                 //   LeaveEvent.selectFilterType(selectedFilterType: value ?? ""),
//                 // );
//               },
//             ),
//             SizedBox(height: AppSizes.space16),
//             CustomFieldHeading(title: "Leave Type"),
//             CustomAnimatedDropdown<DropdownModel>(
//               initialItem: state.selectedLeaveType,
//               hintText: "Select Leave Type",
//               items: (state.leaveTypeDataModel?.leaveTypeData ?? [])
//                   .map(
//                     (e) => DropdownModel(
//                       id: "${e.leaveType?.id ?? -1}",
//                       title: e.leaveType?.name ?? '',
//                     ),
//                   )
//                   .toList(),
//               onChanged: (v) {
//                 context.read<LeaveBloc>().add(LeaveEvent.changeLeaveType(v));
//               },
//             ),
//             SizedBox(height: AppSizes.space16),
//             Row(
//               children: [
//                 Expanded(
//                   child: CustomButton(
//                     onTap: () => Navigator.pop(context),
//                     text: "Cancel",
//                     isBorderButton: true,
//                   ),
//                 ),
//                 SizedBox(width: AppSizes.space16),
//                 Expanded(
//                   child: CustomButton(
//                     onTap: () {
//                       if (state.selectedFilter == "Custom" &&
//                           (state.fromDate == null || state.toDate == null)) {
//                         CustomToast.showError(
//                           message: "Please select both dates",
//                         );
//                         return;
//                       }
//                       context.read<LeaveBloc>().add(
//                         const LeaveEvent.getApproveLeaveList(),
//                       );
//                       Navigator.pop(context);
//                     },
//                     text: "Apply",
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
