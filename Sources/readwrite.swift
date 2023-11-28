//
//  File.swift
//  
//
//  Created by James Mark on 11/27/23.
//

import Foundation

func readDB(from DBURL: String) -> [Movie]? {
    let fileManager = FileManager.default

    let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
    let moviesDBURL = documentsURL.appendingPathComponent(DBURL)
    
    var moviesData: [Movie]? = []
    
    do {
        let jsonData = try Data(contentsOf: moviesDBURL)
        let jsonDecoder = JSONDecoder()
        moviesData = try jsonDecoder.decode([Movie].self, from: jsonData)
    } catch {
        moviesData = nil
    }
    
    return moviesData
}

func writeDB(to DBURL: String, with movies: [Movie]) -> () {
    let fileManager = FileManager.default
    
    let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
    let moviesDBURL = documentsURL.appendingPathComponent(DBURL)
    
    do {
        let jsonEncoder = JSONEncoder()
        let jsonData = try jsonEncoder.encode(movies)
        
        try jsonData.write(to: moviesDBURL)
    } catch {
        print("Error decoding data: \(error)")
    }
    
}
