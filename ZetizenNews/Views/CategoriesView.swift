//
//  CategoriesView.swift
//  ZetizenNews
//
//  Created by DDL11 on 20/08/23.
//

import SwiftUI

struct CategoriesView: View {
    var categories: [String]
    @Binding var selectedCategory: String?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                Text("All")
                    .padding(.horizontal, 12)
                    .padding(.vertical, 5)
                    .background(selectedCategory == nil ? Color("Black") : Color("Gray"))
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .onTapGesture {
                        selectedCategory = nil
                    }
                
                ForEach(categories, id: \.self) { category in
                    Text(category.capitalized)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5)
                        .background(selectedCategory == category ? Color("Black") : Color("Gray"))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .onTapGesture {
                            selectedCategory = category
                        }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(categories: ["Nasional", "Tekno", "Hiburan", "Nasional", "Lifestyle"], selectedCategory: .constant(nil))
    }
}
