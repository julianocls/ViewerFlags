//
//  ViewController.swift
//  ViewerFlags
//
//  Created by Juliano Santos on 31/5/22.
//

import UIKit

class ViewController: UITableViewController {

    var listFlags = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadFlags()
        print(listFlags)
    }
    
    
    func loadFlags() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        var flags = try! fm.contentsOfDirectory(atPath: path)
        flags.sort()

        for flag in flags {
            if flag.hasSuffix(".png") {
                if let lastIndex = flag.lastIndex(of: "@") {
                    let flagName = String(flag[..<lastIndex]) + ".png"
                    if !listFlags.contains(flagName) {
                        listFlags.append(flagName)
                    }
                }
            }
        }
    }

    // Return size array
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listFlags.count
    }

    // return data of line namber
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Coutry", for: indexPath)
        
        if let indexName = listFlags[indexPath.row].lastIndex(of: ".")  {
            let imageName = listFlags[indexPath.row]
            let name = String(imageName[..<indexName])
            cell.textLabel?.text = " - " + name
        }
        cell.imageView?.image = UIImage(named: listFlags[indexPath.row])
        cell.imageView?.layer.borderColor = UIColor.lightGray.cgColor

        return cell
    }

}

