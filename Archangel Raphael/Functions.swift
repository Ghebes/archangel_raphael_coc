//
//  Functions.swift
//  Archangel Raphael
//
//  Created by Michael Ghebranious on 1/29/24.
//

import Foundation
import SwiftUI

///Background colors chosen based on the App Storage object isLight
func backgroundColors(isLight : Bool) -> [Color] {
    if isLight{
        return [Color("lightblue"), Color("lightblue").opacity(0.05)]
    }else{
        return [Color("darkgray")]
    }
}
