
class ButtonData {
  final String name;
  final String description;
  final Function? action;
  final List<ButtonData> children;

  const ButtonData({
    required this.name,
    this.description = "",
    this.action,
    this.children = const [],
  });
}
