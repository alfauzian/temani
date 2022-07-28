import 'package:flutter/material.dart';


// ignore: camel_case_types
class chatPageModel{

  String ChatContent;
  String chatType;
  String chatKondisi;

  chatPageModel({ required this.ChatContent, required this.chatType,  required this.chatKondisi});
}

List<chatPageModel> chat = [

  chatPageModel(ChatContent: "Hallo bunda, apakah kamu sedang memiliki kandungan ?", chatType: "chatBot", chatKondisi:""),
  chatPageModel(ChatContent: "Apakah bunda yakin memiliki sedang mengandung ?", chatType: "chatBot", chatKondisi:"true"),
  chatPageModel(ChatContent: "Bunda, mohon untuk cek kehamilan anda", chatType: "chatBot", chatKondisi: "false"),
  chatPageModel(ChatContent: "Berapa Minggu usia kehamilan bunda ?", chatType: "chatBot", chatKondisi: "false"),

];
