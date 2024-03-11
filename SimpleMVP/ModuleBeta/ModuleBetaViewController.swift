//
//  ModuleBetaViewController.swift
//  SimpleMVP
//
//  Created by Dmitriy Mirovodin on 18.02.2024.

import UIKit

protocol ModuleBetaViewProtocol: AnyObject {
    
    func update(model: ModuleBetaView.Model)
    func showError()
    func showEmpty()
    func startLoader()
    func stopLoader()
}

final class ModuleBetaViewController: UIViewController {
    
    private lazy var customView = ModuleBetaView(presenter: presenter)
    private let presenter: ModuleBetaPresenterProtocol
    
    init(presenter: ModuleBetaPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        title = presenter.title
        presenter.viewDidLoad()
    }
    
    deinit {
        print(">>> ModuleBetaViewController is deinit")
    }
}

extension ModuleBetaViewController: ModuleBetaViewProtocol {
    
    func update(model: ModuleBetaView.Model) {
        customView.update(model: model)
    }
    
    func showError() {
        customView.showError()
    }
    
    func showEmpty() {
        customView.showEmpty()
    }
    
    func startLoader() {
        customView.startLoader()
    }
    
    func stopLoader() {
        customView.stopLoader()
    }
}

