//
//  ELRotatedMenu.swift
//  ELRotatedMenu
//
//  Created by Efthimis Liapatis on 05/05/2017.
//  Copyright © 2017 eliapatis. All rights reserved.
//

import UIKit

@objc public protocol ELRotatedMenuDelegate: NSObjectProtocol {
    @objc optional func willRevealMenu()
    @objc optional func willHideMenu()
}

@objc public class ELRotatedMenu: UIViewController {
    
    // MARK: - Public Properties
    
    /// The angle is created between Menu ViewController and Main ViewController.
    /// The value is in degrees.
    /// Default value is the angle between screen height and screen diagonal
    public var menuAngle: CGFloat = CGFloat.angleOfScreenDiagonal()
    
    /// The size of menu button
    public var menuButtonSize: CGSize = CGSize(width: 80.0, height: 80.0)
    
    /// Hide from view the menu button
    public var hideMenuButton: Bool = false {
        didSet {
            menuButton.isHidden = hideMenuButton
        }
    }
    
    /// The background color of menuButton
    public var menuButtonBackgroundColor: UIColor = UIColor(red: 255.0/255.0, green: 136.0/255.0, blue: 137.0/255.0, alpha: 1.0)
    
    /// The image of menu button
    public var menuImage: UIImage!
    
    /// The image of closing menu button
    public var closeMenuImage: UIImage!
    
    /// Choose whether to extend or not the height of front ViewController,
    /// before the animation of opening the menu.
    /// This will cause not to have a gap in diagonal while the menu is open.
    /// Default value is true.
    public var extendFrontViewHeight: Bool = true
    
    public weak var delegate: ELRotatedMenuDelegate?
    
    // MARK: - Private Properties
    
    var menuButton = UIButton()
    var menuImageView = UIImageView()
    var closeMenuImageView = UIImageView()
    var menuContainer = UIView()
    var mainContainer = UIView()
    
    // MARK: - ViewController Lifecycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        self.performSegue(withIdentifier: SegueIdentifierType.menu.id, sender: nil)
        
        self.performSegue(withIdentifier: SegueIdentifierType.main.id, sender: nil)
        
