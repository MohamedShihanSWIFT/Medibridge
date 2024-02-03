import SwiftUI
import Firebase

final class SignInEmailViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isValidEmail: Bool = true
    @Published var isValidPassword: Bool = true
    @Environment(\.presentationMode) var presentationMode
    
    func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }

        // Use Task to perform asynchronous operations
        Task {
            do {
                // Assuming `AuthenticationManager.shared.createUser` performs user authentication
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                print("Success!")
                print(returnedUserData)
                // Dismiss the view after successful authentication
                self.presentationMode.wrappedValue.dismiss()
            } catch {
                print("Error: \(error)")
            }
        }
    }
}

struct SignInView: View {
    @StateObject private var viewModel = SignInEmailViewModel()

        var body: some View {
            ZStack {
                Color(red: 0, green: 0.54, blue: 0.47)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .font(.custom("SF Pro Text", size: 32))
                        .fontWeight(.black)
                        .foregroundColor(.black)
                        .padding(.top, 100)
                        .offset(y: -20)
                    
                    TextField("Email...", text: $viewModel.email)
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
                    .offset(x: 18, y: -157)
                    
                    SecureField("Password...", text: $viewModel.password)
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
                    .offset(x: 18, y: -80)
                    .overlay(
                        HStack {
                            Spacer()
                            Button(action: {
                                // Toggle password visibility
                            }) {
                                Image(systemName: "eye")
                                    .foregroundColor(.white)
                            }
                            .padding(.trailing, 20)
                        }
                    )
                    
                    Button {
                        viewModel.signIn()
                    }label: {
                        Text("Log in →")
                            .font(.custom("SF Pro Text", size: 22))
                            .padding(.horizontal, 100)
                            .padding(.vertical, 15)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                            .background(Color(red: 0, green: 0.03, blue: 0.03))
                            .cornerRadius(12)
                        
                    }
                    
                    
                    
                    .offset(y: 50)
                    
                    Text("Forgot Password?")
                        .font(Font.custom("SF Pro Text", size: 16))
                        .underline()
                        .foregroundColor(Color(red: 0, green: 0, blue: 0))
                        .offset(y: 60)
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 154, height: 1)
                        .background(.black)
                        .offset(x: 110, y: 75)
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 154, height: 1)
                        .background(.black)
                        .offset(x: -110, y: 55)
                    
                    Text("OR")
                        .font(.title2)
                        .font(Font.custom("SF Pro Text", size: 16).weight(.bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0, green: 0, blue: 0))
                        .offset(y: 20)
                    
                    NavigationLink(
                        destination: SignUpView(),
                        label: {
                            Text("Sign Up →")
                                .font(.custom("SF Pro Text", size: 22))
                                .padding(.horizontal, 95)
                                .padding(.vertical, 13)
                                .fontWeight(.black)
                                .foregroundColor(.black)
                                .background(.white)
                                .cornerRadius(12)
                        })
                    .offset(y: 40)
                    
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButtonView())
        }
        
        
        private func isValid(email: String) -> Bool {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            return emailPredicate.evaluate(with: email)
        }
        
        private func isValidPassword(_ password: String) -> Bool {
            return password.count >= 8 && password.rangeOfCharacter(from: .uppercaseLetters) != nil && password.rangeOfCharacter(from: .lowercaseLetters) != nil && password.rangeOfCharacter(from: .decimalDigits) != nil
        }
    }
    
struct BackButtonView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack(spacing: 0) {
                Image(systemName: "arrow.left")
                Text("Back")
            }
            .foregroundColor(.white)
        }
    }
}
    

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SignInView()
        }
    }
}
