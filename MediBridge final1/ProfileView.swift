import SwiftUI
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase
import Foundation

struct AccountSettingsView: View {
    @ObservedObject private var firebaseViewModel = FirebaseViewModel()
    @State private var isShowingAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            ProfileView(firebaseViewModel: firebaseViewModel, isShowingAlert: $isShowingAlert, alertMessage: $alertMessage)
                .alert(isPresented: $isShowingAlert) {
                    Alert(
                        title: Text("Account Deletion"),
                        message: Text(alertMessage),
                        dismissButton: .default(Text("OK"))
                    )
                }
        }
    }
}

struct ProfileView: View {
    @State private var showingBottomSheet = false
    @State private var isDarkModeEnabled = false
    @State private var isArabicLanguage = false
    @State private var isContentView = false
    
    @ObservedObject private var firebaseViewModel: FirebaseViewModel
    @Binding var isShowingAlert: Bool
    @Binding var alertMessage: String
    
    init(firebaseViewModel: FirebaseViewModel, isShowingAlert: Binding<Bool>, alertMessage: Binding<String>) {
        self._firebaseViewModel = ObservedObject(initialValue: firebaseViewModel)
        self._isShowingAlert = isShowingAlert
        self._alertMessage = alertMessage
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("Rectangle 17")
                    .resizable()
                    .frame(width: 350, height: 439)
                    .background(Color(red: 0, green: 0.54, blue: 0.47).opacity(0.81))
                    .shadow(color: Color.black.opacity(0.3), radius: 2, x: 0, y: 4)
                    .overlay(Rectangle().stroke(Color.black, lineWidth: 1))
                    .offset(x: 0, y: 100)
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 393, height: 89)
                    .background(Color(red: 0.51, green: 0.84, blue: 0.79))
                    .cornerRadius(12)
                    .offset(x: 0, y: 410)
                
                Text(isArabicLanguage ? "تعديل الاسم" : "Edit Name")
                    .font(Font.custom("Poppins", size: 16).weight(.semibold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.black.opacity(1.5))
                    .frame(width: 203, height: 28, alignment: .top)
                    .bold()
                    .offset(x: -90, y: -40)
                
                Name()
                    .offset(x: -90, y: -20)
                
                NavigationLink(
                    destination: SignInView(),
                    isActive: $isContentView,
                    label: {
                        Text(isArabicLanguage ? "تسجيل الخروج" : "Logout")
                            .font(Font.custom("Poppins", size: 20).weight(.semibold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.96, green: 0.07, blue: 0.07))
                            .frame(width: 203, height: 28, alignment: .top)
                            .bold()
                            .offset(x: -90, y: 260)
                    })
                
                NavigationLink(
                    destination: SignInView(),
                    isActive: $isContentView,
                    label: {
                        VStack {
                            Text(isArabicLanguage ? "تسجيل الخروج" : "Logout")
                                .font(Font.custom("Poppins", size: 20).weight(.semibold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.96, green: 0.07, blue: 0.07))
                                .bold()
                            
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 50, height: 50)
                                .background(
                                    Image("logout")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 50, height: 50)
                                )
                        }
                        .onTapGesture {
                            isContentView = true
                        }
                        .frame(width: 203, height: 78)
                        .offset(x: -90, y: 260)
                    }
                )
                
            }
            .cornerRadius(50)
            .offset(x: 95, y: 260)
            
            Button(action: {
                       firebaseViewModel.deleteAccount { result in
                           switch result {
                           case .success:
                               isShowingAlert = true
                               alertMessage = "Account deleted successfully."
                           case .failure(let error):
                               isShowingAlert = true
                               alertMessage = "Error deleting account: \(error.localizedDescription)"
                           }
                       }
                   }) {
                       Text("Delete Account")
                           .foregroundColor(.red)
                   }
                   .offset(x: 0, y: 260)
            
            EditableProfilePictureView()
                .offset(x: 0, y: -210)
            
            Faq()
                .offset(x: 200, y: 200)
            
            Button(action: { isDarkModeEnabled.toggle() }) {
                Text(isDarkModeEnabled ? "Disable Dark Mode" : "Enable Dark Mode")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .offset(x: 50, y: 110)
        }
        .preferredColorScheme(isDarkModeEnabled ? .dark : .light)
        .padding()
        
        LanguageButton(isArabicLanguage: $isArabicLanguage)
            .offset(x: 65, y: -230)
    }
}


struct EditableProfilePictureView: View {
    @State private var profileImage: Image?
    @State private var showImagePicker = false
    @State private var showCamera = false
    
