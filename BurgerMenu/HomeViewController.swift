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
    var newChildViewControllers : Array<UIViewController> = []
    var currentChildViewController : UIViewController!
    var childView = UIView()
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.menuLeadingConstraint.constant = -216
        self.tableView.reloadData()
        let touchGesture = UITapGestureRecognizer(target: self, action: "tappedMenu:")
        self.menuButton.addGestureRecognizer(touchGesture)
        self.tableView.superview?.sendSubviewToBack(self.menuButton)
        
        var childVC1 = UIViewController()
        var childVC2 = UIViewController()
        childVC1.view.backgroundColor = UIColor.purpleColor()
        childVC2.view.backgroundColor = UIColor.yellowColor()
        self.newChildViewControllers += [childVC1, childVC2]
        
        self.addChildViewController(childVC1)
        childVC1.view.frame = self.view.frame
        self.childView.addSubview(childVC1.view)
        childVC1.didMoveToParentViewController(self)
        self.currentChildViewController = childVC1
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
