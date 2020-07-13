//
//  UIViewExtension.swift
//  SosnovskiyRegisterApp
//
//  Created by Gregory Pinetree on 12.07.2020.
//  Copyright © 2020 Gregory Pinetree. All rights reserved.
//

import UIKit
import Foundation

// Syntactic sugar extension
extension UIView {
    
    // MARK: - Pin
    func pin(superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
    
    // MARK: - Add to left anchor
    func addToLeft(anchor: NSLayoutXAxisAnchor, multiplier: Int) {
        leadingAnchor.constraint(equalTo: anchor, constant: CGFloat(multiplier)).isActive = true
    }
    
    // MARK: - Add to right anchor
    func addToRight(anchor: NSLayoutXAxisAnchor, multiplier: Int) {
        trailingAnchor.constraint(equalTo: anchor, constant: CGFloat(multiplier)).isActive = true
    }
    
    // MARK: - Add to top anchor
    func addToTop(anchor: NSLayoutYAxisAnchor, multiplier: Int) {
        topAnchor.constraint(equalTo: anchor, constant: CGFloat(multiplier)).isActive = true
    }
    
    // MARK: - Add to botom anchor
    func addToBottom(anchor: NSLayoutYAxisAnchor, multiplier: Int) {
        bottomAnchor.constraint(equalTo: anchor, constant: CGFloat(multiplier)).isActive = true
    }
    
    // MARK: - Set height anchor
    func height(_ height: Int) {
        heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
    }
}
