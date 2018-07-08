
enum GameDirection {
    case north, east, west, south
}

struct GameLocation {
    let x: Int
    let y: Int
    let allowedDirections: [GameDirection]
    var event: String?
}

struct GameRow {
    let locations: [GameLocation]
}

class GameModel {
    
    private var currentRowIndex = 2          // start at (x: 0, y: 0)
    private var currentLocationIndex = 2     // which translates to index 2 in our arrays
    
    private var gameGrid: [GameRow] = []
    
    init() {
        self.gameGrid = createGameGrid()
    }

    func restart() {
        currentRowIndex = 2
        currentLocationIndex = 2
    }
    
    func move(direction: GameDirection) {
        switch direction {
        case .north:    currentRowIndex += 1
        case .south:    currentRowIndex -= 1
        case .east:     currentLocationIndex += 1
        case .west:     currentLocationIndex -= 1
        }
    }
    
    var currentLocation: GameLocation {
        /*
         TODO: Implement this method. It should return the *correct* GameLocation struct
         in the gameGrid for the player's current location.
         */
        return GameLocation(x: 0, y: 0, allowedDirections: [], event: nil) // This is not correct! Replace it with real implementation!
    }
    
    // MARK: Helper methods for creating the game grid

    private func eventForCoordinate(x: Int, y: Int) -> String? {
        /*
            TODO: Implement at least 2 special events for specific coordinates
            in this method.
        */
        
        return nil
    }
    
    private func createGameGrid() -> [GameRow] {
        var gameGrid = [GameRow]()
        for yValue in -2...2 {
            var locations = [GameLocation]()
            for xValue in -2...2 {
                let directions = allowedDirectionsForCoordinate(x: xValue, y: yValue)
                let event = eventForCoordinate(x: xValue, y: yValue)
                let location = GameLocation(x: xValue, y: yValue, allowedDirections: directions, event: event)
                locations.append(location)
            }
            let gameRow = GameRow(locations: locations)
            gameGrid.append(gameRow)
        }
        return gameGrid
    }
    
    private func allowedDirectionsForCoordinate(x: Int, y: Int) -> [GameDirection] {
        var directions = [GameDirection]()
        
        switch y {
        case -2:    directions += [.north]
        case 2:     directions += [.south]
        default:    directions += [.north, .south]
        }
        
        switch x {
        case -2:    directions += [.east]
        case 2:     directions += [.west]
        default:    directions += [.east, .west]
        }
        
        return directions
    }
    
}
