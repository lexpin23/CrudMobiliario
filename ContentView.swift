//
//  ContentView.swift
//  CrudMobiliario
//
//  Created by Lokura on 29/11/22.
//
import SwiftUI
import CoreData

struct ContentView: View {
    let CoreDM: CoreDataManager
    @State var id=""
    @State var nombre=""
    @State var precio=""
    @State var existencia=""
    @State var categoria=""
    @State var seleccionado:Mobiliario?
    @State var moArray=[Mobiliario]()
    
    var body: some View {
        VStack{
            TextField("Id",         text: $id)          .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Nombre",     text: $nombre)      .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Precio",     text: $precio)      .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Existencia", text: $existencia)  .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Categoria",  text: $categoria)   .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Save"){
                if(seleccionado != nil){
                    seleccionado?.id=id
                    seleccionado?.nombre=nombre
                    seleccionado?.precio=precio
                    seleccionado?.existencia=existencia
                    seleccionado?.categoria=categoria
                    CoreDM.actualizarMobiliario(mobiliario: seleccionado!)
                }else{
                    CoreDM.guardarMobiliario(id: id, nombre: nombre, precio: precio, existencia: existencia, categoria: categoria)
                }
            }
        }   
    }
}
