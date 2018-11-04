//
//  Movie.swift
//  Lec6TableViews
//
//  Created by hackeru on 04/11/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit
struct Movie {
    let title:String
    let director:String
    let image: UIImage?
}

//go internet fetch movies
struct MovieDataSource {
    func getMovies()->[Movie]{
        return [
            Movie(title: "סופר על 2", director: "בראד בירד",image: UIImage(named: "inc")), Movie(title: "ocean",
                  director: "בראד בירד",
                  image: UIImage(named: "ocean")
            ),
            Movie(title: "ant man",
                  director: "בראד בירד",
                  image: UIImage(named: "ant")
            ),
            Movie(title: "tag",
                  director: "בראד בירד",
                  image: UIImage(named: "tag")
            ),
            Movie(title: "leave",
                  director: "בראד בירד",
                  image: UIImage(named: "leave")
            )
        ]
    }
}











