
import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/user_provider.dart';
import 'package:flutter_provider/screens/base_screen.dart';
import 'package:flutter_provider/screens/second_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State createState() => _MainScreenState();
}

class _MainScreenState extends BaseScreen<MainScreen> {
  String news ='';
  @override
  Widget build(BuildContext context) {
    // todo cach 1:
    // if(ProviderController(context: context).getUserUpdated()Provider.of<UserBloc>(context);){
    //   //_init();// todo bị loop
    //   userId =ProviderController(context: context).getUserID();
    // }
    // todo cach 2:
    // if(ProviderController(context: context).getUserID().isNotEmpty){
    //   //userId =userProvider.getUserId;
    //   userId =ProviderController(context: context).getUserID();
    // }
    // todo cach 3
    userProvider =Provider.of<UserProvider>(context);// todo
    if(userProvider.getUserId.isNotEmpty){
      //log('userProvider.getUserId ${userProvider.getUserId}');
      userId =userProvider.getUserId;
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Main'),),
      body: _viewContent(),
    );
  }
  Widget _viewContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('Hi $userId'),
          const SizedBox(height: 20,),
          InkWell(
            onTap: () {
              userBloc.saveIdUSer();
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('save'),
            ),
          ),
          const SizedBox(height: 20,),
          InkWell(
            onTap: (){
              addScreen(SecondScreen(userId: userId,));
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('detail'),
            ),
          ),
          const SizedBox(height: 20,),
          Text(news)
        ],
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    if(userBloc.getUserId()!.isNotEmpty){
      setState(() {
        userId =userBloc.getUserId()!;
      });
    }
    userBloc.getNews().then((value) {
      if(value.isNotEmpty){
        setState(() {
          news =value.toString();
        });
      }
    });
  }

}