
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/base/loading_view.dart';
import 'package:flutter_provider/base/resume.dart';


abstract class GeneralScreen<T extends StatefulWidget> extends State<T> with WidgetsBindingObserver{
  String currentUrl = '';
  Resume resume =  Resume();
  bool _isPaused = false;
  LoadingView? loadingView;
  // todo check status screen
  void onResume() {}
  void onReady() {}
  void onPause() {}


  @override
  void initState() {

    super.initState();

    initAll();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      if (!_isPaused) {
        onPause();
      }
      //log('GeneralScreen paused');
    }
    if (state == AppLifecycleState.resumed) {
      //log('GeneralScreen resumed');
      if (!_isPaused) {
        onResume();
      }
    }
  }
  void initAll(){
    loadingView =LoadingView();
  }
  void disposeAll(){
    dismissLoading();
  }
  void dismissLoading() {
    if (loadingView != null) {
      loadingView!.hide();
    }
  }
  void showLoading(bool show) {
    loadingView ??= LoadingView();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(mounted){
        if (show) {
          loadingView!.show(context);
        } else {
          loadingView!.hide();
        }
      }
    });
  }

  showMessage(String message) {

  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    super.dispose();
  }
  String getNameScreenOpening(){
    return context.widget.toString();
  }
   log(String data){
    if (kDebugMode) {
      print('TChat::::: $data');
    }
  }
  // todo handle open screens
  addScreen(Widget screen, [String? source]) {
    _isPaused = true;
    onPause();
 //   log('${context.widget.toString()} onPause');
   // log('${screen.toString()} onReady');
    // Navigator.push(context, MaterialPageRoute(builder: (context) => screen));// todo old code
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen))
        .then((value) {
      _isPaused = false;
      resume.data = value;
      resume.source = source; // todo resume data
      onResume();
      if(mounted){
        //log('${context.widget.toString()} onResume');
      }
      return value;
    });
  }
  replaceScreen(Widget screen,[String? source]) {
    // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => screen), (Route<dynamic> route) => false);// todo old cod
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => screen), (Route<dynamic> route) => false).then((value)  {
      _isPaused = false;
      resume.data = value;
      resume.source = source; // todo resume data
      onResume();
      return value;
    });
  }

  // todo addScreen with name
  backToScreen() {
    if(mounted){
      Navigator.of(context).pop();
    }
  }

}