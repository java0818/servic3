import 'package:flutter/material.dart';
import 'package:servic3/model/emplist_model.dart';
import '../serveces/http_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  get data => null;
  void _apiPostList(){
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) =>{
      // ignore: avoid_print
      print(response!),
      _showResponse(response),
    });
  }
  void _showResponse(String? response){
    EmpList emplist = Network.parseEmpList(response!);
    print(emplist.data.last);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiPostList();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}
