/// type_id : 1
/// type_name : "电影"
/// type_en : "fenlei1"
/// type_sort : 1
/// type_mid : 1
/// type_pid : 0
/// type_status : 1
/// type_tpl : "type.html"
/// type_tpl_list : "show.html"
/// type_tpl_detail : "detail.html"
/// type_tpl_play : "play.html"
/// type_tpl_down : "down.html"
/// type_key : ""
/// type_des : ""
/// type_title : ""
/// type_union : ""
/// type_extend : "{\"class\":\"\\u559c\\u5267,\\u7231\\u60c5,\\u6050\\u6016,\\u52a8\\u4f5c,\\u79d1\\u5e7b,\\u5267\\u60c5,\\u6218\\u4e89,\\u8b66\\u532a,\\u72af\\u7f6a,\\u52a8\\u753b,\\u5947\\u5e7b,\\u6b66\\u4fa0,\\u5192\\u9669,\\u67aa\\u6218,\\u6050\\u6016,\\u60ac\\u7591,\\u60ca\\u609a,\\u7ecf\\u5178,\\u9752\\u6625,\\u6587\\u827a,\\u5fae\\u7535\\u5f71,\\u53e4\\u88c5,\\u5386\\u53f2,\\u8fd0\\u52a8,\\u519c\\u6751,\\u513f\\u7ae5,\\u7f51\\u7edc\\u7535\\u5f71\",\"area\":\"\\u5927\\u9646,\\u9999\\u6e2f,\\u53f0\\u6e7e,\\u7f8e\\u56fd,\\u6cd5\\u56fd,\\u82f1\\u56fd,\\u65e5\\u672c,\\u97e9\\u56fd,\\u5fb7\\u56fd,\\u6cf0\\u56fd,\\u5370\\u5ea6,\\u610f\\u5927\\u5229,\\u897f\\u73ed\\u7259,\\u52a0\\u62ff\\u5927,\\u5176\\u4ed6\",\"lang\":\"\\u56fd\\u8bed,\\u82f1\\u8bed,\\u7ca4\\u8bed,\\u95fd\\u5357\\u8bed,\\u97e9\\u8bed,\\u65e5\\u8bed,\\u6cd5\\u8bed,\\u5fb7\\u8bed,\\u5176\\u5b83\",\"year\":\"2021,2020,2019,2018,2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000\",\"star\":\"\\u738b\\u5b9d\\u5f3a,\\u9ec4\\u6e24,\\u5468\\u8fc5,\\u5468\\u51ac\\u96e8,\\u8303\\u51b0\\u51b0,\\u9648\\u5b66\\u51ac,\\u9648\\u4f1f\\u9706,\\u90ed\\u91c7\\u6d01,\\u9093\\u8d85,\\u6210\\u9f99,\\u845b\\u4f18,\\u6797\\u6b63\\u82f1,\\u5f20\\u5bb6\\u8f89,\\u6881\\u671d\\u4f1f,\\u5f90\\u5ce5,\\u90d1\\u607a,\\u5434\\u5f66\\u7956,\\u5218\\u5fb7\\u534e,\\u5468\\u661f\\u9a70,\\u6797\\u9752\\u971e,\\u5468\\u6da6\\u53d1,\\u674e\\u8fde\\u6770,\\u7504\\u5b50\\u4e39,\\u53e4\\u5929\\u4e50,\\u6d2a\\u91d1\\u5b9d,\\u59da\\u6668,\\u502a\\u59ae,\\u9ec4\\u6653\\u660e,\\u5f6d\\u4e8e\\u664f,\\u6c64\\u552f,\\u9648\\u5c0f\\u6625\",\"director\":\"\\u51af\\u5c0f\\u521a,\\u5f20\\u827a\\u8c0b,\\u5434\\u5b87\\u68ee,\\u9648\\u51ef\\u6b4c,\\u5f90\\u514b,\\u738b\\u5bb6\\u536b,\\u59dc\\u6587,\\u5468\\u661f\\u9a70,\\u674e\\u5b89\",\"state\":\"\\u6b63\\u7247,\\u9884\\u544a\\u7247,\\u82b1\\u7d6e\",\"version\":\"\\u9ad8\\u6e05\\u7248,\\u5267\\u573a\\u7248,\\u62a2\\u5148\\u7248,OVA,TV,\\u5f71\\u9662\\u7248\"}"
/// type_logo : ""
/// type_pic : ""
/// type_jumpurl : ""

