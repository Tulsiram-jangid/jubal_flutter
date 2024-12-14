class ApiUrl {
  static const server = "https://dev.zidni.academy";
  static const apiKey = "AIzaSyCrHaPgAZDdrSPc0gfNEDRemGZrfcTt490";

  static const register = "${ApiUrl.server}/J0001/api/v1/registration"; //post
  static const login = "${ApiUrl.server}/J0001/api/v1/login";
  static const dashboard = "${ApiUrl.server}/J0002/api/v1/post/my-post";
  static const authCheck = "${ApiUrl.server}/J0001/api/v1/get-user"; //post
  static const validateToken = "${ApiUrl.server}/J0001/api/v1/auth-check"; //get
  static const createNewToken = "${ApiUrl.server}/J0001/api/v1/create-access"; //get
  static const uploadFile = "${ApiUrl.server}/J0001/api/v1/upload-image"; //post
  static const updateUser = "${ApiUrl.server}/J0001/api/v1/set-profile"; //put
  static const userService = "${ApiUrl.server}/J0001/api/v1/admin/get-service"; //get

  //change password
  static const changePassword = "${ApiUrl.server}/J0001/api/v1/change-password"; //post

  //Talents
  static const filterTalent = "${ApiUrl.server}/J0001/api/v1/filterSearch";
  static const searchTalent = "${ApiUrl.server}/J0001/api/v1/users/list?type=3";
  static const userDetail = "${ApiUrl.server}/J0001/api/v1/users/get";

  static const eventList = "${ApiUrl.server}/J0005/api/v1/event/list";
  static const eventDetail = "${ApiUrl.server}/J0005/api/v1/event";

  //for instrument
  static const instrumentList = "${ApiUrl.server}/J0003/api/v1/instruments/get";
  static const instrumentDetail = "${ApiUrl.server}/J0003/api/v1/instruments";

  //likes
  static const getPostLikes = "${ApiUrl.server}/J0002/api/v1/post/my-liked";

  //adress
  static const createAddress = "${ApiUrl.server}/J0001/api/v1/create-address";// post
  static const editAddress = "${ApiUrl.server}/J0001/api/v1/edit-address";// post
  static const getAddressList = "${ApiUrl.server}/J0001/api/v1/get-address";// get
  static const deleteAddress = "${ApiUrl.server}/J0001/api/v1/delete-address";// get
}