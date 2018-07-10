
import UIKit

class GameViewController: UIViewController {
    @IBOutlet weak var eventLog: UILabel!
    @IBOutlet weak var currentLocation: UILabel!
    
    @IBOutlet weak var westButton: UIButton!
    @IBOutlet weak var eastButton: UIButton!
    @IBOutlet weak var southButton: UIButton!
    @IBOutlet weak var northButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    
    
    let gameModel = GameModel()
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   @IBAction private func ButtonPress(target: UIButton){
        disableAllButtons()
        guard let direction = whichDirection(target: target) else{
            print("\(#function)Direction evaluated to nil")
            return
        }
        gameModel.move(direction: direction)
        currentLocation.text = "(x: \(gameModel.currentLocation.x), y:  \(gameModel.currentLocation.y))"
        let event = gameModel.currentLocation.event ?? ""
        let movementLog = target.titleLabel?.text ?? ""
    eventLog.text = "Event Log:\nMoved \(movementLog) \n \(event)"
    
        for direction in gameModel.currentLocation.allowedDirections{
            
            enableButton(target: whichButton(target: direction))
        }
    
    }
    @IBAction func reset(){
        gameModel.restart()
        currentLocation.text = "(X: 0, y: 0)"
        eventLog.text = "Event Log: \n"
    }
    private func enableButton(target: UIButton){
        target.isEnabled = true
    }
    private func disableAllButtons(){
        westButton.isEnabled = false
        eastButton.isEnabled = false
        northButton.isEnabled = false
        southButton.isEnabled = false
        
    }
    
    private func whichDirection(target: UIButton)->GameDirection?{
    switch(target){
    case westButton:
        return GameDirection.west
    case eastButton:
        return GameDirection.east
    case southButton:
        return GameDirection.south
    case northButton:
        return GameDirection.north
    default:
        print("Invalid Button Passed to whichButton: \(target)")
        return nil
        }
    
    }
    private func whichButton(target: GameDirection)->UIButton{
        switch(target){
        case .west:
            return westButton
        case .east:
            return eastButton
        case .south:
            return southButton
        case .north:
            return northButton
        }
    }
}

