//
//  ModuleAlphaFactory.swift
//  SimpleMVP
//
//  Created by Dmitriy Mirovodin on 18.02.2024.

import UIKit

/// Фабрика для создания модуля Alpha
final class ModuleAlphaFactory {
    
    // В структуре параметры, которые мы хотим передать в модуль.
    struct Context {
        
    }
    
    func make() -> UIViewController {
        /// Только Factory может наполнять Presenter реальными сервисами и другими зависимостями
        let service = RestService()
        
        let router = ModuleAlphaRouter(
            factory: ModuleBetaFactory()
        )
        
        let presenter = ModuleAlphaPresenter(
            service: service,
            router: router
        )
        let vc = ModuleAlphaViewController(presenter: presenter)
        
        presenter.view = vc
        router.setRootViewController(root: vc)
        
        return vc
    }
}
