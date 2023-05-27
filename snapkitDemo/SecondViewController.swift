//
//  SecondViewController.swift
//  snapkitDemo
//
//  Created by Salma Ayuningtyas on 27/05/23.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableVw : UITableView = {
        let table = UITableView()
        table.rowHeight = 100
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Example 2"
        setUpView()
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    
    
    func setUpView(){
        tableVw.dataSource = self
        tableVw.delegate = self
        tableVw.register(customCell.self, forCellReuseIdentifier: customCell.customCell)
//        BE CAREFULLY!! WE MUST ADDSUBVIEW FIRST BEFORE SET THE CONSTRAINT
        self.view.addSubview(tableVw)
        tableVw.snp.makeConstraints{make in
            make.edges.equalTo(self.view)
            
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: customCell.customCell, for: indexPath) as! customCell
        return cell
    }
    
    class customCell : UITableViewCell{
        static var customCell = "cell"
        
        let image : UIImageView = {
            let img = UIImageView()
            img.image = UIImage(named: "image")
            return img
        }()
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            self.backgroundColor = .lightGray
            setIMG()
        }
        
        func setIMG(){
            addSubview(image)
            image.snp.makeConstraints{make in
                make.edges.equalToSuperview().inset(10)
            }
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
