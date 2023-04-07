import 'package:daif_customer/data/model/response/category_model.dart';
import 'package:daif_customer/data/model/response/stadium_model.dart';
import 'package:daif_customer/utill/assets_manager.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {

  final List<String> placeServices =["restaurant","free_wifi","swimming_bool","parking","restaurant"];
  final String dummyDetails =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simplydummy text of the printing.";
  final List<String> placeImages = [
    "https://img.freepik.com/free-vector/gradient-football-field-background_23-2149013355.jpg?w=996&t=st=1675283497~exp=1675284097~hmac=c32ccdd7f14980294b12546347203f9b4b504917eebad05c49c1d6393d31e736",
    "https://img.freepik.com/premium-photo/soccer-field-spotlight-background-stadium_46250-1363.jpg?w=1060"
  ];
  final List<StadiumModel> stadiums = [
    StadiumModel(
        name: "Unity Stadium",
        image:
            "https://img.freepik.com/free-vector/gradient-football-field-background_23-2149013355.jpg?w=996&t=st=1675283497~exp=16"
            "75284097~hmac=c32ccdd7f14980294b12546347203f9b4b504917eebad05c49c1d6393d31e736",
        address: "Gaza",
        ground: "Tiles",
        isFavorite: true),
    StadiumModel(
        name: "Rafah Sports",
        image:
            "https://img.freepik.com/free-photo/american-football-american-football-player-professional-sport-stadium_654080-362.jpg?t=st=1675283489~exp=1675284089~hmac=53a13d4e986991c977fd3f74fe25defcb70266710fb83327b19d05cc99d7c944",
        address: "Rafah",
        ground: "Herb",
        isFavorite: false),
    StadiumModel(
        name: "Al Mashtal",
        image:
            "https://img.freepik.com/premium-photo/soccer-field-spotlight-background-stadium_46250-1363.jpg?w=1060",
        address: "Gaza",
        ground: "Tiles",
        isFavorite: false),
    StadiumModel(
        name: "Gaza Sports",
        image:
            "https://img.freepik.com/free-photo/soccer-players-action-professional-stadium_654080-1232.jpg?w=1060&t=st=1675283549~exp=1675284149~hmac=5a464c246e9be4e3a74e6d14d08c2a1ca0969a4e3a8fabe9d4fdd28bf0d8d45c",
        address: "Khan-younes",
        ground: "Tiles",
        isFavorite: false),
    StadiumModel(
        name: "Unity Stadium",
        image:
            "https://img.freepik.com/free-photo/soccer-players-action-professional-stadium_654080-1194.jpg?w=1060&t=st=1675283608~exp=1675284208~hmac=f30e1002346945399f36147df411d4125362c598debd47b763615ad5a124ee55",
        address: "Gaza",
        ground: "Herb",
        isFavorite: true),
    // StadiumModel(
    //     name: "Rafah Sports",
    //     image:
    //         "https://img.freepik.com/free-vector/gradient-football-field-background_23-2149011658.jpg?w=996&t=st=1675283647~exp=1675284247~hmac=a3fc3d62fa608dbc6d96f6f6a2fbca635b0e3c59fe2fd8845554bd9ef86443b9",
    //     address: "Rafah",
    //     ground: "Tiles",
    //     isFavorite: true),
    // StadiumModel(
    //     name: "Al Mashtal",
    //     image:
    //         "https://img.freepik.com/premium-photo/soccer-field-spotlight-background-stadium_46250-1363.jpg?w=1060",
    //     address: "Gaza",
    //     ground: "Tiles",
    //     isFavorite: false),
    // StadiumModel(
    //     name: "Gaza Sports",
    //     image:
    //         "https://img.freepik.com/free-photo/soccer-players-action-professional-stadium_654080-1232.jpg?w=1060&t=st=1675283549~exp=1675284149~hmac=5a464c246e9be4e3a74e6d14d08c2a1ca0969a4e3a8fabe9d4fdd28bf0d8d45c",
    //     address: "Gaza",
    //     ground: "Herb",
    //     isFavorite: true),
  ];
  final List<String> categoriesImages = [
    ImageAssets.apartmentsCategory,
    ImageAssets.hotelsCategory,
    ImageAssets.stadiumCategory,
    ImageAssets.chaletsCategory,
    ImageAssets.officesCategory,
  ];
}
