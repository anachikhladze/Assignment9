import UIKit

// MARK: Task 1

protocol CargoManaging {
    func addCargo(_ cargo: String)
    func removeCargo(_ cargo: String)
    func listCargo() -> [String]
}

protocol CrewManaging {
    func addCrew(_ member: String)
    func removeMember(_ member: String)
    func listCrew() -> [String]
}

protocol ShipInfo {
    var name: String { get }
    var color: String { get }
    var captainName: String { get }
    var location: String { get }
    var crewManager: CrewManaging { get }
    var cargoManager: CargoManaging { get }
}

protocol Cannons {
    func fireCannon(count: Int)
    func cannonCount() -> Int
}

extension ShipInfo {
    func printFullInfo() {
        print("\(name) is \(color) and its captain is \(captainName).\nCurrent location is \(location). Crew count is \(crewManager.listCrew().count). Cargo count is \(cargoManager.listCargo().count).")
    }
}

class PirateShip: Cannons {
    let name: String
    var cannonsCount: Int
    var cargoManager: CargoManaging
    var crewManager: CrewManaging
    
    init(name: String, cannonsCount: Int, cargoManager: CargoManaging, crewManager: CrewManaging) {
        self.name = name
        self.cannonsCount = cannonsCount
        self.cargoManager = cargoManager
        self.crewManager = crewManager
    }
    
    func addCargo(_ cargo: String) {
        cargoManager.addCargo(cargo)
    }
    
    func removeCargo(_ cargo: String) {
        cargoManager.removeCargo(cargo)
    }
    
    func listCargo() -> [String] {
        cargoManager.listCargo()
    }
    
    func addCrew(_ member: String) {
        crewManager.addCrew(member)
    }
    
    func removeCrew(_ member: String) {
        crewManager.removeMember(member)
    }
    
    func listCrew() -> [String] {
        crewManager.listCrew()
    }
    
    func fireCannon(count: Int) {
        if cannonsCount > 0 && cannonsCount > count {
            cannonsCount -= count
        } else {
            print("Not enough cannons left")
        }
    }
    
    func cannonCount() -> Int {
        cannonsCount
    }
}

class CrewManager: CrewManaging {
    var crew: [String] = []
    
    func addCrew(_ member: String) {
        crew.append(member)
    }
    
    func removeMember(_ member: String) {
        crew.removeAll { $0 == member }
    }
    
    func listCrew() -> [String] {
        crew
    }
}

class CargoManager: CargoManaging {
    var shipCargo: [String] = []
    
    func addCargo(_ cargo: String) {
        shipCargo.append(cargo)
    }
    
    func removeCargo(_ cargo: String) {
        shipCargo.removeAll { $0 == cargo }
    }
    
    func listCargo() -> [String] {
        shipCargo
    }
}

class Frigate: PirateShip, ShipInfo {
    let captainName: String
    let color: String
    let location: String
    var destination: String?
    
    init(captainName: String, color: String, location: String, name: String, cannonsCount: Int, cargoManager: CargoManaging, crewManager: CrewManaging) {
        self.captainName = captainName
        self.color = color
        self.location = location
        super.init(name: name, cannonsCount: cannonsCount, cargoManager: cargoManager, crewManager: crewManager)
    }
    
    override func fireCannon(count: Int) {
        if count <= 5 {
            super.fireCannon(count: count)
            print("Firing \(count) cannons from the \(name) 💣")
        } else {
            print("You can fire up to 5 cannons at once! ❌ ")
        }
    }
    
    override func addCrew(_ member: String) {
        if crewManager.listCrew().count < 250 {
            super.addCrew(member)
        } else {
            print("Frigate Crew can't add more members! ❌")
        }
    }
    
    func setDestination(_ destination: String) {
        self.destination = destination
    }
}

class Galleon: PirateShip, ShipInfo {
    let captainName: String
    let color: String
    let location: String
    var destination: String?
    
    init(captainName: String, color: String, location: String, name: String, cannonsCount: Int, cargoManager: CargoManaging, crewManager: CrewManaging) {
        self.captainName = captainName
        self.color = color
        self.location = location
        super.init(name: name, cannonsCount: cannonsCount, cargoManager: cargoManager, crewManager: crewManager)
    }
    
    override func fireCannon(count: Int) {
        if count <= 3 {
            super.fireCannon(count: count)
            print("Firing \(count) cannons from the \(name) 💣")
        } else {
            print("You can fire up to 3 cannons at once! ❌")
        }
    }
    
    override func addCrew(_ member: String) {
        if crewManager.listCrew().count < 300 {
            super.addCrew(member)
        } else {
            print("Galleon Crew can't add more members! ❌")
        }
    }
    
    func setDestination(_ destination: String) {
        self.destination = destination
    }
}

// MARK: Task 2

class TreasureMap {
    let x: Double
    let y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    func hintToTreasure(x: Double, y: Double) {
        if self.x == x && self.y == y {
            print("You have found the treasure! 🔑🏴‍☠️")
        } else {
            print("The treasure is hidden near Atlantic Beach, North Carolina 🏝️")
        }
    }
}

// MARK: Task 3

class SeaAdventure {
    let adventureType: String
    
    init(adventureType: String) {
        self.adventureType = adventureType
    }
    
    func encounter() {
        print(adventureType)
    }
}

// MARK: Task 4

class PirateCode {
    private func discussTerms(_ term: String) {
        print("Disscussion about \(term) has started...")
    }
    
    func parley(_ term: String) {
        discussTerms(term)
        print("Crews have resolved their dispute.")
    }
    
    func mutiny(_ term: String) {
        discussTerms(term)
        print("No agreement was reached. Crews are on the brink of a serious conflict ⚔️")
    }
}

// MARK: Task 5

let crewManager = CrewManager()
let cargoManager = CargoManager()

var laConcorde = Frigate(captainName: "Blackbeard",
                         color: "Black",
                         location: "Atlantic Beach",
                         name: "Queen Anne's Revenge",
                         cannonsCount: 40,
                         cargoManager: cargoManager,
                         crewManager: crewManager)

laConcorde.addCrew("Richard Stiles")
laConcorde.addCrew("Stede Bonnet")
laConcorde.addCrew("Edward Salter")
laConcorde.addCrew("Charles Vane")
laConcorde.addCrew("Israel Hands")

laConcorde.addCargo("Tobacco")
laConcorde.addCargo("Weapons and gunpowder")
laConcorde.addCargo("Precious Metals and Coins")
laConcorde.addCargo("Slaves")
laConcorde.addCargo("Gemstones and jewelry")
laConcorde.addCargo("Wine, Rum, Food")
laConcorde.addCargo("Medicines")

laConcorde.printFullInfo()
print("Crew members are: \(laConcorde.listCrew())")
print("Cargo List: \(laConcorde.listCargo())")
print("Current Cannon Count is \(laConcorde.cannonCount()).")
print()

let treasureMap = TreasureMap(x: 34.7167, y: 76.6667)

let pirateCode = PirateCode()

let seaAdventure = SeaAdventure(adventureType: "Encountering FlyingDutchman... ⛴️")

let lantitude = 34.7167
let longitude = 76.6667

treasureMap.hintToTreasure(x: lantitude, y: longitude)
seaAdventure.encounter()
pirateCode.mutiny("Trading Slaves")

laConcorde.fireCannon(count: 5)
print("\(laConcorde.name) defeated the Enemy ship! ⚔️🏴‍☠️")
