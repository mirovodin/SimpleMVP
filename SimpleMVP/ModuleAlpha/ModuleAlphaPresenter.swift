//
//  ModuleAlphaPresenter.swift
//  SimpleMVP
//
//  Created by Dmitriy Mirovodin on 18.02.2024.

protocol ModuleAlphaPresenterProtocol {
    var title: String { get }
    var analiticScreenName: String { get }
    
    func viewDidAppear()
    func tapButton()
}

final class ModuleAlphaPresenter: ModuleAlphaPresenterProtocol {
    
    weak var view: ModuleAlphaViewProtocol?
    
    private let service: RestServiceProtocol
    private let router: ModuleAlphaRouterProtocol

    var title: String { "Module A" }
    
    var analiticScreenName: String { "module_a_screen_name" }
    
    init(
        service: RestServiceProtocol,
        router: ModuleAlphaRouterProtocol
    ) {
        self.service = service
        self.router = router
    }
    
    func viewDidAppear() {
        view?.stopLoader()
        service.requestData { [weak self] (result: Result<String, Error>) in
            guard let self else { return }
            view?.stopLoader()
            
            switch result {
            case let .success(model):
                let model = ModuleAlphaView.Model(
                    text: model,
                    buttonText: "Go Go Go"
                )
                view?.update(model: model)
                break
            case .failure:
                view?.showError()
            }
        }
    }
    
    func tapButton() {
        // открыть модуль Beta и передать туда параметры
        router.openModuleBeta(with: "params from module Alpha")
    }
}
