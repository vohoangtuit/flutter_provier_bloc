import 'package:flutter/material.dart';
import 'package:flutter_provider/bloc/user_bloc.dart';
import 'package:flutter_provider/screens/base_screen.dart';
import 'package:flutter_provider/screens/third_screen.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatefulWidget {
   String userId;
   SecondScreen({Key? key, required this.userId}) : super(key: key);
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends BaseScreen<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserBloc>(context);
    if(userProvider.userId.isNotEmpty){
      userId =userProvider.userId;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: _viewDetail(),
    );
  }

  Widget _viewDetail() {
    return Column(
      children: [
        const SizedBox(height: 20,),
        Text(userId),
        const SizedBox(height: 20,),
        InkWell(
          onTap: () {
            userBloc.saveIdUSer();
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('update'),
          ),
        ),
        const SizedBox(height: 20,),
        InkWell(
          onTap: () {
         addScreen(const ThirdScreen());
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('next screen'),
          ),
        ),
      ],

    );
  }
}
