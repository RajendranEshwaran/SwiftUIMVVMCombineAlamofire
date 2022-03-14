//
//  ReusableComponents.swift
//  SwiftUIMVVMCombineAlamofire
//
//  Created by Rajendran Eshwaran on 3/13/22.
//

import Foundation
import SwiftUI

extension Image{
    func tabbbarIcons(width:CGFloat,height:CGFloat)-> some View{
        self
            .resizable()
            .aspectRatio(1.0, contentMode: .fit)
            .frame(width: width, height: height, alignment: .center)
    }
}
