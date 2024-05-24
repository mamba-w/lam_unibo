//
//  ViewController.swift
//  Tris
//
//  Created by Matteo Tancredi on 14/06/18.
//  Copyright © 2018 Matteo Tancredi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var giocatoreAttivo = 1 //Croce
    var statoGioco = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let combinazioniVittoria = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]
    var giocoAttivo = true
    @IBOutlet weak var label: UILabel!
    
    @IBAction func action(_ sender: AnyObject)
    {
        if (statoGioco[sender.tag-1] == 0 && giocoAttivo == true)
        {
            statoGioco[sender.tag-1] = giocatoreAttivo
            
            if (giocatoreAttivo == 1)
            {
                sender.setImage(UIImage(named: "Croce.png"), for: UIControlState())
                giocatoreAttivo = 2
            }
            else
            {
                sender.setImage(UIImage(named: "Cerchio.png"), for: UIControlState())
                giocatoreAttivo = 1
            }
        }
        
        for combinazione in combinazioniVittoria
        {
            if statoGioco[combinazione[0]] != 0 && statoGioco[combinazione[0]] == statoGioco[combinazione[1]] && statoGioco[combinazione[1]] == statoGioco[combinazione[2]]
            {
                giocoAttivo = false
                
                if statoGioco[combinazione[0]] == 1
                {
                    label.text = "VINCE LA CROCE!"
                }
                else
                {
                    label.text = "VINCE IL CERCHIO!"
                }
                
                giocaAncoraButton.isHidden = false
                label.isHidden = false
            }
        }
        
        giocoAttivo = false
        
        for i in statoGioco
        {
            if i == 0
            {
                giocoAttivo = true
                break
            }
        }
        
        if giocoAttivo == false
        {
            label.text = "PAREGGIO"
            label.isHidden = false
            giocaAncoraButton.isHidden = false
        }
    }
    
    @IBOutlet weak var giocaAncoraButton: UIButton!
    @IBAction func giocaAncora(_ sender: AnyObject)
    {
        statoGioco = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        giocoAttivo = true
        giocatoreAttivo = 1
        
        giocaAncoraButton.isHidden = true
        label.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