class Type_entity {
  Type_entity({
      int? typeId, 
      String? typeName, 
      String? typeEn, 
      int? typeSort, 
      int? typeMid, 
      int? typePid, 
      int? typeStatus, 
      String? typeTpl, 
      String? typeTplList, 
      String? typeTplDetail, 
      String? typeTplPlay, 
      String? typeTplDown, 
      String? typeKey, 
      String? typeDes, 
      String? typeTitle, 
      String? typeUnion, 
      String? typeExtend, 
      String? typeLogo, 
      String? typePic, 
      String? typeJumpurl,}){
    _typeId = typeId;
    _typeName = typeName;
    _typeEn = typeEn;
    _typeSort = typeSort;
    _typeMid = typeMid;
    _typePid = typePid;
    _typeStatus = typeStatus;
    _typeTpl = typeTpl;
    _typeTplList = typeTplList;
    _typeTplDetail = typeTplDetail;
    _typeTplPlay = typeTplPlay;
    _typeTplDown = typeTplDown;
    _typeKey = typeKey;
    _typeDes = typeDes;
    _typeTitle = typeTitle;
    _typeUnion = typeUnion;
    _typeExtend = typeExtend;
    _typeLogo = typeLogo;
    _typePic = typePic;
    _typeJumpurl = typeJumpurl;
}

  Type_entity.fromJson(dynamic json) {
    _typeId = json['type_id'];
    _typeName = json['type_name'];
    _typeEn = json['type_en'];
    _typeSort = json['type_sort'];
    _typeMid = json['type_mid'];
    _typePid = json['type_pid'];
    _typeStatus = json['type_status'];
    _typeTpl = json['type_tpl'];
    _typeTplList = json['type_tpl_list'];
    _typeTplDetail = json['type_tpl_detail'];
    _typeTplPlay = json['type_tpl_play'];
    _typeTplDown = json['type_tpl_down'];
    _typeKey = json['type_key'];
    _typeDes = json['type_des'];
    _typeTitle = json['type_title'];
    _typeUnion = json['type_union'];
    _typeExtend = json['type_extend'];
    _typeLogo = json['type_logo'];
    _typePic = json['type_pic'];
    _typeJumpurl = json['type_jumpurl'];
  }
  int? _typeId;
  String? _typeName;
  String? _typeEn;
  int? _typeSort;
  int? _typeMid;
  int? _typePid;
  int? _typeStatus;
  String? _typeTpl;
  String? _typeTplList;
  String? _typeTplDetail;
  String? _typeTplPlay;
  String? _typeTplDown;
  String? _typeKey;
  String? _typeDes;
  String? _typeTitle;
  String? _typeUnion;
  String? _typeExtend;
  String? _typeLogo;
  String? _typePic;
  String? _typeJumpurl;

  int? get typeId => _typeId;
  String? get typeName => _typeName;
  String? get typeEn => _typeEn;
  int? get typeSort => _typeSort;
  int? get typeMid => _typeMid;
  int? get typePid => _typePid;
  int? get typeStatus => _typeStatus;
  String? get typeTpl => _typeTpl;
  String? get typeTplList => _typeTplList;
  String? get typeTplDetail => _typeTplDetail;
  String? get typeTplPlay => _typeTplPlay;
  String? get typeTplDown => _typeTplDown;
  String? get typeKey => _typeKey;
  String? get typeDes => _typeDes;
  String? get typeTitle => _typeTitle;
  String? get typeUnion => _typeUnion;
  String? get typeExtend => _typeExtend;
  String? get typeLogo => _typeLogo;
  String? get typePic => _typePic;
  String? get typeJumpurl => _typeJumpurl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type_id'] = _typeId;
    map['type_name'] = _typeName;
    map['type_en'] = _typeEn;
    map['type_sort'] = _typeSort;
    map['type_mid'] = _typeMid;
    map['type_pid'] = _typePid;
    map['type_status'] = _typeStatus;
    map['type_tpl'] = _typeTpl;
    map['type_tpl_list'] = _typeTplList;
    map['type_tpl_detail'] = _typeTplDetail;
    map['type_tpl_play'] = _typeTplPlay;
    map['type_tpl_down'] = _typeTplDown;
    map['type_key'] = _typeKey;
    map['type_des'] = _typeDes;
    map['type_title'] = _typeTitle;
    map['type_union'] = _typeUnion;
    map['type_extend'] = _typeExtend;
    map['type_logo'] = _typeLogo;
    map['type_pic'] = _typePic;
    map['type_jumpurl'] = _typeJumpurl;
    return map;
  }

}