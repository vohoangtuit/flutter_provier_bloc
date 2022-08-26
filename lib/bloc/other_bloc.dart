import 'package:flutter/foundation.dart';
import 'package:flutter_provider/bloc/base_bloc.dart';
class OtherBloc  extends BaseBloc  with ChangeNotifier{
  OtherBloc({required super.screen, required super.appProvider});

 // OtherBloc({required super.baseScreen, required super.provider});

   functions() async{
    showLoading(true);
     Future.delayed(const Duration(seconds: 5), () {
      showLoading(false);
    });
}
}