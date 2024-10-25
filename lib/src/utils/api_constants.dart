class ApiUrlConstants {
  static const String baseUrl = 'https://localhost:7030';
  static const String loginController = '/api/Login'; 
  static const String usersController = '/api/User'; 
  static const String propertyController = '/api/Property'; 
  static const String parkingController = '/api/Parking'; 
  static const String apartmentController = '/api/Apartment'; 
  static const String imageController = '/api/Image'; 
  static const String masterDataController = '/api/MasterData'; 
  static const String image01 = '$baseUrl/PropertyImages/house01.jpeg'; 
  static const String image02 = '$baseUrl/PropertyImages/house02.jpeg'; 
}

//LOGIN
class ApiPostLoginConstants {
  static const String login = ApiUrlConstants.baseUrl + ApiUrlConstants.loginController;
}

//USER
class ApiPostUserConstants {
  static const String newUser = ApiUrlConstants.baseUrl + ApiUrlConstants.usersController;
  static const String all = "${ ApiUrlConstants.baseUrl + ApiUrlConstants.usersController }/all";
  static const String fullName = "${ ApiUrlConstants.baseUrl + ApiUrlConstants.usersController }/FullName";
}
class ApiGetUserConstants {
  static const String allUserNoPag = ApiUrlConstants.baseUrl + ApiUrlConstants.usersController;
  static String byId(int idUSer) => "${ ApiUrlConstants.baseUrl + ApiUrlConstants.usersController }/$idUSer";
  static const String idUserLoged = "${ ApiUrlConstants.baseUrl + ApiUrlConstants.usersController }/GetUserLoggedId";
  static String byEmail(String email) => "${ ApiUrlConstants.baseUrl + ApiUrlConstants.usersController }/email/$email";
  static String fullNameById(int idUSer) => "${ ApiUrlConstants.baseUrl + ApiUrlConstants.usersController }/$idUSer/FullName";
  static String idByEmail(String email) => "${ ApiUrlConstants.baseUrl + ApiUrlConstants.usersController }/$email/Id";
}
class ApiPutUserConstants {
  static String udpateById(int idUSer) => "${ ApiUrlConstants.baseUrl + ApiUrlConstants.usersController }/$idUSer";
}
class ApiPatchUserConstants {
  static const String changePasword = "${ ApiUrlConstants.baseUrl + ApiUrlConstants.usersController }/ChangePasword";
  static const String forgotPassword = "${ ApiUrlConstants.baseUrl + ApiUrlConstants.usersController }/ForgotPassword";
}

//PROPERTY
class ApiGetPropertyConstants {
  static const String allPropertyNoPag = ApiUrlConstants.baseUrl + ApiUrlConstants.propertyController;
  static String byId(int idUSer) => "${ ApiUrlConstants.baseUrl + ApiUrlConstants.propertyController }/$idUSer";
  static String byIdUser(int idUSer) => "${ ApiUrlConstants.baseUrl + ApiUrlConstants.propertyController }/user/$idUSer";
  static String search(String query) => "${ ApiUrlConstants.baseUrl + ApiUrlConstants.propertyController }/search/$query";
}
class ApiPostPropertyConstants {
  static const String newProperty = ApiUrlConstants.baseUrl + ApiUrlConstants.propertyController;
  static const String allPropertyNoPag = "${ ApiUrlConstants.baseUrl + ApiUrlConstants.propertyController }/all";
}
class ApiPutPropertyConstants {
  static String udpateById(int idUSer) => "${ ApiUrlConstants.baseUrl + ApiUrlConstants.propertyController }/$idUSer";
}
class ApiDeletePropertyConstants {
  static String delete(int idUSer) => "${ ApiUrlConstants.baseUrl + ApiUrlConstants.propertyController }/$idUSer";
}

//APARTMENT
class ApiGetApartmentConstants {
  static const String allApartmentNoPag = ApiUrlConstants.baseUrl + ApiUrlConstants.apartmentController;
  static String byId(int id) => "${ ApiUrlConstants.baseUrl + ApiUrlConstants.apartmentController }/$id";
  static String byIdProperty(int idProperty) => "${ ApiUrlConstants.baseUrl + ApiUrlConstants.apartmentController }/bypropertyid/$idProperty";
}
class ApiPostApartmentConstants {
  static const String newApartment = ApiUrlConstants.baseUrl + ApiUrlConstants.apartmentController;
  static const String allProperty = "${ ApiUrlConstants.baseUrl + ApiUrlConstants.apartmentController }/all";
}
class ApiPutApartmentConstants {
  static String udpateById(int idUSer) => "${ ApiUrlConstants.baseUrl + ApiUrlConstants.apartmentController }/$idUSer";
}
class ApiDeleteApartmentConstants {
  static String delete(int idUSer) => "${ ApiUrlConstants.baseUrl + ApiUrlConstants.apartmentController }/$idUSer";
}

//PARKING
class ApiGetParkingConstants {
  static const String allParkingNoPag = ApiUrlConstants.baseUrl + ApiUrlConstants.parkingController;
  static String byId(int idUSer) => "${ ApiUrlConstants.baseUrl + ApiUrlConstants.parkingController }/$idUSer";
}
class ApiPostParkingConstants {
  static const String newParking = ApiUrlConstants.baseUrl + ApiUrlConstants.parkingController;
  // static const String allParking = "${ ApiUrlConstants.baseUrl + ApiUrlConstants.parkingController }/Parking/all";
}
class ApiPutParkingConstants {
  static String udpateById(int idUSer) => "${ ApiUrlConstants.baseUrl + ApiUrlConstants.parkingController }/$idUSer";
}
class ApiDeleteParkingConstants {
  static String delete(int idUSer) => "${ ApiUrlConstants.baseUrl + ApiUrlConstants.parkingController }/$idUSer";
}

//LOCALIZATION
class ApiGetLocalizationConstants {
  static const String allParkingNoPag = ApiUrlConstants.baseUrl + ApiUrlConstants.parkingController;
  static String byId(String address) => "${ ApiUrlConstants.baseUrl + ApiUrlConstants.parkingController }/$address";
}
class ApiPostLocalizationConstants {
  static const String newLocalization = ApiUrlConstants.baseUrl + ApiUrlConstants.parkingController;
}

//IMAGE
class ApiPostImageConstants {
  static const String newImage = ApiUrlConstants.baseUrl + ApiUrlConstants.imageController;
  static String byPropertyId(int idProperty) => "${ ApiUrlConstants.baseUrl + ApiUrlConstants.imageController }/byProperty/$idProperty";
  }

//MASTER DATA
class ApiGetMasterDataConstants {
  static String byCityId(int idCity) => "${ ApiUrlConstants.baseUrl + ApiUrlConstants.masterDataController }/ getCity/$idCity";
  static String byProvinceId(int idProvince) => "${ ApiUrlConstants.baseUrl + ApiUrlConstants.masterDataController }/getProvince/$idProvince";
}