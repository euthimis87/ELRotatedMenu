//
//  MenuViewController.swift
//  SampleRotatedView
//
//  Created by Efthimis Liapatis on 05/05/2017.
//  Copyright © 2017 eliapatis. All rights reserved.
//

import UIKit
import ELRotatedMenu

class MenuViewController: UIViewController {
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    
    @IBOutlet var leadFirstButtonConstraint: NSLayoutConstraint!
    @IBOutlet var leadThirdButtonConstraint: NSLayoutConstraint!
    @IBOutlet var leadSecondButtonConstraint: NSLayoutConstraint!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        self.menuViewController?.delegate = self
     
        setupButton(firstButton)
        setupButton(secondButton)
        setupButton(thirdButton)
    
        leadFirstButtonConstraint.constant = -100.0
        leadSecondButtonConstraint.constant = -100.0
        leadThirdButtonConstraint.constant = -100.0
        
        firstButton.setImage(Assets.fly.withRenderingMode(.alwaysTemplate), for: .normal)
        secondButton.setImage(Assets.rocket.withRenderingMode(.alwaysTemplate), for: .normal)
        thirdButton.setImage(Assets.search.withRenderingMode(.alwaysTemplate), for: .normal)
    }
    
    func setupButton(_ button: UIButton) {
        button.layer.cornerRadius = button.frame.width/2
        button.clipsToBounds = true
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2.0
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 2
        button.layer.shadowOffset = CGSize(width: -2, height: 2)
    }

    @IBAction func flyAction(_ sender: UIButton) {
        self.menuViewController?.setMainViewController(viewController: self.storyboard!.instantiateViewController(withIdentifier: String(describing: SecondViewController.self)) as! SecondViewController)
    }
    
    @IBAction func rocketAction(_ sender: UIButton) {
        self.menuViewController?.setMainViewController(viewController: self.storyboard!.instantiateViewController(withIdentifier: String(describing: FrontViewController.self)) as! FrontViewController)
    }
    
    @IBAction func searchAction(_ sender: UIButton) {
        self.menuViewController?.setMainViewController(viewController: self.storyboard!.instantiateViewController(withIdentifier: String(describing: SecondViewController.self)) as! SecondViewController)
    }
    
    fileprivate func calculateAngleOfScreenDiagonal() -> Double {
        return -atan(Double(UIScreen.main.bounds.width/UIScreen.main.bounds.height))*180/Double.pi
    }
}

// MARK: - ELRotatedMenuDelegate
extension MenuViewController: ELRotatedMenuDelegate {
    func willRevealMenu() {
        self.leadFirstButtonConstraint.constant = (CGFloat(abs(cos(self.calculateAngleOfScreenDiagonal()))) * self.firstButton.frame.origin.y)/2 - (self.firstButton.frame.height/2)
        
        UIView.animate(withDuration: 0.7, delay: 0.3, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        self.leadSecondButtonConstraint.constant = (CGFloat(abs(cos(self.calculateAngleOfScreenDiagonal()))) * self.secondButton.frame.origin.y)/2 - (self.secondButton.frame.height/2)
        UIView.animate(withDuration: 0.7, delay: 0.5, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        self.leadThirdButtonConstraint.constant = (CGFloat(abs(cos(self.calculateAngleOfScreenDiagonal()))) * self.thirdButton.frame.origin.y)/2 - (self.thirdButton.frame.height/2)
        UIView.animate(withDuration: 0.7, delay: 0.7, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func willHideMenu() {
        self.leadFirstButtonConstraint.constant = -100.0
        
        UIView.animate(withDuration: 0.7, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        self.leadSecondButtonConstraint.constant = -100.0
        UIView.animate(withDuration: 0.7, delay: 0.2, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        self.leadThirdButtonConstraint.constant = -100.0
        UIView.animate(withDuration: 0.7, delay: 0.4, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}
