//
//  ModuleAlphaView.swift
//  SimpleMVP
//
//  Created by Dmitriy Mirovodin on 18.02.2024.

import UIKit

final class ModuleAlphaView: UIView {

    // Модель через которую передают все изменения во View
    struct Model {
        let text: String
        let buttonText: String
    }
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tap me please!", for: .normal)
        button.addTarget(self, action: #selector(onTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 25)
        label.text = "Some ... text"
        return label
    }()
    
    private let presenter: ModuleAlphaPresenterProtocol

    init(presenter: ModuleAlphaPresenterProtocol) {
        self.presenter = presenter
        super.init(frame: .zero)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(model: Model) {
        label.text = model.text
        button.setTitle(model.buttonText, for: .normal)
    }

    func showError() {
        // Показываем View ошибки
    }
    
    func showEmpty() {
        // Показываем какой-то View для Empty state
    }
    
    func startLoader() {
        // Показываем скелетон или лоадер
    }
    
    func stopLoader() {
        // Скрываем все
    }
}

private extension ModuleAlphaView {
    
    func commonInit() {
        backgroundColor = .white
        setupSubviews()
        setupConstraints()
    }
    
    func setupSubviews() {
        addSubview(button)
        addSubview(label)
    }

    func setupConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 45.0),
            button.widthAnchor.constraint(equalToConstant: 150.0),
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20.0),
            
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    @objc
    func onTapped() {
        presenter.tapButton()
    }
}
