import 'dart:ui';

import 'package:flutter/cupertino.dart';

Size displaySize(context) {
  return MediaQuery.of(context).size;
}

double displayHeight(context)
{
  return displaySize(context).height;
}

double displayWidth(context)
{
  return displaySize(context).height;
}