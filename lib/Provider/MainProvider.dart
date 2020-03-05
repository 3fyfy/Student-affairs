import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MainProvider with ChangeNotifier{

  int _indexGrid=-1;

  int  indexGrid(){
   return _indexGrid;
  }
  void Increase(){
    _indexGrid+=1;

  }
List<bool> _flag=[false,false,false,false];
  bool  flag(int idx){
   return _flag[idx];
  }

  void setflag(int idx){
    _flag[idx]=!_flag[idx];
  }


}