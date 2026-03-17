//
//  PetitionHTMLBuilder.swift
//  Project07_PetitionsExplorer
//
//  Created by Karla E. Martins Fernandes on 17/03/26.
//

import Foundation

struct PetitionHTMLBuilder {
    
    static func makeHTML(for petition: Petition) -> String {
        return """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
        body {
            font-size: 150%;
            font-family: -apple-system;
            padding: 16px;
            margin: 0;
        }
        h1 {
            font-size: 180%;
            margin-bottom: 16px;
        }
        p {
            line-height: 1.5;
        }
        </style>
        </head>
        <body>
        <h1>\(petition.title)</h1>
        <p>\(petition.body)</p>
        </body>
        </html>
        """
    }
}
