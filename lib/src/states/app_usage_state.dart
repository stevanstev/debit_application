import 'package:equatable/equatable.dart';

abstract class AppUsageState extends Equatable {}

class GetImagesIndexState extends AppUsageState {
  final int currentIndex;

  List<String> images = [
    'usage1.png',
    'usage2.png',
    'usage3.png',
    'usage4.png'
  ];

  GetImagesIndexState({this.currentIndex});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
