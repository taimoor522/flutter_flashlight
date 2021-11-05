import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:torch_controller/torch_controller.dart';

part 'flash_state.dart';

class FlashCubit extends Cubit<FlashState> {
  final _flashController = TorchController();
  final _audioPlayer = AudioCache();

  bool _flashOn = false;

  FlashCubit() : super(FlashOffState());

  void toggleFlash() async {
    _flashOn = (await _flashController.toggle())!;
    _audioPlayer.play("click.mp3");
    emit(_flashOn ? FlashOnState() : FlashOffState());
  }
}
