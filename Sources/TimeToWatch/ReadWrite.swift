//
//  File.swift
//  
//
//  Created by James Mark on 11/27/23.
//

import Foundation

func readDB() -> [Movie]? {
    let fileManager = FileManager.default
    let fileURL = URL(string: "file://\(fileManager.currentDirectoryPath)")?.appendingPathComponent("TimeToWatch.json")
    
    var moviesData: [Movie]? = []
    do {
        let jsonData = try Data(contentsOf: fileURL!)
        let jsonDecoder = JSONDecoder()
        moviesData = try jsonDecoder.decode([Movie].self, from: jsonData)
    } catch {
        moviesData = nil
    }
    return moviesData
}

func writeDB(with movies: [Movie]) -> () {
    let fileManager = FileManager.default
    
    let fileURL = URL(string: "file://\(fileManager.currentDirectoryPath)")?.appendingPathComponent("TimeToWatch.json")
    do {
        let jsonEncoder = JSONEncoder()
        let jsonData = try jsonEncoder.encode(movies)
        
        try jsonData.write(to: fileURL!)
    } catch {
        print("Error decoding data: \(error)")
    }
}
