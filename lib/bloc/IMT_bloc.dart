import 'dart:async';

import 'package:bloc/bloc.dart';

class BeratBloc{

  int _berat = 0;

  StreamController _beratController = StreamController();
  StreamSink get beratInput => _beratController.sink;

  StreamController _outberatController = StreamController();
  StreamSink get beratOutput => _outberatController.sink;

  Stream get beratOut => _outberatController.stream;

  BeratBloc() {
    _beratController.stream.listen((event) {
      if(event == 1) {
        _berat++;
      }
      else if (event == 2){
        _berat--;
      }

      beratOutput.add(_berat);
    });

    
  }
  void dispose() {
    _beratController.close();
    _outberatController.close();
  }
}