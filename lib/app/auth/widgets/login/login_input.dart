import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';

import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/utils/validators/validator.dart';
import '../../../../common/widgets/text/custom_field_heading.dart';
import '../../../../common/widgets/text_field/custom_text_field.dart';
import '../../bloc/auth_bloc.dart';

class LoginInput extends StatefulWidget {
  const LoginInput({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> with AppValidator {
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
        SizedBox(height: AppSizes.space20),
        CustomFieldHeading(title: context.loc.password),
        BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (prev, current) {
            return prev.visibility != current.visibility;
          },
          builder: (context, state) {
            return CustomTextField.outlineBorder(
              controller: context.read<AuthBloc>().passwordController,
              validator: passwordValidator,
              obscureText: state.visibility,
              onChanged: (value) {
                if (widget.formKey.currentState!.validate()) {}
              },
              hintText: context.loc.passwordHint,
              textInputAction: TextInputAction.done,
              prefixIcon: Icon(
                size: AppSizes.iconSize20,
                Icons.lock_open,
                color: AppColors.iconColor,
              ),
              suffixIcon: InkWell(
                onTap: () {
                  if (state.status != AuthStatus.loginLoading) {
                    context.read<AuthBloc>().add(
                      const AuthEvent.togglePasswordVisibility(),
                    );
                  }
                },
                child: Icon(
                  size: AppSizes.iconSize20,
                  state.visibility
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: state.visibility
                      ? AppColors.iconColor
                      : AppColors.iconColor,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
