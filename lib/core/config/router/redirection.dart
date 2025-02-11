part of 'router.dart';

typedef GoRouterRedirect = Future<String?>;
Future<bool> isAuthenticated() async {
  try {
    // final user =
    //     await container.read(authRepoLocalProviderProvider).getCurrentUser();
    // if (user.jwtToken != null) {
    //   return true;
    // }
    return true;
  } catch (e) {
    return false;
  }
}

GoRouterRedirect goRouterRedirect(
    BuildContext context, GoRouterState state) async {
  return null;
  // Check if the user is going to the login page
  final loggingIn = state.matchedLocation == '/login';
  final verifyingOtp = state.matchedLocation == '/verify-otp';

  if (verifyingOtp) {
    return null;
  }
  final authenticated = await isAuthenticated();
  // If the user is not logged in and not going to the login page, redirect to login
  if (!authenticated && !loggingIn) {
    return '/login';
  }

  // If the user is logged in and going to login page, redirect to home
  if (authenticated && loggingIn) {
    return '/';
  }

  // No redirection needed
  return null;
}
