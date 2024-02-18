//
//  ModuleAlphaRouter.swift
//  SimpleMVP
//
//  Created by Dmitriy Mirovodin on 18.02.2024.

import Foundation
import UIKit

// Роутер, который открывает все переходы с модуля Alpha
protocol ModuleAlphaRouterProtocol: AnyObject {
    
    // Устанавливаем основной UIViewController
    func setRootViewController(root: UIViewController)
    
    // Модуль Alpha показывает модуль Beta и передает в него параметры.
    func openModuleBeta(with param: String)
}

final class ModuleAlphaRouter: ModuleAlphaRouterProtocol {
    
    private let factory: ModuleBetaFactory
    
    private weak var root: UIViewController?
    
    init(factory: ModuleBetaFactory) {
        self.factory = factory
    }
    
    func setRootViewController(root: UIViewController) {
        self.root = root
    }
    
    // Модуль Alpha показывает модуль Beta и передает в него параметры.
    func openModuleBeta(with param: String) {
        
        let context = ModuleBetaFactory.Context(
            someParam: param,
            someValue: 100
        )
        
        let viewController = factory.make(context: context)
        
        root?.navigationController?.pushViewController(viewController, animated: true)
    }
}
