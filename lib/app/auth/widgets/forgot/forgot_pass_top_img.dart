import 'package:flutter/material.dart';

import '../../../../common/utils/constants/image_strings.dart';

class ForgotPasswordTopImg extends StatelessWidget {
  const ForgotPasswordTopImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(AppImages.forgotVector));
  }
}
