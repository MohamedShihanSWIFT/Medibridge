//
//  ViewModelLocator.swift
//  MediBridge final1
//
//  Created by Adrian Roger Menezes on 26/01/2024.
//

// ViewModelLocator.swift

// ViewModelLocator.swift

import Foundation
import Combine

class viewModelLocator: ObservableObject {
    static let shared = viewModelLocator()

    @Published var firebaseViewModel = FirebaseViewModel()

    private init() { }
}
