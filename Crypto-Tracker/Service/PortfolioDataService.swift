//
//  PortfolioDataService.swift
//  Crypto-Tracker
//
//  Created by Sabri Çetin on 20.01.2025.
//

import Foundation
import CoreData

class PortfolioDataService {
    
    private let container : NSPersistentContainer
    private let containerName : String = "PortfolioContainer"
    private let entityName : String = "PortfolioEntity"
    
    @Published var savedEntites : [PortfolioEntity] = []
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { ( _ , error) in
            if let error = error {
                print("Error loading Core Data! \(error)")
                
            }
            self.getPortfolio()
        }
    }
    //MARK: PUBLİC
    
    func updatePortfolio (coin: CoinModel , amount: Double) {
        
        // check if coin is already in portfolio
        if let entity = savedEntites.first(where: {$0.coinID == coin.id}) {
            
            if amount > 0 {
                
                update(entity: entity, amount: amount)
                
            } else {
                delete(entity: entity)
            }
        } else {
            add(coin: coin, amount: amount)
        }
        
    }
    
    //MARK: PRIVATE
    private func getPortfolio() {
        let request = NSFetchRequest<PortfolioEntity>(entityName: entityName)
        do {
           savedEntites = try container.viewContext.fetch(request)
        } catch let error {
            
            print("Error Fetching Portfolio Entities. \(error)")
            
        }
        
    }
    private func add(coin: CoinModel , amount: Double) {
        
        let entity = PortfolioEntity(context: container.viewContext)
        entity.coinID = coin.id
        entity.amount = amount
        applyChanges()
    }
    
    private func update(entity: PortfolioEntity , amount: Double) {
        
        entity.amount = amount
        applyChanges()
        
    }
    
    private func delete (entity: PortfolioEntity) {
            
        container.viewContext.delete(entity)
        applyChanges()
        
    }
    
    private func save() {
        
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error Saving To Core Data. \(error)")
        }
        
    }
    private func applyChanges() {
        
        save()
        getPortfolio()
        
        
    }
    
}
