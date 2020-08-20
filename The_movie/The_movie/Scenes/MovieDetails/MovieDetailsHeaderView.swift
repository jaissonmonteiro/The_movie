//
//  MovieDetailsHeaderView.swift
//  The_movie
//
//  Created by  Jaisson Monteiro on 20/08/20.
//  Copyright © 2020  Jaisson Monteiro. All rights reserved.
//

import SwiftUI

struct MovieDetailsHeaderView: View {
    
    @State var like: Bool = true
    
    var body: some View {
        VStack(spacing: 8) {
            HStack(alignment: .top, spacing: 16) {
                Text("Nome do filme escolhido")
                    .font(Font.system(size: 30))
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action: {
                    self.like.toggle()
                }) {
                    Image(systemName: self.like ? "heart.fill" : "heart")
                        .font(Font.system(size: 20))
                }
                
            }
            
            HStack(spacing: 20) {
                HStack {
                    Image(systemName: "heart.fill")
                    Text("1.2k Likes")
                }
                
                HStack {
                    Image(systemName: "p.circle.fill")
                    Text("Popularity views")
                    
                }
                
                Spacer()
            }
        }
        .padding()
    }
}

struct MovieDetailsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            MovieDetailsHeaderView()
        }
    }
}
