//
//  ViewController.swift
//  CoreDataSaveNumber
//
//  Created by Hoang Luyen on 3/26/18.
//  Copyright © 2018 Hoang Luyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var inputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let entity = try? AppDelegate.context.fetch(Entity.fetchRequest()) as! [Entity]
        inputTextField.text = String(entity?.last?.number ?? 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func saveCoreData(_ sender: UIBarButtonItem) {
        let entity = Entity(context: AppDelegate.context)
        if inputTextField.text != "" {
            guard let data = inputTextField.text else {return}
            if let dataNumber = Int64(data) {
                entity.number = dataNumber
                    AppDelegate.saveContext()
            }
        }
    }
}

