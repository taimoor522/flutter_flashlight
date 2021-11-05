part of 'flash_cubit.dart';

@immutable
abstract class FlashState {
  String status = "OFF";
}

class FlashOffState extends FlashState {
  @override
  String status = "OFF";
}

class FlashOnState extends FlashState {
  @override
  String status = "ON";
}
