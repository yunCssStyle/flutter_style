class CommonModel {
  int id = 0;
  String name = '';
  String? renderName = '';
  int listOrder = 0;
  List<CommonModel> children = [];

  CommonModel({
    required this.id,
    required this.name,
    this.renderName = '',
    required this.listOrder,
    required this.children,
  });

  CommonModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    renderName = json['renderName'] ?? '';
    listOrder = json['listOrder'];
    List list = json['children'] ?? [];
    for (var element in list) {
      children.add(CommonModel.fromJson(element));
    }
  }
  @override
  String toString() {
    return 'CommonModel{id: $id, name: $name, renderName: $renderName,listOrder: $listOrder, children: ${children.length}}';
  }
}
