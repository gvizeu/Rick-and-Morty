//
//  Extension+Image.swift
//  Rick and Morty
//
//  Created by Gonzalo Vizeu on 17/3/23.
//

import SwiftUI

extension Image {
    public static var rickMortyBg: Image = Image("rick_morty_bg")
    public static var rickMortyBgSec: Image = Image("rick_morty_bg_sec")
    public static var mortyOk: Image = Image("morty_ok")
    public static var filterIcon: Image = Image(systemName: "line.horizontal.3.decrease.circle")
    public static var circleIcon: Image = Image(systemName: "circle")
    public static var crossCircleIcon: Image = Image(systemName: "x.circle")
    public static var arrowLeft: Image = Image(systemName: "arrow.left")
    public static var chevronLeft: Image = Image(systemName: "chevron.compact.left")
    public static var chevronRight: Image = Image(systemName: "chevron.compact.right")
    public static var placeholderError: Image = Image(systemName: "placeholder_error")
}
extension UIImage {
    public static var placeholderError: UIImage = UIImage(systemName: "placeholder_error")!
}
