//
//  DatabaseService.swift
//  xzuvyShop
//
//  Created by Peter Clarke on 09.03.2023.
//

import Foundation
import FirebaseFirestore

class DatabaseService {
    
    static let shared = DatabaseService()
    private let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    private var ordersRef: CollectionReference {
        return db.collection("orders")
    }
    
    private init() { }
    
    func getOrders(by userID: String?, completion: @escaping (Result<[Order], Error>) -> ()) {
        self.ordersRef.getDocuments { qSnap, error in
            if let qSnap = qSnap {
                var orders = [Order]()
                for doc in qSnap.documents {
                    if let userID = userID {
                        if let order = Order(doc: doc), order.userID == userID {
                            orders.append(order)
                        }
                    } else {
                        if let order = Order(doc: doc) {
                            orders.append(order)
                        }
                    }
                    
                }
                completion(.success(orders))
            } else if let error = error{
                completion(.failure(error))
            }
        }
    }
    
    
    func setOred(order: Order, completion: @escaping (Result<Order, Error>) -> ()) {
        ordersRef.document(order.id).setData(order.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                self.setPositions(to: order.id, positions: order.positions) { result in
                    switch result {
                        
                    case .success(let positions):
                        print(positions.count)
                        completion(.success(order))
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                
            }
        }
    }
    
    func setPositions(to orderID : String, positions: [Position], completion: @escaping (Result<[Position], Error>) -> ()) {
        
        let positionsRef = ordersRef.document(orderID).collection("positions")
        
        for position in positions {
            positionsRef.document(position.id).setData(position.representation)
        }
        completion(.success(positions))
    }
    
    func createUser(user: UserShop, complition: @escaping (Result<UserShop, Error>) -> ()) {
        
        usersRef.document(user.id).setData(user.representation) { error in
            if let error = error {
                complition(.failure(error))
            } else {
                complition(.success(user))
            }
        }
            
    }
    
    func getProfile(completion: @escaping (Result<UserShop, Error>) -> ()) {
        usersRef.document(AuthService.shared.currentUser!.uid).getDocument { docSnapshot, error in
            guard let snap = docSnapshot else { return }
            guard let data = snap.data() else { return }
            guard let userName = data["name"] as? String else { return }
            guard let id = data["id"] as? String else { return }
            guard let number = data["number"] as? Int else { return }
            guard let adress = data["adress"] as? String else { return }
            
            let user = UserShop(id : id, name: userName, number: number, adress: adress)
            completion(.success(user))
        }
    }
    
}

