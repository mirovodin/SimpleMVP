//
//  ModuleBetaRouter.swift
//  SimpleMVP
//
//  Created by Dmitriy Mirovodin on 18.02.2024.

import UIKit

protocol ModuleBetaRouterProtocol {
    
    // Устанавливаем основной UIViewController
    func setRootViewController(root: UIViewController)
    
    func showSuccess()
    func showError()
}

final class ModuleBetaRouter: ModuleBetaRouterProtocol {
        
    weak var root: UIViewController?
    
    private let alertFactory: AlertModuleFactory
    
    init(alertFactory: AlertModuleFactory) {
        self.alertFactory = alertFactory
    }
    
    func setRootViewController(root: UIViewController) {
        self.root = root
    }
    
    func showSuccess() {
        let viewController = alertFactory.make(
            title: "Module Beta",
            message: "Save success"
        )
        
        root?.present(viewController, animated: true)
    }
    
    func showError() {
        let viewController = alertFactory.make(
            title: "Module Beta",
            message: "Save error"
        )
        
        root?.present(viewController, animated: true)
    }
}
