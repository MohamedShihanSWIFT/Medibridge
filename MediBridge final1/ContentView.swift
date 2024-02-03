//
//  ContentView.swift
//  MediBridge final1
//
//  Created by Sidrah Javed on 29/12/2023.
//

import SwiftUI
struct ContentView: View {
    @EnvironmentObject var viewModelLocator: viewModelLocator
    @StateObject var homePageViewModel = HomePageViewModel() // Initialize your view model
    var body: some View {
        NavigationStack {
            
            AuthenticationView()
        }
        ConditionsPageView()
                   .environmentObject(viewModelLocator)
        NavigationView {
            VStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 462.96295, height: 450)
                    .background(
                        Image("doc")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 400.0, height: 500.0)
                            .clipped()
                            .offset(y: 140)
                    )
                    .underline()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .frame(width: 391, height: 76, alignment: .center)
                    .offset(y: 100)
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 363, height: 509)
                    .background(Color(red: 0.83, green: 0.93, blue: 0.92))
                    .cornerRadius(30)
                    .offset(y: 360)
                
                Image("frame")
                    .resizable()
                    .foregroundColor(Color(red: 0.018, green: 0.379, blue: 0.328))
                    .frame(width: 50, height: 52)
                    .offset(y: 200)
                
                Text("Medibridge")
                    .underline()
                    .font(
                        Font.custom("Playfair Display", size: 40)
                            .weight(.bold)
                    )
                    .foregroundColor(.black)
                    .offset(y: -220)
                
                Image("idk")
                    .offset(x: -10, y: -5000)
                
                Text("Welcome to")
                    .font(
                        Font.custom("Playfair Display", size: 20)
                            .weight(.semibold)
                    )
                    .foregroundColor(Color(red: 0, green: 0, blue: 0))
                    .frame(width: 382, height: 22, alignment: .topLeading)
                    .offset(y: -390)
                
                Text("رعاية اللاجئين")
                    .font(
                        Font.custom("Playfair Display", size: 40)
                            .weight(.bold)
                    )
                    .underline()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .offset(y: -335)
                
               
                
                NavigationLink(
                    destination: ConditionsPageView(),
                    label: {
                        Text("Get Started")
                            .font(Font.custom("SF Pro Text", size: 17).weight(.semibold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .frame(width: 200, height: 50)
                            .background(Color(red: 0.01, green: 0.38, blue: 0.33))
                            .cornerRadius(15)
                    }
                )
                .offset(y: -200)
            }
          
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
