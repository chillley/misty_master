import 'dart:convert';

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class Vod_entity {
  Vod_entity({
    required this.vodId,
    required this.typeId,
    required this.typeId1,
    required this.groupId,
    this.vodName,
    this.vodSub,
    this.vodEn,
    this.vodStatus,
    this.vodLetter,
    this.vodColor,
    this.vodTag,
    this.vodClass,
    this.vodPic,
    this.vodPicThumb,
    this.vodPicSlide,
    this.vodPicScreenshot,
    this.vodActor,
    this.vodDirector,
    this.vodWriter,
    this.vodBehind,
    this.vodBlurb,
    this.vodRemarks,
    this.vodPubdate,
    this.vodTotal,
    this.vodSerial,
    this.vodTv,
    this.vodWeekday,
    this.vodArea,
    this.vodLang,
    this.vodYear,
    this.vodVersion,
    this.vodState,
    this.vodAuthor,
    this.vodJumpurl,
    this.vodTpl,
    this.vodTplPlay,
    this.vodTplDown,
    this.vodIsend,
    this.vodLock,
    this.vodLevel,
    this.vodCopyright,
    this.vodPoints,
    this.vodPointsPlay,
    this.vodPointsDown,
    this.vodHits,
    this.vodHitsDay,
    this.vodHitsWeek,
    this.vodHitsMonth,
    this.vodDuration,
    this.vodUp,
    this.vodDown,
    this.vodScore,
    this.vodScoreAll,
    this.vodScoreNum,
    this.vodTime,
    this.vodTimeAdd,
    this.vodTimeHits,
    this.vodTimeMake,
    this.vodTrysee,
    this.vodDoubanId,
    this.vodDoubanScore,
    this.vodReurl,
    this.vodRelVod,
    this.vodRelArt,
    this.vodPwd,
    this.vodPwdUrl,
    this.vodPwdPlay,
    this.vodPwdPlayUrl,
    this.vodPwdDown,
    this.vodPwdDownUrl,
    this.vodContent,
    this.vodPlayFrom,
    this.vodPlayServer,
    this.vodPlayNote,
    this.vodPlayUrl,
    this.vodDownFrom,
    this.vodDownServer,
    this.vodDownNote,
    this.vodDownUrl,
    this.vodPlot,
    this.vodPlotName,
    this.vodPlotDetail,
  });

  factory Vod_entity.fromJson(Map<String, dynamic> jsonRes) => Vod_entity(
    vodId: asT<int>(jsonRes['vod_id'])!,
    typeId: asT<int>(jsonRes['type_id'])!,
    typeId1: asT<int>(jsonRes['type_id_1'])!,
    groupId: asT<int>(jsonRes['group_id'])!,
    vodName: asT<String?>(jsonRes['vod_name']),
    vodSub: asT<String?>(jsonRes['vod_sub']),
    vodEn: asT<String?>(jsonRes['vod_en']),
    vodStatus: asT<int?>(jsonRes['vod_status']),
    vodLetter: asT<String?>(jsonRes['vod_letter']),
    vodColor: asT<String?>(jsonRes['vod_color']),
    vodTag: asT<String?>(jsonRes['vod_tag']),
    vodClass: asT<String?>(jsonRes['vod_class']),
    vodPic: asT<String?>(jsonRes['vod_pic']),
    vodPicThumb: asT<String?>(jsonRes['vod_pic_thumb']),
    vodPicSlide: asT<String?>(jsonRes['vod_pic_slide']),
    vodPicScreenshot: asT<String?>(jsonRes['vod_pic_screenshot']),
    vodActor: asT<String?>(jsonRes['vod_actor']),
    vodDirector: asT<String?>(jsonRes['vod_director']),
    vodWriter: asT<String?>(jsonRes['vod_writer']),
    vodBehind: asT<String?>(jsonRes['vod_behind']),
    vodBlurb: asT<String?>(jsonRes['vod_blurb']),
    vodRemarks: asT<String?>(jsonRes['vod_remarks']),
    vodPubdate: asT<String?>(jsonRes['vod_pubdate']),
    vodTotal: asT<int?>(jsonRes['vod_total']),
    vodSerial: asT<String?>(jsonRes['vod_serial']),
    vodTv: asT<String?>(jsonRes['vod_tv']),
    vodWeekday: asT<String?>(jsonRes['vod_weekday']),
    vodArea: asT<String?>(jsonRes['vod_area']),
    vodLang: asT<String?>(jsonRes['vod_lang']),
    vodYear: asT<String?>(jsonRes['vod_year']),
    vodVersion: asT<String?>(jsonRes['vod_version']),
    vodState: asT<String?>(jsonRes['vod_state']),
    vodAuthor: asT<String?>(jsonRes['vod_author']),
    vodJumpurl: asT<String?>(jsonRes['vod_jumpurl']),
    vodTpl: asT<String?>(jsonRes['vod_tpl']),
    vodTplPlay: asT<String?>(jsonRes['vod_tpl_play']),
    vodTplDown: asT<String?>(jsonRes['vod_tpl_down']),
    vodIsend: asT<int?>(jsonRes['vod_isend']),
    vodLock: asT<int?>(jsonRes['vod_lock']),
    vodLevel: asT<int?>(jsonRes['vod_level']),
    vodCopyright: asT<int?>(jsonRes['vod_copyright']),
    vodPoints: asT<int?>(jsonRes['vod_points']),
    vodPointsPlay: asT<int?>(jsonRes['vod_points_play']),
    vodPointsDown: asT<int?>(jsonRes['vod_points_down']),
    vodHits: asT<int?>(jsonRes['vod_hits']),
    vodHitsDay: asT<int?>(jsonRes['vod_hits_day']),
    vodHitsWeek: asT<int?>(jsonRes['vod_hits_week']),
    vodHitsMonth: asT<int?>(jsonRes['vod_hits_month']),
    vodDuration: asT<String?>(jsonRes['vod_duration']),
    vodUp: asT<int?>(jsonRes['vod_up']),
    vodDown: asT<int?>(jsonRes['vod_down']),
    vodScore: asT<String?>(jsonRes['vod_score']),
    vodScoreAll: asT<int?>(jsonRes['vod_score_all']),
    vodScoreNum: asT<int?>(jsonRes['vod_score_num']),
    vodTime: asT<int?>(jsonRes['vod_time']),
    vodTimeAdd: asT<int?>(jsonRes['vod_time_add']),
    vodTimeHits: asT<int?>(jsonRes['vod_time_hits']),
    vodTimeMake: asT<int?>(jsonRes['vod_time_make']),
    vodTrysee: asT<int?>(jsonRes['vod_trysee']),
    vodDoubanId: asT<int?>(jsonRes['vod_douban_id']),
    vodDoubanScore: asT<String?>(jsonRes['vod_douban_score']),
    vodReurl: asT<String?>(jsonRes['vod_reurl']),
    vodRelVod: asT<String?>(jsonRes['vod_rel_vod']),
    vodRelArt: asT<String?>(jsonRes['vod_rel_art']),
    vodPwd: asT<String?>(jsonRes['vod_pwd']),
    vodPwdUrl: asT<String?>(jsonRes['vod_pwd_url']),
    vodPwdPlay: asT<String?>(jsonRes['vod_pwd_play']),
    vodPwdPlayUrl: asT<String?>(jsonRes['vod_pwd_play_url']),
    vodPwdDown: asT<String?>(jsonRes['vod_pwd_down']),
    vodPwdDownUrl: asT<String?>(jsonRes['vod_pwd_down_url']),
    vodContent: asT<String?>(jsonRes['vod_content']),
    vodPlayFrom: asT<String?>(jsonRes['vod_play_from']),
    vodPlayServer: asT<String?>(jsonRes['vod_play_server']),
    vodPlayNote: asT<String?>(jsonRes['vod_play_note']),
    vodPlayUrl: asT<String?>(jsonRes['vod_play_url']),
    vodDownFrom: asT<String?>(jsonRes['vod_down_from']),
    vodDownServer: asT<String?>(jsonRes['vod_down_server']),
    vodDownNote: asT<String?>(jsonRes['vod_down_note']),
    vodDownUrl: asT<String?>(jsonRes['vod_down_url']),
    vodPlot: asT<int?>(jsonRes['vod_plot']),
    vodPlotName: asT<String?>(jsonRes['vod_plot_name']),
    vodPlotDetail: asT<String?>(jsonRes['vod_plot_detail']),
  );

  int vodId;
  int typeId;
  int typeId1;
  int groupId;
  String? vodName;
  String? vodSub;
  String? vodEn;
  int? vodStatus;
  String? vodLetter;
  String? vodColor;
  String? vodTag;
  String? vodClass;
  String? vodPic;
  String? vodPicThumb;
  String? vodPicSlide;
  String? vodPicScreenshot;
  String? vodActor;
  String? vodDirector;
  String? vodWriter;
  String? vodBehind;
  String? vodBlurb;
  String? vodRemarks;
  String? vodPubdate;
  int? vodTotal;
  String? vodSerial;
  String? vodTv;
  String? vodWeekday;
  String? vodArea;
  String? vodLang;
  String? vodYear;
  String? vodVersion;
  String? vodState;
  String? vodAuthor;
  String? vodJumpurl;
  String? vodTpl;
  String? vodTplPlay;
  String? vodTplDown;
  int? vodIsend;
  int? vodLock;
  int? vodLevel;
  int? vodCopyright;
  int? vodPoints;
  int? vodPointsPlay;
  int? vodPointsDown;
  int? vodHits;
  int? vodHitsDay;
  int? vodHitsWeek;
  int? vodHitsMonth;
  String? vodDuration;
  int? vodUp;
  int? vodDown;
  String? vodScore;
  int? vodScoreAll;
  int? vodScoreNum;
  int? vodTime;
  int? vodTimeAdd;
  int? vodTimeHits;
  int? vodTimeMake;
  int? vodTrysee;
  int? vodDoubanId;
  String? vodDoubanScore;
  String? vodReurl;
  String? vodRelVod;
  String? vodRelArt;
  String? vodPwd;
  String? vodPwdUrl;
  String? vodPwdPlay;
  String? vodPwdPlayUrl;
  String? vodPwdDown;
  String? vodPwdDownUrl;
  String? vodContent;
  String? vodPlayFrom;
  String? vodPlayServer;
  String? vodPlayNote;
  String? vodPlayUrl;
  String? vodDownFrom;
  String? vodDownServer;
  String? vodDownNote;
  String? vodDownUrl;
  int? vodPlot;
  String? vodPlotName;
  String? vodPlotDetail;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'vod_id': vodId,
    'type_id': typeId,
    'type_id_1': typeId1,
    'group_id': groupId,
    'vod_name': vodName,
    'vod_sub': vodSub,
    'vod_en': vodEn,
    'vod_status': vodStatus,
    'vod_letter': vodLetter,
    'vod_color': vodColor,
    'vod_tag': vodTag,
    'vod_class': vodClass,
    'vod_pic': vodPic,
    'vod_pic_thumb': vodPicThumb,
    'vod_pic_slide': vodPicSlide,
    'vod_pic_screenshot': vodPicScreenshot,
    'vod_actor': vodActor,
    'vod_director': vodDirector,
    'vod_writer': vodWriter,
    'vod_behind': vodBehind,
    'vod_blurb': vodBlurb,
    'vod_remarks': vodRemarks,
    'vod_pubdate': vodPubdate,
    'vod_total': vodTotal,
    'vod_serial': vodSerial,
    'vod_tv': vodTv,
    'vod_weekday': vodWeekday,
    'vod_area': vodArea,
    'vod_lang': vodLang,
    'vod_year': vodYear,
    'vod_version': vodVersion,
    'vod_state': vodState,
    'vod_author': vodAuthor,
    'vod_jumpurl': vodJumpurl,
    'vod_tpl': vodTpl,
    'vod_tpl_play': vodTplPlay,
    'vod_tpl_down': vodTplDown,
    'vod_isend': vodIsend,
    'vod_lock': vodLock,
    'vod_level': vodLevel,
    'vod_copyright': vodCopyright,
    'vod_points': vodPoints,
    'vod_points_play': vodPointsPlay,
    'vod_points_down': vodPointsDown,
    'vod_hits': vodHits,
    'vod_hits_day': vodHitsDay,
    'vod_hits_week': vodHitsWeek,
    'vod_hits_month': vodHitsMonth,
    'vod_duration': vodDuration,
    'vod_up': vodUp,
    'vod_down': vodDown,
    'vod_score': vodScore,
    'vod_score_all': vodScoreAll,
    'vod_score_num': vodScoreNum,
    'vod_time': vodTime,
    'vod_time_add': vodTimeAdd,
    'vod_time_hits': vodTimeHits,
    'vod_time_make': vodTimeMake,
    'vod_trysee': vodTrysee,
    'vod_douban_id': vodDoubanId,
    'vod_douban_score': vodDoubanScore,
    'vod_reurl': vodReurl,
    'vod_rel_vod': vodRelVod,
    'vod_rel_art': vodRelArt,
    'vod_pwd': vodPwd,
    'vod_pwd_url': vodPwdUrl,
    'vod_pwd_play': vodPwdPlay,
    'vod_pwd_play_url': vodPwdPlayUrl,
    'vod_pwd_down': vodPwdDown,
    'vod_pwd_down_url': vodPwdDownUrl,
    'vod_content': vodContent,
    'vod_play_from': vodPlayFrom,
    'vod_play_server': vodPlayServer,
    'vod_play_note': vodPlayNote,
    'vod_play_url': vodPlayUrl,
    'vod_down_from': vodDownFrom,
    'vod_down_server': vodDownServer,
    'vod_down_note': vodDownNote,
    'vod_down_url': vodDownUrl,
    'vod_plot': vodPlot,
    'vod_plot_name': vodPlotName,
    'vod_plot_detail': vodPlotDetail,
  };
}
