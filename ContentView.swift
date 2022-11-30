//
//  ContentView.swift
//  CrudMobiliario
//
//  Created by Lokura on 29/11/22.
//

import SwiftUI
import CoreData

class CoreDataManager{
    let persistentContainer : NSPersistentContainer
    init(){
        persistentContainer = NSPersistentContainer(name: "Mobiliario")
        persistentContainer.loadPersistentStores(completionHandler: {
            (descripcion, error) in
            if let error = error {
                fatalError("core data failed to inicialice \(error.localizedDescription)")
            }
        })
    }

    func guardarMobiliario(id:String, nombre:String, precio:String, existencia:String, categoria:String){
        let mobiliario = Mobiliario(context : persistentContainer.viewContext)
        mobiliario.id = id
        mobiliario.nombre=nombre
        mobiliario.precio=precio
        mobiliario.existencia=existencia
        mobiliario.categoria = categoria
        
        do{
            try persistentContainer.viewContext.save()
            print("Guardado con éxito")
        }
        catch{
            print("failed to  save error en \(error)")
        }
    }
}
