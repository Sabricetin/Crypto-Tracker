//
//  XmarkButton.swift
//  Crypto-Tracker
//
//  Created by Sabri Çetin on 17.01.2025.
//

import SwiftUI

struct XmarkButton: View {
    
    @Environment(\.dismiss) var dismiss // Dismiss Environment
     
    var body: some View {
        Button(action: {
            dismiss()
    }, label: {
        Image(systemName: "xmark")
            .font(.headline)
    })
    }
    
}
struct XmarkButton_Previews : PreviewProvider {
    static var previews: some View {
        XmarkButton()
    }
}
