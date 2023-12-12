//
//  File.swift
//  
//
//  Created by James Mark on 11/27/23.
//

import ArgumentParser

struct Add: ParsableCommand {
    @Argument(help: "Title of the movie to add.")
    var title: String
    
    @Argument(help: "The length of the movie in minutes")
    var length: Int
    
    func run() {
        let newMovie = Movie(title: title, length: length)
        
        var movies = readDB(from: file) ?? []
        movies.append(newMovie)
        writeDB(to: file, with: movies)
        print("Added \(newMovie.title) to list")
    }
}

struct List: ParsableCommand {
    func run() {
        guard let movies = readDB(from: file) else {
            print("Movie database (\"movies.json\") not found in Documents folder. Please try adding a movie first!")
            return
        }
        for movie in movies {
            print("\(movie.title): \(movie.length) minutes")
        }
    }
}

struct Watch: ParsableCommand {
    @Argument(help: "How much time, in minutes, you have available.")
    var minutes: Int
    
    func run() {
        let movies = readDB(from: file) ?? []
        let choices = movies.filter({ minutes >= $0.length })
        for movie in choices {
            print("\(movie.title): \(movie.length) minutes")
        }
    }
}

struct Remove: ParsableCommand {
    @Argument(help: "The title of the film you would like to remove from list.")
    var title: String
    
    func run() {
        guard var movies = readDB(from: file) else {
            print("No movies found, so no action is taken")
            return
        }
        movies = movies.filter({ $0.title != title })
        writeDB(to: file, with: movies)
        print("Removing all instances of \(title) from your list.")
    }
}