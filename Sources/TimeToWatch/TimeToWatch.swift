// The Swift Programming Language
// https://docs.swift.org/swift-book
import ArgumentParser

@main
struct TimeToWatch: ParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "Find out what movie you can watch with what time you have.",
        
        version: "1.0.0",
        
        subcommands: [Create.self, Add.self, List.self, Watch.self, Remove.self],
        
        defaultSubcommand: List.self
    )
}
