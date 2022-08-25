import 'package:flutter/material.dart';
import 'package:flutter_provider/screens/base_screen.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends BaseScreen<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ThirdScreen'),),
      body: const Center(child: Text('ok'),),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }
  _getData()async{
    await userBloc.getNews();
  }
}
