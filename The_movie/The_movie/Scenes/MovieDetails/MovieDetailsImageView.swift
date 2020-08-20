//
//  MovieDetailsImageView.swift
//  The_movie
//
//  Created by  Jaisson Monteiro on 20/08/20.
//  Copyright © 2020  Jaisson Monteiro. All rights reserved.
//

import SwiftUI

struct MovieDetailsImageView: View {
    var body: some View {
        GeometryReader { geometry in
            
            Image("movie")
            .resizable()
                .aspectRatio(contentMode: .fill)
            
            .frame(width: geometry.size.width, height:
                geometry.frame(in: .global).minY > 0 ?
                geometry.size.height + geometry.frame(in: .global).minY
                : geometry.size.height

            )
            .clipped()
            .offset(y:
                geometry.frame(in: .global).minY > 0 ?
                -geometry.frame(in: .global).minY
                : 0
            )
            
        }
    }
}

struct MovieDetailsImageView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsImageView()
    }
}
