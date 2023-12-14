# TimeToWatch

## Overview

TimeToWatch is a simple terminal utility that lets you create a list of movies you want to watch and filter that list by how much time you have to actually sit down and watch one.

I put this together as a simple little project as I am learning Swift. I probably won't be modifying this much in the future other than little tweaks here and there, but I might eventually turn this into an equally simple iOS/Mac app if I get around to it.

## Usage

TimeToWatch creates and uses a local JSON file to store your movie list. It only looks in the current working directory for this file.

### Subcommands

`create`: Creates an empty file named `TimeToWatch.json` to store your movie list.

`add`: Expects two arguments, the name of a movie and the length in minutes. It then adds this movie to your database.

`list`: Prints a full list of your movies to the terminal. This is the default action if no subcommand is provided.

`watch`: Expecpts one argument, the number of minutes you have available. It then prints the list of movies that fit within your time limit.

`remove`: Expects one argument, the title of a movie. If it is found in your database it will be removed.

