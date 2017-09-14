//
//  RadioButtonsController.swift
//  TestApp
//
//  Created by Al Shamas Tufail on 24/03/2015.
//  Copyright (c) 2015 Al Shamas Tufail. All rights reserved.
//

import Foundation
import UIKit

/// RadioButtonControllerDelegate. Delegate optionally implements didSelectButton that receives selected button.
@objc protocol RadioButtonControllerDelegate {
    /**
        This function is called when a button is selected. If 'shouldLetDeSelect' is true, and a button is deselected, this function
    is called with a nil.
    
    */
    @objc optional func didSelectButton(_ aButton: RadioButton?)
}

class RadioButtonsController : NSObject
{
    fileprivate var buttonsArray = [RadioButton]()
    fileprivate weak var currentSelectedButton:RadioButton? = nil
    weak var delegate : RadioButtonControllerDelegate? = nil
    /**
        Set whether a selected radio button can be deselected or not. Default value is false.
    */
    var shouldLetDeSelect = false
    /**
        Variadic parameter init that accepts UIButtons.

        - parameter buttons: Buttons that should behave as Radio Buttons
    */
    init(buttons: RadioButton...) {
        super.init()
        for aButton in buttons {
            aButton.addTarget(self, action: #selector(RadioButtonsController.pressed(_:)), for: UIControlEvents.touchUpInside)
        }
        self.buttonsArray = buttons
    }
    /**
        Add a UIButton to Controller

        - parameter button: Add the button to controller.
    */
    func addButton(_ aButton: RadioButton) {
        buttonsArray.append(aButton)
        aButton.addTarget(self, action: #selector(RadioButtonsController.pressed(_:)), for: UIControlEvents.touchUpInside)
    }
    /** 
        Remove a UIButton from controller.

        - parameter button: Button to be removed from controller.
    */
    func removeButton(_ aButton: RadioButton) {
        var iteration = 0
        var iteratingButton: RadioButton? = nil
        for (_, item) in buttonsArray.enumerated() {
            iteratingButton = item
            if(iteratingButton == aButton) {
                break
            } else {
                iteratingButton = nil
            }
            iteration += 1
        }
        if(iteratingButton != nil) {
            buttonsArray.remove(at: iteration)
            iteratingButton!.removeTarget(self, action: #selector(RadioButtonsController.pressed(_:)), for: UIControlEvents.touchUpInside)
            if currentSelectedButton == iteratingButton {
                currentSelectedButton = nil
            }
        }
    }
    /**
        Set an array of UIButons to behave as controller.
        
        - parameter buttonArray: Array of buttons
    */
    func setButtonsArray(_ aButtonsArray: [RadioButton]) {
        for aButton in aButtonsArray {
            aButton.addTarget(self, action: #selector(RadioButtonsController.pressed(_:)), for: UIControlEvents.touchUpInside)
        }
        buttonsArray = aButtonsArray
    }

    func pressed(_ sender: RadioButton) {
        if(sender.isChecked) {
            if shouldLetDeSelect {
                sender.isChecked = false
                currentSelectedButton = nil
            }
        } else {
            for aButton in buttonsArray {
                aButton.isChecked = false
            }
            sender.isChecked = true
            currentSelectedButton = sender
        }
        delegate?.didSelectButton?(currentSelectedButton)
    }
    /**
        Get the currently selected button.
    
        - returns: Currenlty selected button.
    */
    func selectedButton() -> RadioButton? {
        return currentSelectedButton
    }
    
    //선택된 버튼의 순서
    var selectedRow: Int {
        var row = 0
        for (i, btn) in buttonsArray.enumerated() {
            if btn.isChecked {
                row = i
                break
            }
        }
        return row
    }
    
    //선택된 버튼
    var selectedBtn: RadioButton {
        for btn in buttonsArray {
            if btn.isChecked {
                return btn
            }
        }
        return buttonsArray[0]
    }
    
    //원하는 index의 버튼 클릭
    func selectRadioBtn(index: Int) {
        for item in buttonsArray {
            item.isChecked = false
        }
        buttonsArray[index].isChecked = true
    }
}