    var body: some View {
        VStack {
            Button(action: { self.showImagePicker = true }) {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                }
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$profileImage, showImagePicker: self.$showImagePicker, showCamera: self.$showCamera)
        }
        .actionSheet(isPresented: $showCamera) {
            ActionSheet(title: Text("Take a picture"), buttons: [
                .default(Text("Camera"), action: {
                    self.showImagePicker = true
                    self.showCamera = false
                }),
                .default(Text("Photo Library"), action: {
                    self.showImagePicker = true
                    self.showCamera = false
                }),
                .cancel()
            ])
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: Image?
    @Binding var showImagePicker: Bool
    @Binding var showCamera: Bool
    
    func makeCoordinator() -> ImagePickerCoordinator {
        ImagePickerCoordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    class ImagePickerCoordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = Image(uiImage: uiImage)
            }
            parent.showImagePicker = false
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.showImagePicker = false
        }
    }
}

struct Name: View {
    @State private var enteredText: String = ""
    @State private var savedText: String = ""
    @State private var isSheetPresented: Bool = false
    
    var body: some View {
        VStack {
            Button(action: { isSheetPresented.toggle() }) {
                Text("Edit name")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .offset(x: 170 , y: -20)
            .sheet(isPresented: $isSheetPresented) {
                VStack {
                    TextField("Enter Text", text: $enteredText)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    
                    
                    Button(action: { saveText(); isSheetPresented.toggle() }) {
                        Text("Save")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
            
            VStack {
                if !savedText.isEmpty {
                    Text(savedText)
                        .padding(.horizontal, 20)
                        .cornerRadius(10)
                        .opacity(savedText.isEmpty ? 0 : 1)
                        .offset(x: 0, y: 100)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .offset(x: 90, y: -250)
                        .bold()
                }
            }
        }
    }
    
    func saveText() {
        savedText = enteredText
    }
}

struct Faq: View {
    struct QuestionAnswer: Identifiable {
        let id = UUID()
        let question: String
        let answer: String
    }
    
    let faqData = [
        QuestionAnswer(question: "What is the function of this app?", answer: "Medibridge is used to provide healthcare features to refugees around the world."),
        QuestionAnswer(question: "How do you edit your name in the app?", answer: "Go to the Profile page, then click on 'Edit name'. After you're done, click 'Save'."),
        QuestionAnswer(question: "Is Medibridge only available for iOS?", answer: "No, Medibridge is available for iOS and macOS.")
        // Add more question-answer pairs here
    ]
    
    @State private var showFAQSheet = false
    
    var body: some View {
        VStack {
            Button(action: { self.showFAQSheet.toggle() }) {
                Text("FAQ")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .frame(width: 100, height: 40)
            .offset(x: -100, y: -20)
            .sheet(isPresented: $showFAQSheet) {
                FAQ(faqData: self.faqData)
            }
        }
    }
}

struct FAQ: View {
    let faqData: [Faq.QuestionAnswer]
    
    var body: some View {
        NavigationView {
            List(faqData) { faq in
                VStack(alignment: .leading, spacing: 4) {
                    Text(faq.question)
                        .font(.headline)
                    Text(faq.answer)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical)
            }
            .navigationBarTitle("FAQ")
        }
    }
}

struct LanguageButton: View {
    @Binding var isArabicLanguage: Bool
    
    var body: some View {
        Button(action: { isArabicLanguage.toggle() }) {
            Text(isArabicLanguage ? "تغيير اللغة إلى الإنجليزية" : "English to عربي")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        VStack {
            Text(isArabicLanguage ? "تغيير اللغة إلى الإنجليزية" : "English -> عربي")
                .offset(x : -140, y : -50)
        }
    }
}

class FirebaseViewModel: ObservableObject {
    private var db = Firestore.firestore()

    func deleteAccount(completion: @escaping (Result<Void, Error>) -> Void) {
        guard let currentUserID = Auth.auth().currentUser?.uid else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Current user not found"])))
            return
        }

        // Delete user data from Firestore
        db.collection("users").document(currentUserID).delete { error in
            if let error = error {
                completion(.failure(error))
                return
            }

            // Delete user account from Firebase Authentication
            Auth.auth().currentUser?.delete { error in
                if let error = error {
                    completion(.failure(error))
                    return
                }

                // Both Firestore data and Firebase Authentication deleted successfully
                completion(.success(()))
            }
        }
    }
}

struct AccountSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingsView()
    }
}
