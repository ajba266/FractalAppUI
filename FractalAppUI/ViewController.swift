//
//  ViewController.swift
//  FractalAppUI
//
//  Created by cmch237 on 11/4/19.
//  Copyright © 2019 Team Name. All rights reserved.
//

import UIKit


class aboutViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    let names = ["Sierpinski Triangle", "Fractal 2", "Fractal 3", "Fractal 4", "Fractal 5"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(names.count)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "FractalCell")
        cell.textLabel?.text = names[indexPath.row]
        cell.textLabel?.textColor = UIColor.systemBlue
        cell.backgroundColor = UIColor(red:0.18, green:0.06, blue:0.36, alpha:1.0)
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red:0.27, green:0.09, blue:0.56, alpha:1.0)
        cell.selectedBackgroundView = backgroundView
        return(cell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0
        {
            self.performSegue(withIdentifier: "TableSegue1", sender: self)
        }
        if indexPath.row == 1
        {
            self.performSegue(withIdentifier: "TableSegue2", sender: self)
        }
        if indexPath.row == 2
        {
            self.performSegue(withIdentifier: "TableSegue3", sender: self)
        }
        if indexPath.row == 3
        {
            self.performSegue(withIdentifier: "TableSegue4", sender: self)
        }
        if indexPath.row == 4
        {
            self.performSegue(withIdentifier: "TableSegue5", sender: self)
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


