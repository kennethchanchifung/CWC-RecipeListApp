//
//  SearchBarView.swift
//  Recipe List App
//
//  Created by k on 22/12/2022.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var filterBy: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(5)
                .shadow(radius:4)
            HStack{
                Image(systemName: "magnifyingglass")
                TextField("Filter by...", text: $filterBy)
                Button {
                    // Clear the text field
                    filterBy = ""
                } label: {
                    Image(systemName: "multiply.circle.fill")
                }
            }
            .padding()
        }
        .frame(height: 48)
        .foregroundColor(.gray)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(filterBy: Binding.constant(""))
    }
}
