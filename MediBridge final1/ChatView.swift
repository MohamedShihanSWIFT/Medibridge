//
//  ChatView.swift
//  MediBridge final1
//
//  Created by Sidrah Javed on 29/12/2023.
//
import SwiftUI
import WebKit

struct ChatView: View {
    @State private var showWebView = false
    private let urlString: String = "https://www.messenger.com/"
    
    var body: some View {
        VStack(spacing: 40) {
            // Normal WebView
            WebView(url: URL(string: urlString)!).frame(height: 500.0)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.3), radius: 20.0, x: 5, y: 5)
                
            
            // Create a link that opens in a new window
            Link(destination: URL(string: urlString)!, label: {
                Text("Open in new window")
                    .foregroundColor(.blue)
            })
            
            // Present WebView as a Bottom Sheet
            Button {
                showWebView.toggle()
            } label: {
                Text("Open in a sheet")
            }
            .sheet(isPresented: $showWebView) {
                WebView(url: URL(string: urlString)!)
            }
            Spacer()
            
        }.padding()
    }
}

// WebView Struct
struct WebView3: UIViewRepresentable {
    
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}



#Preview {
    ChatView()
}
