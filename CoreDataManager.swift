import SwiftUI
import CoreData

class CoreDataManager{
    let persistentContainer : NSPersistentContainer
    init(){
        persistentContainer = NSPersistentContainer(name: "CrudMobiliario")
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
            print("Error al guardar. Error en \(error)")
        }
    }

    func leerTodoMobiliario()-> [Mobiliario]{
        let fetchRequest:NSFetchRequest<Mobiliario>=Mobiliario.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        }
        catch{
            return[]
        }
    }
}
