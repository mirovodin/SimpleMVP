//
//  AlertModuleFactory.swift
//  SimpleMVVM
//
//  Created by Dmitriy Mirovodin on 16.02.2024.
//

import UIKit

final class AlertModuleFactory {
    
    func make(title: String, message: String) -> UIViewController {
        let alertViewController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: nil
        )
        
        alertViewController.addAction(action)
        
        return alertViewController
    }
}
