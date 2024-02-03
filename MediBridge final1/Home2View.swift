//
//  Home2View.swift
//  MediBridge final1
//
//  Created by Sidrah Javed on 29/12/2023.
//

import SwiftUI

struct Home2View: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isCallView = false
    @State private var isVcallView = false
    @State private var isChatView = false
    @ObservedObject var viewModel: HomePageViewModel
    
    init(viewModel: HomePageViewModel) {
           self.viewModel = viewModel
       }
    
    var body: some View {
        
        ZStack{
            
            Color(red: 0.91, green: 0.98, blue: 0.99)
                .edgesIgnoringSafeArea(.all)
                .offset()
            //Header
            
            Text("**My Appointments**")
                .font(
                    Font.custom("Poppins", size: 20)
                        .weight(.black)
                )
                .foregroundColor(.black)
                .frame(width: 203, height: 28, alignment: .topLeading)
                .offset(x:25,y:-350)
            
            Image("Frame")
                .frame(width: 24, height: 24)
                .offset(x:150,y: -351)
            
            Image("Ellipse 5")
                .frame(width: 24, height: 24)
                .offset(x:-160,y:-350)
            
            //First Rectangle (Yellow one)
            ZStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 47, height: 43)
                    .cornerRadius(47)
                    .offset(x:-160,y:-90)
                
                    .frame(width: 330, height: 160)
                    .background(
                        Image("Rectangle 9")
                    )
                    .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 4)
                    .overlay(
                        Rectangle()
                            .stroke(.black, lineWidth: 0)
                    )
                    .cornerRadius(27)
                    .offset(y:-190)
                
                //Image Icon
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 100, height: 100)
                    .background(
                        Image("women")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipped()
                    )
                    .cornerRadius(100)
                    .offset(x: -110,y:-190)
                
                //Name
                Text("**Dr.Mahum**")
                    .font(
                        Font.custom("Poppins", size: 16)
                            .weight(.semibold)
                    )
                    .foregroundColor(.black)
                    .frame(width: 203, height: 90, alignment: .topLeading)
                    .offset(x:50,y:-180)
                //We have to cahnge it to a button from image "call"
                
                
                
                //Go to next page - Call Icon
                NavigationLink(
                    destination: CallView(),
                    isActive: $isCallView,
                    label: {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 50, height: 50)
                            .background(
                                Image("Ellipse 9")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .clipped()
                                    .onTapGesture {
                                        isCallView = true
                                    }
                            )
                    }
                )
                .offset(x:-30,y:-160)
                
                
                //Chat Icon
                NavigationLink(
                    destination: ChatView(),
                    isActive: $isChatView,
                    label: {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 50, height: 50)
                            .background(
                                Image("chat")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .clipped()
                                    .onTapGesture {
                                        isChatView = true
                                        
                                    }
                            )
                    }
                )
                .cornerRadius(50)
                .offset(x:35,y:-160)
                
                //Video Icon
                NavigationLink(
                    destination: VcallView(),
                    isActive: $isVcallView,
                    label: {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 50, height: 50)
                            .background(
                                Image("vcall")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .clipped()
                                    .onTapGesture {
                                        isVcallView = true
                                        
                                    }
                            )
                    }
                )
                .cornerRadius(50)
                .offset(x: 100, y:-160)
                
            }
            //##################################################################
            //Second Rectangle (Green one)
            
            ZStack{
                Rectangle()
                
                    .foregroundColor(.clear)
                    .frame(width: 47, height: 43)
                    .cornerRadius(47)
                    .offset(x:-160,y:-90)
                
                    .frame(width: 330, height: 160)
                    .background(
                        Image("Rectangle 9-2")
                    )
                    .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 4)
                    .overlay(
                        Rectangle()
                            .stroke(.black, lineWidth: 0)
                    )
                    .cornerRadius(27)
                
                //Image Icon
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 100, height: 100)
                    .background(
                        Image("person2")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipped()
                    )
                    .cornerRadius(100)
                    .offset(x: -110)
                
                //Name
                Text("**Dr.Yousef**")
                    .font(
                        Font.custom("Poppins", size: 16)
                            .weight(.semibold)
                    )
                    .foregroundColor(.black)
                    .frame(width: 203, height: 90, alignment: .topLeading)
                    .offset(x:50)
                
                
                //Go to next page - Cal Icon
                NavigationLink(
                    destination: CallView(),
                    isActive: $isCallView,
                    label: {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 50, height: 50)
                            .background(
                                Image("Ellipse 9")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .clipped()
                                    .onTapGesture {
                                        isCallView = true
                                    }
                            )
                    }
                )
                .offset(x:-30,y:30)
                
                
                //Chat Icon
                NavigationLink(
                    destination: ChatView(),
                    isActive: $isChatView,
                    label: {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 50, height: 50)
                            .background(
                                Image("chat")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .clipped()
                                    .onTapGesture {
                                        isChatView = true
                                    }
                            )
                    }
                )
                .cornerRadius(50)
                .offset(x:35,y:30)
                
                //Video Icon
                NavigationLink(
                    destination: VcallView(),
                    isActive: $isVcallView,
                    label: {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 50, height: 50)
                            .background(
                                Image("vcall")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .clipped()
                                    .onTapGesture {
                                        isVcallView = true
                                        
                                    }
                            )
                    }
                )
                .cornerRadius(50)
                .offset(x: 100,y:30)
                
            }
            
            //##################################################################
            //Third Rectangle (Purple one)
            ZStack{
                Rectangle()
                
                    .foregroundColor(.clear)
                    .frame(width: 47, height: 43)
                    .cornerRadius(47)
                    .offset(x:-160,y:-90)
                
                    .frame(width: 330, height: 160)
                    .background(
                        Image("Rectangle 9")
                    )
                    .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 4)
                    .overlay(
                        Rectangle()
                            .stroke(.black, lineWidth: 0)
                    )
                    .cornerRadius(27)
                    .offset(y:190)
                
                
                //Image Icon
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 100, height: 100)
                    .background(
                        Image("person3")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipped()
                    )
                    .cornerRadius(100)
                    .offset(x: -110,y:190)
                
                //Name
                Text("**Dr.John**")
                    .font(
                        Font.custom("Poppins", size: 16)
                            .weight(.semibold)
                    )
                    .foregroundColor(.black)
                    .frame(width: 203, height: 90, alignment: .topLeading)
                    .offset(x:50,y:190)
                
                
                //Go to next page - Cal Icon
                NavigationLink(
                    destination: CallView(),
                    isActive: $isCallView,
                    label: {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 50, height: 50)
                            .background(
                                Image("Ellipse 9")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .clipped()
                                    .onTapGesture {
                                        isCallView = true
                                    }
                            )
                    }
                )
                .offset(x:-30,y:220)
                
                
                //Chat Icon
                NavigationLink(
                    destination: ChatView(),
                    isActive: $isChatView,
                    label: {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 50, height: 50)
                            .background(
                                Image("chat")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .clipped()
                                    .onTapGesture {
                                        isChatView = true
                                    }
                            )
                    }
                )
                .cornerRadius(50)
                .offset(x:35,y:220)
                
                //Video Icon
                NavigationLink(
                    destination: VcallView(),
                    isActive: $isVcallView,
                    label: {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 50, height: 50)
                            .background(
                                Image("vcall")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .clipped()
                                    .onTapGesture {
                                        isVcallView = true
                                        
                                    }
                            )
                    }
                )
                .cornerRadius(50)
                .offset(x: 100,y:220)
                
                
                
            }
            
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
    
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack(spacing: 0) {
                Image(systemName: "arrow.left")
                Text("Back")
            }
            .foregroundColor(.blue)
            
        }
    }
    
    
}
