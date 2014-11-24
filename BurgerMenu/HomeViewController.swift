//
//  HomeViewController.swift
//  BurgerMenu
//
//  Created by Reid Weber on 11/24/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var menuButton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.menuLeadingConstraint.constant = -216
        self.tableView.reloadData()
        let touchGesture = UITapGestureRecognizer(target: self, action: "tappedMenu:")
        self.menuButton.addGestureRecognizer(touchGesture)
        self.tableView.superview?.sendSubviewToBack(self.menuButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MENU_CELL") as MenuTableCell
        cell.titleLabel.text = "Menu"
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let duration : NSTimeInterval = 1.0
        let delay : NSTimeInterval = 0.0
        let damping : CGFloat = 0.75
        let velocity : CGFloat = 0.6
        self.menuLeadingConstraint.constant = -216
        UIView.animateWithDuration(duration, delay: delay, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.view.layoutIfNeeded()
            }, completion: nil)
    }
    
    func tappedMenu(sender: AnyObject) {
        let duration : NSTimeInterval = 1.0
        let delay : NSTimeInterval = 0.0
        let damping : CGFloat = 0.75
        let velocity : CGFloat = 0.75
        self.menuLeadingConstraint.constant = -16
        UIView.animateWithDuration(duration, delay: delay, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
}
