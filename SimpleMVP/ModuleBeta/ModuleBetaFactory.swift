//
//  ModuleBetaFactory.swift
//  SimpleMVP
//
//  Created by Dmitriy Mirovodin on 18.02.2024.

import UIKit

/// Фабрика для создания модуля Beta
final class ModuleBetaFactory {
    
    // В структуре параметры, которые мы хотим передать в модуль.
    struct Context {
        let someParam: String
    }

    func make(context: Context) -> UIViewController {
        /// Только Factory может наполнять Presenter реальными сервисами и другими зависимостями
        let dataBaseService = DataBaseService()
        
        let router = ModuleBetaRouter(
            alertFactory: AlertModuleFactory()
        )
        
        let presenter = ModuleBetaPresenter(
            someParam: context.someParam,
            dataBaseService: dataBaseService,
            router: router
        )
        let vc = ModuleBetaViewController(presenter: presenter)
        
        presenter.view = vc
        router.setRootViewController(root: vc)
        
        return vc
    }
}

