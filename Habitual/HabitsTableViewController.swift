//
//  MainViewController.swift
//  Habitual
//
//  Created by Trinh Tong on 11/27/18.
//  Copyright © 2018 Trinh Tong. All rights reserved.
//

import UIKit

class HabitsTableViewController: UITableViewController {
    private var persistance = PersistenceLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
        // Do any additional setup after loading the view.
        
        tableView.register(
            HabitTableViewCell.nib,
            forCellReuseIdentifier: HabitTableViewCell.identifier
        )
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persistance.habits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: HabitTableViewCell.identifier,
            for: indexPath
            ) as! HabitTableViewCell
        
        let habit = persistance.habits[indexPath.row]
        cell.configure(habit)

        return cell
    }

}
extension HabitsTableViewController {
    
    @objc func pressAddHabit(_ sender: UIBarButtonItem) {
            let addHabitVc = AddHabitViewController.instantiate()
            let navigationController = UINavigationController(rootViewController: addHabitVc)
            present(navigationController, animated: true, completion: nil)
            
        }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        persistance.setNeedsToReloadHabits()
        tableView.reloadData()
    }
    
    func setUpNavBar() {
        title = "Habitual"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pressAddHabit(_:)))
        navigationItem.rightBarButtonItem = addButton
        
    }
        
}

