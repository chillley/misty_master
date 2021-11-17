isNullText(String? text) {
  return (text ?? '').isEmpty ? '未知' : text ?? '';
}
