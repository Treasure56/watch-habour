import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

to(BuildContext context, Widget newPage) {
  Navigator.of(context).push(Platform.isIOS
      ? CupertinoPageRoute(builder: (context) => newPage)
      : MaterialPageRoute(builder: (context) => newPage));
}

back(BuildContext context) {
  Navigator.pop(context);
}

backTo(BuildContext context, Widget newPage) {
  Navigator.of(context).pushReplacement(Platform.isIOS
      ? CupertinoPageRoute(builder: (context) => newPage)
      : MaterialPageRoute(builder: (context) => newPage));
}

allBackTo(BuildContext context, Widget newPage) {
  Navigator.of(context).popUntil((route) => route.isFirst);
  backTo(context, newPage);
}
