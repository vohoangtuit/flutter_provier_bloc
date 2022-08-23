
import 'package:flutter/material.dart';
import 'package:flutter_provider/bloc/user_bloc.dart';
import 'package:flutter_provider/screens/base_screen.dart';
import 'package:flutter_provider/screens/second_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State createState() => _MainScreenState();
}

class _MainScreenState extends BaseScreen<MainScreen> {
  //String id = '';
  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<UserBloc>(context);
    // if(userProvider.userId.isNotEmpty){
    //   userId =userProvider.userId;
    // }
    return Scaffold(
      appBar: AppBar(title: const Text('Main'),),
      body: _viewContent(),
    );
  }
  Widget _viewContent() {
    return Column(
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
           // Navigator.push(context, MaterialPageRoute(builder: (context)=> SecondScreen(userId: userId,)));
            addScreen(SecondScreen(userId: userId,));
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('detail'),
          ),
        )
      ],
    );
  }
  @override
  void initState() {
    super.initState();
   // _init();
  }

  _init() async {
    if(userBloc.getUserId()!.isNotEmpty){
      setState(() {
        userId =userBloc.getUserId()!;
      });
    }
  }
}