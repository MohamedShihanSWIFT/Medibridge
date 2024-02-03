import SwiftUI

class HomePageViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var search: String = ""

    // Add other properties and methods needed for your view

    // Example method to handle some logic
    func performSearch() {
        // Implement your search logic here
    }
}

struct HomePageView: View {
    @ObservedObject var viewModel: HomePageViewModel
    
    @State private var isAmbulancebuttonPressed = false
    @State private var isConsultationbuttonPressed = false
    @State private var isMedicinesbuttonPressed = false
    @State private var isDonationbuttonPressed = false
    @State private var HomeButtonPressedTab = false
    @State private var AppointmentButtonPressedTab = false
    @State private var HistoryButtonPressedTab = false
    @State private var ArticlesButtonPressedTab = false
    @State private var ProfileButtonPressedTab = false
    @State private var isShowingAlert = false
    @State private var alertMessage = ""
    @ObservedObject private var firebaseViewModel = FirebaseViewModel() // Replace with your actual ViewModel type
    
    init(viewModel: HomePageViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color(red: 0.91, green: 0.98, blue: 0.99)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ScrollView {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 47, height: 43)
                        .background(
                            Image("person 1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipped()
                        )
                        .cornerRadius(47)
                        .offset(x: -150, y: 15)
                    
                    Text("Hello 👋🏼")
                        .font(Font.custom("Poppins", size: 20))
                        .foregroundColor(.black.opacity(0.5))
                        .frame(width: 203, height: 28, alignment: .topLeading)
                        .offset(x: -18.5, y: -30)
                    
                    Text("\(viewModel.email)")
                    
                    TextField("Search", text: $viewModel.search)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 7)
                        .frame(width: 345, height: 46, alignment: .leading)
                        .background(Color(red: 0.46, green: 0.46, blue: 0.5).opacity(0.11))
                        .cornerRadius(10)
                        .offset(y: -40)
                    
                    Image(systemName: "magnifyingglass")
                        .offset(x: -150, y: -75)
                    
                    VStack {
                        Image("green")
                            .cornerRadius(27)
                            .offset(y: -25)
                        
                        Text("Medical Checks!")
                            .font(.title3)
                            .fontWeight(.bold)
                            .offset(x: -70, y: -179)
                            .foregroundColor(.black)
                        
                        Text("Check your health condition regularly to minimize the incidence of disease in the future")
                            .font(
                                Font.custom("Poppins", size: 16)
                                    .weight(.semibold)
                            )
                            .fontWeight(.bold)
                            .offset(x: -38, y: -185)
                            .foregroundColor(.black)
                            .frame(width: 203, height: 90, alignment: .topLeading)
                        
                        VStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 100, height: 100)
                                .background(
                                    Image("women")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 90, height: 90)
                                        .clipped()
                                )
                                .cornerRadius(100)
                                .offset(x: 110, y: -300)
                        }
                        
                        
                        // Home
                        VStack {
                            NavigationLink(
                                destination: HomePageView(viewModel: viewModel),
                                isActive: $HomeButtonPressedTab,
                                label: {
                                    Image(systemName: "house")
                                        .font(.system(size: 25))
                                        .foregroundColor((Color(red: 0, green: 0.54, blue: 0.47).opacity(0.71)))
                                })
                            .offset(x: -25, y: 355)
                            
                            NavigationLink(
                                destination: HomePageView(viewModel: viewModel),
                                isActive: $HomeButtonPressedTab,
                                label: {
                                    Text("Home")
                                        .fontWeight(.bold)
                                        .font(.system(size: 13))
                                        .foregroundColor(Color(red: 0.01, green: 0.38, blue: 0.33))
                                })
                            .offset(x: -25, y: 358)
                        }
                        
                        
                        //############################################
                        //Appointment
                        VStack {
                            NavigationLink(
                                destination: Home2View(viewModel: viewModel),
                                isActive: $AppointmentButtonPressedTab,
                                label: {
                                    Image(systemName: "calendar")
                                        .font(.system(size:26))
                                        .foregroundColor((Color(red: 0, green: 0.54, blue: 0.47).opacity(0.71)))
                                        .onTapGesture {
                                            AppointmentButtonPressedTab = true
                                        }
                                })
                            .offset(x: -15, y: 355)
                            
                            NavigationLink(
                                destination: Home2View(viewModel: viewModel),
                                isActive: $AppointmentButtonPressedTab,
                                label: {
                                    Text("Appointment")
                                        .fontWeight(.bold)
                                        .font(.system(size:13))
                                        .foregroundColor(Color(red: 0.01, green: 0.38, blue: 0.33))
                                        .onTapGesture {
                                            AppointmentButtonPressedTab = true
                                        }
                                })
                            .offset(x: -15, y: 359)
                        }
                        
                        
                        
                        
                        NavigationLink(
                            destination: MedicinesView(),
                            isActive: $isMedicinesbuttonPressed,
                            label: {
                                Text("Medicines")
                                    .font(Font.custom("Poppins", size: 16))
                                    .underline()
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color(red: 0, green: 0, blue: 0))
                            }
                        )
                        .offset(y: -218)
                        
                        Text("MediBridge Services")
                            .font(.title3)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(width: 203, height: 28, alignment: .top)
                            .offset(x: -60, y: -385)
                    }
                    
                    
                    NavigationLink(
                        destination: Home2View(viewModel: viewModel),
                        isActive: $AppointmentButtonPressedTab,
                        label: {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 90, height: 88)
                                .background(
                                    Image("homepagedoc1")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 101, height: 88)
                                        .clipped()
                                )
                        }
                    )
                    .cornerRadius(101)
                    .offset(x: -110, y: -380)
                    
                    NavigationLink(
                        destination: MedicinesView(),
                        isActive: $isMedicinesbuttonPressed,
                        label: {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 90, height: 88)
                                .background(
                                    Image("medicines")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 101, height: 88)
                                        .clipped()
                                )
                        }
                    )
                    .cornerRadius(101)
                    .offset(x: 0, y: -477)
                    
                    NavigationLink(
                        destination: UrgentCareView(),
                        isActive: $isAmbulancebuttonPressed,
                        label: {
                            Image("ambulance")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 106, height: 98)
                                .clipped()
                        }
                    )
                    .cornerRadius(101)
                    .offset(x: 110, y: -578)
                }
            }
        }
        .navigationBarHidden(true)
        
        VStack {
            NavigationLink(
                destination: DonationView(),
                isActive: $isDonationbuttonPressed,
                label: {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 555, height: 106)
                        .background(
                            Image("donationbox")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        )
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 4)
                })
            .offset(y: 270)
            
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 389, height: 90)
                .background(Color(red: 0, green: 0.54, blue: 0.47).opacity(0.4))
                .cornerRadius(12)
                .offset(y: 312)
        }
        
        HStack {
            // Home
            VStack {
                NavigationLink(
                    destination: HomePageView(viewModel: viewModel),
                    isActive: $HomeButtonPressedTab,
                    label: {
                        Image(systemName: "house")
                            .font(.system(size: 25))
                            .foregroundColor((Color(red: 0, green: 0.54, blue: 0.47).opacity(0.71)))
                    })
                .offset(x: -25, y: 355)
                
                NavigationLink(
                    destination: HomePageView(viewModel: viewModel),
                    isActive: $HomeButtonPressedTab,
                    label: {
                        Text("Home")
                            .fontWeight(.bold)
                            .font(.system(size: 13))
                            .foregroundColor(Color(red: 0.01, green: 0.38, blue: 0.33))
                    })
                .offset(x: -25, y: 358)
            }
            
            // Appointment
            VStack {
                NavigationLink(
                    destination: Home2View(viewModel: viewModel),
                    isActive: $AppointmentButtonPressedTab,
                    label: {
                        Image(systemName: "calendar")
                            .font(.system(size: 26))
                            .foregroundColor((Color(red: 0, green: 0.54, blue: 0.47).opacity(0.71)))
                    })
                .offset(x: -15, y: 355)
                
                NavigationLink(
                    destination: Home2View(viewModel: viewModel),
                    isActive: $AppointmentButtonPressedTab,
                    label: {
                        Text("Appointment")
                            .fontWeight(.bold)
                            .font(.system(size: 13))
                            .foregroundColor(Color(red: 0.01, green: 0.38, blue: 0.33))
                    })
                .offset(x: -15, y: 359)
            }
            
            // History
            VStack {
                NavigationLink(
                    destination: HomePageView(viewModel: viewModel),
                    isActive: $HistoryButtonPressedTab,
                    label: {
                        Image(systemName: "clock.arrow.circlepath")
                            .font(.system(size: 26))
                            .foregroundColor((Color(red: 0, green: 0.54, blue: 0.47).opacity(0.71)))
                    })
                .offset(x: -5, y: 355)
                
                NavigationLink(
                    destination: Home2View(viewModel: viewModel),
                    isActive: $HistoryButtonPressedTab,
                    label: {
                        Text("History")
                            .fontWeight(.bold)
                            .font(.system(size: 13))
                            .foregroundColor(Color(red: 0.01, green: 0.38, blue: 0.33))
                    })
                .offset(x: -5, y: 358)
            }
            
            // Articles
            VStack {
                NavigationLink(
                    destination: HomePageView(viewModel: viewModel),
                    isActive: $ArticlesButtonPressedTab,
                    label: {
                        Image(systemName: "text.book.closed")
                            .font(.system(size: 26))
                            .foregroundColor((Color(red: 0, green: 0.54, blue: 0.47).opacity(0.71)))
                    })
                .offset(x: 10, y: 355)
                
                NavigationLink(
                    destination: HomePageView(viewModel: viewModel),
                    isActive: $ArticlesButtonPressedTab,
                    label: {
                        Text("Articles")
                            .fontWeight(.bold)
                            .font(.system(size: 13))
                            .foregroundColor(Color(red: 0.01, green: 0.38, blue: 0.33))
                    })
                .offset(x: 10, y: 358)
            }
            VStack{
                NavigationView {
                    NavigationLink(
                        destination: ProfileView(firebaseViewModel: firebaseViewModel, isShowingAlert: $isShowingAlert, alertMessage: $alertMessage),
                        isActive: $ProfileButtonPressedTab,
                        label: {
                            Image(systemName: "person")
                                .font(.system(size: 26))
                                .foregroundColor((Color(red: 0, green: 0.54, blue: 0.47).opacity(0.71)))
                        })
                    .offset(x: 20, y: 355)
                    
                    NavigationLink(
                        destination: ProfileView(firebaseViewModel: firebaseViewModel, isShowingAlert: $isShowingAlert, alertMessage: $alertMessage), // Use the correct parameter here
                        isActive: $ProfileButtonPressedTab,
                        label: {
                            Text("Profile")
                                .fontWeight(.bold)
                                .font(.system(size: 13))
                                .foregroundColor(Color(red: 0.01, green: 0.38, blue: 0.33))
                        })
                    .offset(x: 20, y: 358)
                }
                
            }
        }
    }
    
}
