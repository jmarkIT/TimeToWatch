// The Swift Programming Language
// https://docs.swift.org/swift-book
import ArgumentParser

let file: String = "movies.json"

@main
struct TimeToWatch: ParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "Find out what movie you can watch with what time you have.",
        
        version: "0.0.1",
        
        subcommands: [Add.self, List.self, Watch.self, Remove.self]
        
//        defaultSubcommand: List.self
    )
}
