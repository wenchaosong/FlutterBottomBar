class RadioData {
  String title;
  String value;
  String groupValue;
  Function(String value) onChanged;

  RadioData({
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });
}
