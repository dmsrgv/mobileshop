import 'package:flutter/material.dart';
import 'package:mobileshop/common/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TitleCart extends StatelessWidget {
  const TitleCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: Text(
        AppLocalizations.of(context)!.myCart,
        style: TextStyle(
            color: AppColors.blue, fontWeight: FontWeight.w700, fontSize: 32),
      ),
    );
  }
}
