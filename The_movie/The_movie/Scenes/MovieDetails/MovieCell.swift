//
//  MovieListCell.swift
//  The_movie
//
//  Created by  Jaisson Monteiro on 19/08/20.
//  Copyright © 2020  Jaisson Monteiro. All rights reserved.
//

import SwiftUI

struct MovieCell: View {
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .top) {
                HStack(spacing: 16) {
                    Image("movie")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(Color.gray)
                        .frame(width: geometry.size.width / 5, height: geometry.size.height)
                    
                    VStack(alignment: .leading) {
                        Text("Nome do filme")
                            .fontWeight(.bold)
                        Text("ano genero, genero")
                    }
                }
                Spacer()
                
                Image(systemName: "checkmark.circle.fill")
            }
            .foregroundColor(Color.white)
        }
    }
}

struct MovieListCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieCell()
            .background(Color.black)
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
