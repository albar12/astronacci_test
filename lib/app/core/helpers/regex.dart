/// File ini digunakan untuk melakukan validasi menggunakan regex 
/// sifat nya general dan tidak terbatas pada domain email saja
/// semua regex akan disimpan di dalam file ini
bool isValidEmail(String email) {
  // Regular expression for validating an Email with .com and .id domains
  RegExp emailRegex = RegExp(r'^.*@.*\.(com|id)$');
  return emailRegex.hasMatch(email);
}
