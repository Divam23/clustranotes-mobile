abstract final class AppRoutePaths {
  static const root = '/';
  
  //Auth
  static const login = '/login';
  static const signup = '/signup';
  static const forgotPassword = '/forgot-password';
  static const emailVerification = '/email-verification';
  static const splash = '/splash';
  static const forgotPasswordMail = '/reset-mail';
  static const backendAuthenticationFailed = '/auth-failed';
  
  //App
  static const home = '/home';
  static const explore = '/explore';
  static const upload = '/upload';
  static const library = '/library';
  static const profile = '/profile';
  
  //Note
  static const noteDetails = '/notes/:noteId';
  
  //Upload
  static const uploadFlow = '/upload/upload-flow';
  static const uploadProgress = '/upload/progress';
  
  //Not Found
  static const notFound = '/404';
}
