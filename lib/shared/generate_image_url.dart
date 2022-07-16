const domain = "https://jdmall.itying.com/";

typedef FnGenerateImageUrl = String Function(String url);
FnGenerateImageUrl generateImageUrl = (String url) {
  String result = url.replaceAll("\\", "/");
  String imageUrl = "$domain$result";
  return imageUrl;
};
