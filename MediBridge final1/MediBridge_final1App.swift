import UIKit
import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore


class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}



@main
struct MediBridge_final1App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
           // Ensure Firebase is configured before any other initialization
           FirebaseApp.configure()
       }
    
    let homePageViewModel = HomePageViewModel()

    @State private var isShowingAlert = false
    @State private var alertMessage = ""
    @ObservedObject private var firebaseViewModel = FirebaseViewModel() // Replace with your actual ViewModel type

    var body: some Scene {
          WindowGroup {
              NavigationView {
                  AuthenticationView()
                      .navigationBarHidden(true)  // Optionally hide the navigation bar
              }
              HomePageView(viewModel: homePageViewModel)
              NavigationView {
                  ProfileView(firebaseViewModel: firebaseViewModel, isShowingAlert: $isShowingAlert, alertMessage: $alertMessage)
              }

              ContentView()
                  .environmentObject(viewModelLocator.shared)
          }
      }
  }
