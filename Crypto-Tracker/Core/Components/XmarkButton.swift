//
//  XmarkButton.swift
//  Crypto-Tracker
//
//  Created by Sabri Çetin on 17.01.2025.
//

import SwiftUI

struct XmarkButton: View {
    
    @Environment(\.dismiss) var dismiss
     
    var body: some View {
        Button(action: {
            dismiss()
    }, label: {
        Image(systemName: "xmark")
            .font(.headline)
    })
    }
    
}

#Preview {
    XmarkButton()
}
