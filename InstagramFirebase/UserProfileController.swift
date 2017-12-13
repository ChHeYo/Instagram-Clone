//
//  UserProfileController.swift
//  InstagramFirebase
//
//  Created by Jason Yoo on 12/12/17.
//  Copyright © 2017 ThumbsUp. All rights reserved.
//

import UIKit
import Firebase

class UserProfileController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        
        navigationItem.title = Firebase.Auth.auth().currentUser?.uid
        
        fetchUser()
        
        collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerID")
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerID", for: indexPath)
        
        header.backgroundColor = .green
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    
    
    fileprivate func fetchUser() {
        
        guard let uid = Firebase.Auth.auth().currentUser?.uid else { return }
        
        var ref: DatabaseReference
        
        ref = Database.database().reference()
        
        ref.child("users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            print(snapshot.value ?? "")
            
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            
            let username = dictionary["username"] as? String
            
            self.navigationItem.title = username
            
        }) { (err) in
            print("Failed to fetch user:", err)
        }
        
    
    }
}
