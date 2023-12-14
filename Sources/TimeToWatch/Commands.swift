//
//  File.swift
//  
//
//  Created by James Mark on 11/27/23.
//
import ArgumentParser

extension TimeToWatch {
    struct Create: ParsableCommand {
        func run() {
            let DBStatus = checkDB()
            if DBStatus {
                print("Database already exists, please use another command")
            } else {
                createDB()
                print("Database created!")
            }
        }
    }
    
    struct Add: ParsableCommand {
        @Argument(help: "Title of the movie to add.")
        var title: String
        
        @Argument(help: "The length of the movie in minutes")
        var length: Int
        
        func run() {
            guard checkDB() else {
                print("Movie database (\"TimeToWatch.json\") not found in your current folder. Please run create first!")
                return
            }
            let newMovie = Movie(title: title, length: length)
            
            var movies = readDB() ?? []
            movies.append(newMovie)
            writeDB(with: movies)
            print("Added \(newMovie.title) to list")
        }
    }

    struct List: ParsableCommand {
        static var configuration = CommandConfiguration(abstract: "Print out list of movies")
        
        func run() {
            guard let movies = readDB() else {
                print("Movie database (\"TimeToWatch.json\") not found in your current folder. Please try adding a movie first!")
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
            let movies = readDB() ?? []
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
            guard checkDB() else {
                print("No database found in the current directory. Are you sure you're in the right place?")
                return
            }
            guard var movies = readDB() else {
                print("No movies found, so no action is taken")
                return
            }
            movies = movies.filter({ $0.title != title })
            writeDB(with: movies)
            print("Removing all instances of \(title) from your list.")
        }
    }
}




