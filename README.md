# ELRotatedMenu

An iOS side menu with animation of rotation, inspired by UIMovement (https://uimovement.com/ui/244/sticker-app/) 

<img src="https://github.com/euthimis87/ELRotatedMenu/blob/master/SampleRotatedMenu.gif" alt="ELRotatedMenu Screenshot" width="320" height="568" />

## Requirements
* iOS >= 8.0

## Installation

### Manual Install

* 1st Option:
    Copy the ELRotatedMenu Folder in your project.
* 2nd Option:
    Drag Framework/ELRotatedMenu.framework into your project's Framework folder.
    Then select Target-> General -> Build Phases and under Embede Frameworks add ELRotatedMenu.framework.

### Usage

1. In Storyboard set the class of Initial View Controller to ELRotatedMenu.

<img src="https://github.com/euthimis87/ELRotatedMenu/blob/master/Screenshots/step1.png" alt="ELRotatedMenu Screenshot" width="320" height="568" />

2. Ctrl + Left Click on ELRotatedMenu and drag into the Menu View Controller. In the segue menu you will see, select "rotated menu". Next select the segue and in the Attributes Insepctor set as identifier "el_menu".

<img src="https://github.com/euthimis87/ELRotatedMenu/blob/master/Screenshots/step2.png" alt="ELRotatedMenu Screenshot" width="320" height="568" />

3. The same flow as above to set the Front View Controller and set as identifier "el_front"

Ready. Run your app and you 'll see the rotated menu. 

4. Change Front View Controller

``` import ELRotatedMenu ```

and then

``` self.menuViewController?.setFrontViewController(viewController: <YourNewFrontViewController>) ```

### Deligation

Implement `ELRotatedMenuDelegate` and set your ViewController as the delegate of ELRotatedMenu

``` self.menuViewController?.delegate = self ```

and track the flow of animation with the following delegate's functions:

``` func willRevealMenu() ```

``` func willHideMenu() ```

### Customisation

You can customise the following properties:

``` public var menuAngle: CGFloat
public var menuButtonSize: CGSize
public var hideMenuButton: Bool { get set }
public var menuButtonBackgroundColor: UIColor
public var menuImage: UIImage!
public var closeMenuImage: UIImage!
public var extendFrontViewHeight: Bool
```
## Contact

Efthymios Liapatis

- email: eliapatis@gmail.com
- github: https://github.com/euthimis87



