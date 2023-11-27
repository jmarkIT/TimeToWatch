// The Swift Programming Language
// https://docs.swift.org/swift-book
import ArgumentParser

let file: String = "movies.json"

@main
struct TimeToWatch: ParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "Find out what movie you can watch with what time you have.",
        
        version: "0.0.1",
        
        subcommands: [Add.self, List.self, Watch.self]
        
//        defaultSubcommand: List.self
    )
}

struct Add: ParsableCommand {
    @Argument(help: "Title of the movie to add.")
    var title: String
    
    @Argument(help: "The length of the movie in minutes")
    var length: Int
    
    func run() {
        let newMovie = Movie(title: title, length: length)
        
        var movies = readDB(from: file)
        movies.append(newMovie)
        writeDB(to: file, with: movies)
        print("Added \(newMovie.title) to list")
    }
}

struct List: ParsableCommand {
    func run() {
        let movies = readDB(from: file)
        for movie in movies {
            print("\(movie.title): \(movie.length) minutes")
        }
    }
}

struct Watch: ParsableCommand {
    @Argument(help: "How much time, in minutes, you have available.")
    var minutes: Int
    
    func run() {
        let movies = readDB(from: file)
        let choices = movies.filter({ minutes >= $0.length })
        for movie in choices {
            print("\(movie.title): \(movie.length) minutes")
        }
    }
}
