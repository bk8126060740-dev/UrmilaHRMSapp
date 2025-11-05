import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';

import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/utils/validators/validator.dart';
import '../../../../common/widgets/text/custom_field_heading.dart';
import '../../../../common/widgets/text_field/custom_text_field.dart';
import '../../bloc/auth_bloc.dart';

class ForgotPasswordInput extends StatefulWidget {
  const ForgotPasswordInput({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  State<ForgotPasswordInput> createState() => _ForgotPasswordInputState();
}

class _ForgotPasswordInputState extends State<ForgotPasswordInput>
    with AppValidator {
  bool rememberME = false;

  bool condition = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomFieldHeading(title: context.loc.userId),
        CustomTextField.outlineBorder(
          controller: context.read<AuthBloc>().usernameController,
          validator: (val) => emptyValidator(val, title: context.loc.userId),
          onChanged: (value) {
            if (widget.formKey.currentState!.validate()) {}
          },
          hintText: context.loc.userIdHint,
          textInputAction: TextInputAction.next,
          prefixIcon: Icon(
            size: AppSizes.iconSize20,
            Icons.person_outlined,
            color: AppColors.iconColor,
          ),
        ),
      ],
    );
  }
}
