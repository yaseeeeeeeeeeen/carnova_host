class HostUrl {
  // Local Host Postman[system]
  // static const String baseUrlH = "http://localhost:3000";

  // url with my ipaddress for usb debugging
  static const String baseUrl = "http://10.0.13.118:3000";
  static const String baseUrlHost = "$baseUrl/host";
  static const String signUpHost = "$baseUrlHost/signup";
  static const String verifyOtpHost = "$baseUrlHost/verify-otp";
  static const String hostLogin = "$baseUrlHost/login";
  static const String getHostData = "$baseUrlHost/host-details";
  static const String addVehicle = "$baseUrlHost/add-vehicle";
  static const String addProfile = "$baseUrlHost/upload-profile";
  static const String updateProfile = "$baseUrlHost/update-host";
  static const String fetchVehicles = "$baseUrlHost/host-vehicles";
}
