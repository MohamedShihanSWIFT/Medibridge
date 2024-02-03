import SwiftUI
import FirebaseFirestoreSwift
import Firebase

struct ConditionsPageView: View {
    @State private var isShowingLogin = false
    @State private var agreementAccepted: Bool = false
    let viewModel = FirebaseViewModel1()

    private func storeDataInFirebase() {
        guard agreementAccepted else { return }
        let newData = UserAgreement(title: "User Agreement", description: "/agreementAccepted")
        viewModel.addData(item: newData)
    }


    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.91, green: 0.98, blue: 0.99).edgesIgnoringSafeArea(.all)

                
                VStack(spacing: 20) {
                    Text("MediBridge is the app which focuses on helping refugees all over the world by providing medical attention.")
                        .font(.custom("SF Pro Text", size: 20))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .frame(width: 385, height: 117)
                        .offset(y: -25)
                    
                    Image("phone").resizable().aspectRatio(contentMode: .fill).frame(width: 187, height: 149)
                        .clipped().cornerRadius(30).offset(y: -30)
                    
                    Text("Logging Actions in the app when you complete them in real life.")
                        .font(.custom("Poppins", size: 20))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black).frame(width: 300, height: 46)
                        .offset(y: -40)
                    
                    Divider().background(Color.black).frame(width: 405).offset(y: -55)
                    
                    Text("We take your privacy seriously").font(.custom("Nirmala UI", size: 18)).multilineTextAlignment(.center)
                        .foregroundColor(.black).frame(width: 384, height: 66).offset(y: -97)
                    
                    Text("See how your data is stored.").foregroundColor(.gray)
                        .font(.custom("Nirmala UI", size: 17.9)).multilineTextAlignment(.center)
                        .foregroundColor(.black).frame(width: 384, height: 66).offset(y: -162)
                    
                    Spacer()
                    
                    VStack(spacing: 20) {
                        Rectangle().foregroundColor(.white).frame(width: 197, height: 197)
                            .cornerRadius(30).offset(x: -95, y: -230)
                        
                        Text("We only collect necessary information").font(.custom("Playfair Display", size: 16.9))
                            .multilineTextAlignment(.center).foregroundColor(.black)
                            .frame(width: 248, height: 40).offset(x: -95, y: -300)
                        
                        Image("card").resizable().aspectRatio(contentMode: .fill)
                            .frame(width: 182, height: 122).clipped().cornerRadius(30)
                            .offset(x: -95, y: -488)
                    }
                }.padding(.top, 280)
                
                VStack {
                    Rectangle().foregroundColor(.white).frame(width: 197, height: 197).cornerRadius(30).offset(x: 109, y: 240)
                    Rectangle().foregroundColor(.clear).frame(width: 198, height: 152)
                        .background(Image("plane").resizable().aspectRatio(contentMode: .fill)
                        .frame(width: 158, height: 152).clipped()).cornerRadius(30).offset(x: 109, y: 45)
                    
                    Text("We don’t sell your information").font(Font.custom("Playfair Display", size: 17))
                        .multilineTextAlignment(.center).foregroundColor(.black)
                        .frame(width: 194, height: 100, alignment: .top).offset(x: 109, y: 24)
                }
                
                VStack {
                    Rectangle().foregroundColor(.white).frame(width: 197, height: 197).cornerRadius(30).offset(x: -90, y: 435)
                    Rectangle().foregroundColor(.clear).frame(width: 198, height: 142)
                        .background(Image("key").resizable().aspectRatio(contentMode: .fill)
                        .frame(width: 158, height: 152).clipped()).cornerRadius(30).offset(x: -80, y: 235)
                    
                    Text("Your information is stored securely").font(Font.custom("Playfair Display", size: 16.9))
                        .multilineTextAlignment(.center).foregroundColor(.black)
                        .frame(width: 194, height: 100, alignment: .top).offset(x: -112, y: 219)
                }
                
                NavigationLink(
                                  destination: SignInView(),
                                  isActive: $isShowingLogin,
                                  label: {
                                      Text("Agree & Continue").font(Font.custom("SF Pro Text", size: 19).weight(.heavy))
                                          .foregroundColor(.white).frame(width: 170, height: 50)
                                          .background(Color(red: 0, green: 0.54, blue: 0.47)).cornerRadius(15)
                                          .onTapGesture {
                                              agreementAccepted = true
                                              storeDataInFirebase()
                                          }
                                  }
                              ).offset(x: 102, y: 300)
                          }.navigationBarBackButtonHidden(true)
                          .navigationBarItems(leading: backButton)
                      }
                  }

                  private var backButton: some View {
                      Button(action: {
                          // Handle back action
                      }) {
                          HStack(spacing: 0) {
                              Image(systemName: "arrow.left")
                              Text("Back")
                          }.foregroundColor(.blue)
                      }
                  }
              }

              struct ConditionsPageView_Previews: PreviewProvider {
                  static var previews: some View {
                      ConditionsPageView()
                  }
              }
