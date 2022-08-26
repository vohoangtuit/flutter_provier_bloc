import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/app_provider.dart';

 class BaseBlocNew extends ChangeNotifier{
//  final  BaseScreen baseScreen;
  final  BuildContext context;
  final AppProvider provider;

  BaseBlocNew({required this.context,required this.provider});
}