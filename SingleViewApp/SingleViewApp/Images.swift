//
//  Images.swift
//  SingleViewApp
//
//  Created by Storm67 on 06.06.2021.
//  Copyright © 2021 Storm67. All rights reserved.
//

import Foundation
import UIKit

enum Images: CaseIterable {
    static var kind: (UIImage, String) {
        guard let image = UIImage(named: "5") else { return (UIImage(), "")}
        return (image, "Дети")
    }
    static var adult: (UIImage, String) {
        guard let image = UIImage(named: "3") else { return (UIImage(), "")}
        return (image, "Взрослые")
    }
    static var elder: (UIImage, String) {
        guard let image = UIImage(named: "2") else { return (UIImage(), "")}
        return (image, "Пожилые")
    }
    static var animals: (UIImage, String) {
        guard let image = UIImage(named: "3") else { return (UIImage(), "")}
        return (image, "Животные")
    }
    static var events: (UIImage, String) {
        guard let image = UIImage(named: "6") else { return (UIImage(), "")}
        return (image, "Мероприятия")
    }
    
    static var array: [(UIImage, String)] {
     [kind,adult,elder,animals,events]
    }
}
