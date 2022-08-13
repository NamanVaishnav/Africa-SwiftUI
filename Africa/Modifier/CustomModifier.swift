//
//  CustomModifier.swift
//  Africa
//
//  Created by Naman Vaishnav on 13/08/22.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
