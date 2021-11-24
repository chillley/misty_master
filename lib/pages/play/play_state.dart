import 'package:misty_master/model/vod_entity.dart';

class PlayState {
  late Vod_entity vod;

  PlayState() {
    ///Initialize variables
    vod = Vod_entity.fromJson({
      'vod_id': '1',
      'type_id': '1',
      'type_id_1': '1',
      'group_id': '1',
    });
  }
}
