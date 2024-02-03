import Foundation
import Firebase
import FirebaseFirestoreSwift
import Combine

class FirebaseViewModel1: ObservableObject {
    private let db = Firestore.firestore()

    func addData(item: UserAgreement) {
        // Assuming you have a "userAgreements" collection in Firestore
        db.collection("userAgreements").addDocument(data: [
            "title": item.title,
            "description": item.description
        ]) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added successfully!")
            }
        }
    }

    // Add other functions related to FirebaseViewModel
}