        setupMenuButton()
    }
    
    // MARK: - Public functions
    
    /// Set the front ViewController
    ///
    /// - Parameter viewController: the frontViewController needs to be setted
    public func setFrontViewController(viewController: UIViewController) {
        UIView.animate(withDuration: 0.5, animations: {
            self.mainContainer.rotate(aroundPoint: CGPoint(x: -self.mainContainer.center.x, y: -self.mainContainer.center.y), withAngle: CGFloat(-90.0).toRadians())
        }) { (completed) in
            self.mainContainer.removeFromSuperview()
            
            self.addChildViewController(viewController)
            
            viewController.view.frame = CGRect(x: 0.0, y: 0.0, width: self.view.bounds.width, height: self.view.bounds.height)
            self.mainContainer = viewController.view
            self.mainContainer.rotate(aroundPoint: CGPoint(x: -self.mainContainer.center.x, y: -self.mainContainer.center.y), withAngle: CGFloat(-90.0).toRadians())
            self.mainContainer.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
            self.view.insertSubview(self.mainContainer, belowSubview: self.menuButton)
            viewController.didMove(toParentViewController: self)
            
            self.mainContainer.addShadow()
            
            UIView.animate(withDuration: 0.5, animations: {
                self.mainContainer.rotate(aroundPoint: CGPoint(x: -self.mainContainer.center.x, y: -self.mainContainer.center.y), withAngle: CGFloat(0.0).toRadians())
            }) { (completed) in
                
            }
            
            self.menuButton.isSelected = false
            if let delegate = self.delegate, delegate.responds(to: #selector(ELRotatedMenuDelegate.willHideMenu)) {
                delegate.willHideMenu!()
            }
            self.menuImageViewTransition()
        }
    }
    
    // MARK: - Button Action
    
    /// Show or Hide Menu ViewController
    public func presentMenu() {
        menuButton.isSelected = !menuButton.isSelected
        
        if !menuButton.isSelected {
            if let delegate = delegate, delegate.responds(to: #selector(ELRotatedMenuDelegate.willHideMenu)) {
                delegate.willHideMenu!()
            }
        } else {
            if let delegate = delegate, delegate.responds(to: #selector(ELRotatedMenuDelegate.willRevealMenu)) {
                delegate.willRevealMenu!()
            }
        }
        
        self.menuTransition()
        
        self.menuImageViewTransition()
    }
    
    // MARK: - Setup UI
    
    /// Setup the container view from a given viewController and its type of storyboard segue
    ///
    /// - Parameters:
    ///   - segueIdentifierType: The type of storyboard segue
    ///   - viewController: The viewController needs to be contained
    func setContainerView(_ segueIdentifierType: SegueIdentifierType, withViewController viewController: UIViewController) {
        addChildViewController(viewController)
        switch segueIdentifierType {
        case .menu:
            viewController.view.frame = self.view.bounds
            menuContainer = viewController.view
            menuContainer.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
            self.view.insertSubview(menuContainer, belowSubview: mainContainer)
            break
        case .main:
            viewController.view.frame = CGRect(x: 0.0, y: 0.0, width: self.view.bounds.width, height: self.view.bounds.height)
            mainContainer = viewController.view //(CGFloat(sin(45.0))*self.view.bounds.width)
            mainContainer.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
            self.view.insertSubview(mainContainer, belowSubview: menuButton)
            
            // Adding Shadow
            mainContainer.addShadow()
            break
        }
        viewController.didMove(toParentViewController: self)
    }
    
    /// Setup menu button and the image views on it
    fileprivate func setupMenuButton() {
        menuButton.frame = CGRect(x: -menuButtonSize.width, y: -menuButtonSize.height, width: menuButtonSize.width * 2.0, height: menuButtonSize.height * 2.0)
        menuButton.layer.cornerRadius = menuButton.frame.width/2
        menuButton.backgroundColor = menuButtonBackgroundColor
        menuButton.addTarget(self, action: #selector(presentMenu), for: .touchUpInside)
        self.view.addSubview(menuButton)
        
        menuImageView.frame = CGRect(x: menuButtonSize.width/4.0, y: 25.0, width: 25.0, height: 25.0)
        menuImageView.image = menuImage ?? UIImage(named: "menuIcon", in: Bundle(for: type(of: self)), compatibleWith: nil)!
        menuImageView.contentMode = .scaleAspectFit
        self.view.addSubview(menuImageView)
        
        closeMenuImageView.frame = CGRect(x: menuButtonSize.width/4.0, y: 25.0, width: 25.0, height: 25.0)
        closeMenuImageView.image = closeMenuImage ?? UIImage(named: "closeIcon", in: Bundle(for: type(of: self)), compatibleWith: nil)!
        closeMenuImageView.contentMode = .scaleAspectFit
        closeMenuImageView.rotate(aroundPoint: CGPoint(x: -self.closeMenuImageView.center.x, y: -self.closeMenuImageView.center.y), withAngle: CGFloat(70.0).toRadians())
        self.view.addSubview(closeMenuImageView)
    }
    
    // MARK: - Helper
    
    /// Rotate front View Controller
    fileprivate func  menuTransition() {
        let animationAngle = menuButton.isSelected ? self.menuAngle : 0.0
        
        if extendFrontViewHeight && menuButton.isSelected {
            mainContainer.frame = CGRect(x: 0.0, y: 0.0, width: self.view.bounds.width, height: self.view.bounds.height + (CGFloat(sin(45.0))*self.view.bounds.width))
        }
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.mainContainer.rotate(aroundPoint: CGPoint(x: -self.mainContainer.center.x, y: -self.mainContainer.center.y), withAngle: CGFloat(animationAngle).toRadians())
        }, completion: { completed in
            if self.extendFrontViewHeight && !self.menuButton.isSelected {
                self.mainContainer.frame = CGRect(x: 0.0, y: 0.0, width: self.view.bounds.width, height: self.view.bounds.height)
            }
        })
    }
    
    /// Rotate menuImageView
    fileprivate func menuImageViewTransition() {
        let menuImageAngle = menuButton.isSelected ? -70.0 : 0.0
        let closeMenuImageAngle = menuButton.isSelected ? 0.0 : 70.0
        
        UIView.animate(withDuration: 1.0, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.menuImageView.rotate(aroundPoint: CGPoint(x: -self.menuImageView.center.x, y: -self.menuImageView.center.y), withAngle: CGFloat(menuImageAngle).toRadians())
            self.closeMenuImageView.rotate(aroundPoint: CGPoint(x: -self.closeMenuImageView.center.x, y: -self.closeMenuImageView.center.y), withAngle: CGFloat(closeMenuImageAngle).toRadians())
        }, completion: nil)
    }
    
    public override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        /// In rotation close menu if it's open
        if menuButton.isSelected {
            menuButton.sendActions(for: .touchUpInside)
        }
    }
}
