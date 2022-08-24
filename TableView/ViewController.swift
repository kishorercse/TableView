//
//  ViewController.swift
//  TableView
//
//  Created by kishore-pt5557 on 12/08/22.
//

import UIKit

struct Model {
    
//    let labels = [["Home", "Profile", "Security & Privacy"], ["Settings", "Sign out"]]
    
    var labelText: String
    var img: UIImage

}

class CustomCell: UITableViewCell {
    lazy var label: UILabel = UILabel()
    lazy var imgView: UIImageView = {
        let iv = UIImageView()
        iv.tintColor = UIColor.red
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    var model: Model?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        align()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateModel(model: Model) {
        self.model = model
        label.text = model.labelText
        imgView.image = model.img
    }
    
    func align() {
        
        self.addSubview(imgView)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        imgView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
    }

}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .grouped)
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    var arr:[[Model]] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = CustomCell(style: .default, reuseIdentifier: "cell")
        let val = arr[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.updateModel(model: val)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case 0:
                return "One"
            case 1:
                return "Two"
            default:
                return ""
        }
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch section {
            case 0:
                return "One footer"
            case 1:
                return "Two footer"
            default:
                return ""
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titles = [["Home", "Profile", "Security & Privacy"], ["Settings", "Sign out"]]
        
        for section in 0..<titles.count {
            arr.append([])
            for row in 0..<titles[section].count {
                let model = Model(labelText: titles[section][row], img: UIImage(named: "g")!)
                arr[section].append(model)
            }
        }
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    


    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            self.navigationController?.pushViewController(ViewController2(), animated: true)
        }
    }
    
}

class ViewController2: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemBlue
    }
    
}
