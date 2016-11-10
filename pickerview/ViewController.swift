//
//  ViewController.swift
//  pickerview
//
//  Created by DAM on 3/11/16.
//  Copyright © 2016 Sheila Ros and Larry Sanchez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    // creamos las variables de los elementos que hemos introducido en el layout
    //comentario de prueba
    
    @IBOutlet weak var pokemon: UIPickerView!
    @IBOutlet weak var tipo: UIPickerView!
    
    @IBOutlet weak var ipokemon: UIImageView!
    @IBOutlet weak var itipo: UIImageView!
    
    @IBOutlet weak var mensaje: UILabel!
    @IBOutlet weak var mensaje2: UILabel!
    // creamos 2 variables para comparar tipo y pokemon y cambiar el texto del mensaje
    var nombrePokemon = "Pikachu"
    var nombreTipo = "Agua"
    
    //creamos las arrays para los pickerview
    var apokemon = ["Pikachu", "Vaporeon", "Charmander", "Suicune", "Entei", "Raikou"]
    var atipo = ["Agua", "Fuego", "Electrico"]
    
    //arrays para las imagenes, se pone el nombre de la imagen sin comillas (lo suele autocompletar)
    var urlpokemon = [#imageLiteral(resourceName: "pikachu.jpg"),#imageLiteral(resourceName: "vaporeon.jpg"), #imageLiteral(resourceName: "Charmander.png"),#imageLiteral(resourceName: "suicune.jpg"), #imageLiteral(resourceName: "Entei.png"), #imageLiteral(resourceName: "Raikou.jpg")]
    var urltipo = [#imageLiteral(resourceName: "agua.jpg"), #imageLiteral(resourceName: "red.jpg"), #imageLiteral(resourceName: "electric.jpg")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Le decimos que somos delegate y datasource al pickerview
        pokemon.dataSource = self
        pokemon.delegate = self
        tipo.dataSource = self
        tipo.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //Numero de componentes que se pintaran en el pickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //numero de filas
    //Al crear los pickerview asignamos un tag(como si fuera una id) para poder diferenciarlos, de está manera podemos rellenar cada pickerview con los datos que queremos
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView.tag==1){
            return apokemon.count
        }else{
            return atipo.count
        }
    }
    //rellenar datos
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView.tag==1){
            return apokemon[row]
        }else{
            return atipo[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //modifica imagen
        if(pickerView.tag==1){
            ipokemon.image = urlpokemon[row]
            nombrePokemon = apokemon[row]
        }else{
            itipo.image = urltipo[row]
            nombreTipo = atipo[row]
        }
        // mostramos el mensaje correcto con las 2 variables creadas de nombrePokemon y nombreTipo si coincide con el tipo/nombre
        if ((nombrePokemon == "Pikachu" && nombreTipo == "Electrico") || (nombrePokemon == "Raikou" && nombreTipo == "Electrico")){
            mensaje.text = nombrePokemon+" es un pokemon"
            mensaje2.text =  "de tipo "+nombreTipo
        }else if((nombrePokemon == "Vaporeon" && nombreTipo == "Agua") || (nombrePokemon == "Suicune" && nombreTipo == "Agua")){
            mensaje.text = nombrePokemon+" es un pokemon"
            mensaje2.text =  "de tipo "+nombreTipo
        }else if((nombrePokemon == "Charmander" && nombreTipo == "Fuego") || (nombrePokemon == "Entei" && nombreTipo == "Fuego")){
            mensaje.text = nombrePokemon+" es un pokemon"
            mensaje2.text =  "de tipo "+nombreTipo
        }else{
            // en caso de no coincidir con nada mostraremos NADA en el mensaje
            mensaje.text = ""
            mensaje2.text = ""
        }
        //añadimos constrains para que sea responsive con diferentes versiones de Iphone.
    }
}

