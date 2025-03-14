import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:watch_habour/utils/utils.dart';
import 'package:watch_habour/widgets/widgets.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold(
      {super.key,
      required this.body,
      this.actions,
      required this.title,
      this.hideBack = false});
  final Widget body;
  final List<Widget>? actions;
  final dynamic title;
  final bool hideBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          statusBarColor: Theme.of(context).scaffoldBackgroundColor,
          statusBarIconBrightness: Brightness.dark,
        ),
        forceMaterialTransparency: true,
        leading: hideBack
            ? const SizedBox()
            : IconButton(
                onPressed: () => back(context),
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Theme.of(context).shadowColor,
                ),
              ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: title is String ? AppText.medium(title) : title,
        centerTitle: true,
        actions: [
          if (actions != null) ...actions!,
          const SizedBox(
            width: size,
          )
        ],
      ),
      resizeToAvoidBottomInset: true,
      body: body,
    );
  }
}
