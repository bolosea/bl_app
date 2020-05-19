class Category{
  int id;
  int isNav;
  int sort;
  String url;
  String name;
  int level;
  int parentId;
  String parentUrl;
  int createTime;
  int updateTime;
  List children;

  Category.fromJson(Map<String, dynamic> json):name = json['name'],id = json['id'],isNav=json['isNav'],
  sort=json['sort'],url=json['url'],level=json['level'],parentId=json['parentId'],parentUrl=json['parentUrl'],
  createTime=json['createTime'],updateTime=json['updateTime'],children=json['children'];
}