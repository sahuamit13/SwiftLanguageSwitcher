//
//  ViewController.swift
//  SwiftLanguageManager
//
//  Created by amit sahu on 10/03/17.
//  Copyright © 2017 tpcg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bottomRightLabel: UILabel!
    @IBOutlet weak var bottomLeftLabel: UILabel!
    @IBOutlet weak var imagePickerButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var data = [String]()
    var imagePickerController: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.data = LanguageManager.languageStrings() as! [String]
        self.bottomLeftLabel.text = NSLocalizedString("Happy New Year", comment: "")
        self.bottomRightLabel.text = "Language"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reloadRootViewController(){
    
        let delegate: AppDelegate? = (UIApplication.shared.delegate as? AppDelegate)
        let storyboardName: String = "Main"
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        delegate?.window?.rootViewController = storyboard.instantiateInitialViewController()

    }


}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        LanguageManager.saveLanguage(by: indexPath.row)
        self.tableView.reloadData()
         print(UserDefaults.standard.object(forKey: "currentLanguageKey") as! String )
        LanguageManager.setupCurrentLanguage()
        
       // Bundle.setLanguage(UserDefaults.standard.object(forKey: "currentLanguageKey") as! String )
        
         UserDefaults.standard.set(UserDefaults.standard.object(forKey: "currentLanguageKey") as! String, forKey: "selectedLanguage")
        self.reloadRootViewController()
        
    }
}


extension ViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ELanguage.count.rawValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier: String = "cellIdentifier"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        let cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        print(data)
       
        cell?.textLabel?.text = data[indexPath.row]
        if indexPath.row == LanguageManager.currentLanguageIndex() {
            cell?.accessoryType = .checkmark
        }
        else {
            cell?.accessoryType = .none
        }
        return cell!
    }

}

