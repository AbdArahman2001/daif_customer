import 'package:daif_customer/data/model/response/place_model.dart';
import 'package:daif_customer/utill/assets_manager.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final List<String> categoriesIcons = [
    IconAssets.hotelIcon,
    IconAssets.apartmentIcon,
    IconAssets.officeIcon,
    IconAssets.stadiumIcon,
  ];

  final List<PlaceModel> popularPlaces = [
    PlaceModel(
        name: "Garden Chalet",
        image:
            "https://img.freepik.com/premium-photo/3d-rendering-large-modern-contemporary-house-wood-concrete_190619-1483.jpg?w=1060",
        address: "Gaza",
        isFavorite: true),
    PlaceModel(
        name: "Helal Stadium",
        image:
            "https://img.freepik.com/premium-photo/lights-night-football-stadium-3d-rendering_3544-1244.jpg?w=996",
        address: "Rafah",
        isFavorite: false),
    PlaceModel(
        name: "Castro Hotel",
        image:
            "https://img.freepik.com/free-photo/luxury-classic-modern-bedroom-suite-hotel_105762-1787.jpg?w=996&t=st=1675172359~exp=1675172959~hmac=fd10b84676cc4fa7b830d3f65d367067c267b60a297469a08ee18dffb0f4b747",
        address: "Khan-younes",
        isFavorite: true),
    PlaceModel(
        name: "Aslan Office",
        image:
            "https://as2.ftcdn.net/v2/jpg/03/84/55/29/1000_F_384552930_zPoe9zgmCF7qgt8fqSedcyJ6C6Ye3dFs.jpg",
        address: "Dear-Albalah",
        isFavorite: false),
  ];

  final List<PlaceModel> famousStadiums = [
    PlaceModel(
        name: "Al Wihda",
        image:
            "https://img.freepik.com/free-vector/gradient-football-field-background_23-2149013355.jpg?w=996&t=st=1675178384~exp=1675178984~hmac=00ab5c329eeb0fab3867d09ecd680d5cfa20c7a446d4a410691cae01578f497a",
        address: "Gaza",
        isFavorite: true),
    PlaceModel(
        name: "Gaza Sports",
        image:
            "https://img.freepik.com/premium-photo/golden-soccer-ball-grass_379858-13393.jpg?w=1380",
        address: "Rafah",
        isFavorite: false),
    PlaceModel(
        name: "Al Mashtal",
        image:
            "https://img.freepik.com/free-photo/soccer-players-action-professional-stadium_654080-1166.jpg?w=1060&t=st=1675178470~exp=1675179070~hmac=307ed748d545844d8bfe848abf5234f661e434eec1b1b069ee8da452e4cde002",
        address: "Khan-younes",
        isFavorite: true),
    PlaceModel(
        name: "Al Nujoom",
        image:
            "https://img.freepik.com/free-photo/ball-hitting-net_23-2147644566.jpg?w=996&t=st=1675178491~exp=1675179091~hmac=67d393c71ed52ce23408f8381e4ded8b7e0862e7e24915847adaabb46d674fcc",
        address: "Dear-Albalah",
        isFavorite: false),
  ];
  final List<PlaceModel> featuredApartments = [
    PlaceModel(
        name: "Al Mashtal",
        image:"https://img.freepik.com/premium-photo/3d-rendering-large-modern-contemporary-house-wood-concrete_190619-1484.jpg?w=1060",
        address: "Khan-younes",
        isFavorite: true),
    PlaceModel(
        name: "Al Nujoom",
        image:"https://img.freepik.com/free-photo/modern-apartment-architecture_1268-14696.jpg?w=996&t=st=1675185845~exp=1675186445~hmac=e76f743480c2cfd9f0fff57ba9cc368aaee18d6139492efafd3b3d159fc3e580",
        address: "Dear-Albalah",
        isFavorite: false),
  ];

  final List<PlaceModel> bestHotels = [
    PlaceModel(
        name: "Garden Hotel",
        image: "https://img.freepik.com/free-photo/modern-luxury-hotel-office-reception-lounge-with-meeting-room_105762-1772.jpg?w=996&t=st=1675185542~exp=1675186142~hmac=48628feeb313fb729bd400b11221c297cf6ecfa6d6868bd16e1eec1a0254d6c9",
        address: "Gaza",
        isFavorite: true,
        dayPrice: "220",
        nightPrice: "200"),
    PlaceModel(
        name: "Helal Hotel",
        image: "https://img.freepik.com/free-photo/modern-studio-apartment-design-with-bedroom-living-space_1262-12375.jpg?w=996&t=st=1675185636~exp=1675186236~hmac=03843783f204debe5f3f10db145ac5dcad7ba4e270dd18de89fb6688ddabf53f",
        address: "Rafah",
        isFavorite: false,
        dayPrice: "320",
        nightPrice: "360"),
    PlaceModel(
        name: "Castro Hotel",
        image: "https://img.freepik.com/free-photo/elegant-hotel-room-with-big-bed_1203-1494.jpg?w=996&t=st=1675185649~exp=1675186249~hmac=49aea9eec35d3aa9b5510107fa3b9710664a6f295de2d702f48d0ced24da6574",
        address: "Khan-younes",
        isFavorite: true,
        dayPrice: "400",
        nightPrice: "350"),
    PlaceModel(
        name: "Aslan Hotel",
        image: "https://img.freepik.com/free-photo/luxury-hotel-reception-hall-lounge-restaurant-with-high-ceiling_105762-1771.jpg?w=996&t=st=1675185668~exp=1675186268~hmac=5de75e05b5c96cf8fc893678354c38dcae084f5f8077897ed4112c5c664a2470",
        address: "Dear-Albalah",
        isFavorite: false,
        dayPrice: "120",
        nightPrice: "100"),
  ];
  final List<PlaceModel> featuredChalets = [
    PlaceModel(
        name: "Castro Chalet",
        image:
        "https://img.freepik.com/free-photo/beautiful-view-blue-lake-captured-from-inside-villa_181624-10734.jpg?w=996&t=st=1675172078~exp=1675172678~hmac=19a424babcfc5c894a47707c3adef6a2c0da5c391b9d9f55cbccf828a03cef62",
        address: "Khan-younes",
        isFavorite: true,
        dayPrice: "400",
        nightPrice: "350"),
    PlaceModel(
        name: "Aslan Chalet",
        image:
        "https://img.freepik.com/free-photo/stair-swimming-pool-beautiful-luxury-hotel-pool-resort_1339-5454.jpg?w=996&t=st=1675172072~exp=1675172672~hmac=b0c57a2b80ef7228fb4775f3112e6a4f0a566948c4f42f58c87c8922b62d771a",
        address: "Dear-Albalah",
        isFavorite: false,
        dayPrice: "120",
        nightPrice: "100"),
  ];
}
