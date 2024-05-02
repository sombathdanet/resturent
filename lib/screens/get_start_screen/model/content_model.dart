
import '../../../../constants/image_constant.dart';

class UnbordingContent {
  final image;
  final title;
  final discription;

  UnbordingContent({this.image, this.title, this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Diverse selection of foods!',
      image: ImageConstant.cardIcon,
      discription: "Our restaurant serves a wide "
          "Variety of cuisines "),
  UnbordingContent(
      title: 'Use the app to reserve your favourites seat.',
      image: ImageConstant.imgAirplane,
      discription: "Select a date and reserve a seat in"
          "the restaurant "),
  UnbordingContent(
      title: 'Home delivery',
      image: ImageConstant.imgAirplane,
      discription: "We provider a contact-free home"
          "delivery service "),
];
