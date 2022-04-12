//
//  View+Preview.swift
//  projetoBase_MVVM
//
//  Created by Roberto Edgar Geiss on 11/04/22.
//

import Foundation
import SwiftUI

struct PreviewComponentModifier: ViewModifier {
    
    let displayName: String
    
    func body(content: Content) -> some View {
        content
            .previewDisplayName(displayName)
            .previewLayout(.sizeThatFits)
    }
}

extension View {
    
    func preview(displayName: String = "") -> some View {
        self.modifier(PreviewComponentModifier(displayName: displayName))
    }
}
