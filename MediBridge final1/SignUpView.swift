import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var isShowingLogin = false
    @State private var isValidEmail: Bool = true
    @State private var isValidPassword: Bool = true
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color(red: 0, green: 0.54, blue: 0.47)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("**Sign Up**")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.top, 40)
                    .offset(y: -130)
                
                HStack {
                    TextField(" First Name", text: $firstName)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .padding(.horizontal, 30)
                        .offset(x: 50, y: -100)
                    
                    ZStack {
                        Rectangle()
                            .cornerRadius(12)
                            .foregroundColor(Color(red: 0.51, green: 0.84, blue: 0.79))
                            .frame(width: 54, height: 54)
                            .offset(x: -300, y: -100)
                        
                        Image(systemName: "person.fill")
                            .foregroundColor(.black)
                            .frame(width: 35, height: 35)
                            .offset(x: -300, y: -100)
                    }
                }
                
                HStack {
                    TextField(" Last Name", text: $lastName)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .padding(.horizontal, 30)
                        .offset(x: 50, y: -100)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(Color(red: 0.51, green: 0.84, blue: 0.79))
                            .frame(width: 54, height: 54)
                            .offset(x: -300, y: -100)
                        
                        Image(systemName: "person.fill")
                            .frame(width: 35, height: 35)
                            .offset(x: -300, y: -100)
                    }
                }
                
                HStack {
                    TextField(" Email Address", text: $email, onEditingChanged: { isEditing in
                        if !isEditing {
                            isValidEmail = isValid(email: email)
                        }
                    })
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .padding(.horizontal, 30)
                        .offset(x: 50, y: -100)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(Color(red: 0.51, green: 0.84, blue: 0.79))
                            .frame(width: 54, height: 54)
                            .offset(x: -300, y: -100)
                        
                        Image("Frame 1")
                            .frame(width: 25, height: 25)
                            .offset(x: -300, y: -100)
                    }
                }
                
                HStack {
                    SecureField(" Password", text: $password, onCommit: {
                        isValidPassword = isValidPassword(password)
                    })
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .padding(.horizontal, 30)
                    .offset(x: 50, y: -100)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(Color(red: 0.51, green: 0.84, blue: 0.79))
                            .frame(width: 54, height: 54)
                            .offset(x: -300, y: -100)
                        
                        Image("Frame2")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .offset(x: -300, y: -100)
                    }
                }
                
                NavigationLink(
                    destination: HomePageView(viewModel: HomePageViewModel()), // replace with your actual instance of HomePageViewModel
                    isActive: $isShowingLogin,
                    label: {
                        Button(action: {
                            registerUser()
                        }) {
                            Text("Sign Up")
                                .fontWeight(.black)
                                .padding(15)
                                .font(.custom("Poppins", size: 20))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .background(Color.black)
                                .cornerRadius(12)
                                .frame(width: 350)
                        }
                    }
                )
                .disabled(!isValidEmail || !isValidPassword || email.isEmpty || password.isEmpty)
                .offset(y: -50)
            }
            .offset(y: -10)
            .padding(.top, 20)
        }
        .navigationBarItems(leading: backButton)
        .navigationBarBackButtonHidden(true)
    }
    
    private var backButton: some View {
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
    
    private func isValid(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    private func isValidPassword(_ password: String) -> Bool {
        return password.count >= 8 && password.rangeOfCharacter(from: .uppercaseLetters) != nil && password.rangeOfCharacter(from: .lowercaseLetters) != nil && password.rangeOfCharacter(from: .decimalDigits) != nil
    }
    
    private func registerUser() {
        guard isValidEmail, isValidPassword else {
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error creating user: \(error.localizedDescription)")
            } else {
                print("User registered successfully!")
                isShowingLogin = true
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

