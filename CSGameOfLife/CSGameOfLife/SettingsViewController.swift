//
//  SettingsViewController.swift
//  CSGameOfLife
//
//  Created by Ryan Murphy on 5/27/20.
//  Copyright © 2020 Ryan Murphy. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var grid: Grid!
    var speedSlider = UISlider()
    var stackView = UIStackView()
    var exitButton = UIButton()
    var cellColorButtons = [UIButton]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    init(grid: Grid){
        super.init(nibName: nil, bundle: nil)
        self.grid = grid
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        view.translatesAutoresizingMaskIntoConstraints = false
        speedSlider.translatesAutoresizingMaskIntoConstraints = false
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 0, alpha: 0.50)
        configureExitButton()
        configureSpeedSlider()
        configureStackView()
    }
    
    private func configureExitButton() {
        view.addSubview(exitButton)
        exitButton.addTarget(self, action: #selector(exitButtonPressed), for: .touchUpInside)
        exitButton.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        
        NSLayoutConstraint.activate([
                   exitButton.topAnchor.constraint(equalTo: view.topAnchor),
                   exitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   exitButton.heightAnchor.constraint(equalToConstant: 100),
                   exitButton.widthAnchor.constraint(equalTo: exitButton.heightAnchor)
               ])
    }
    
    private func configureSpeedSlider() {
        view.addSubview(speedSlider)
        speedSlider.minimumValue = 0.03
        speedSlider.maximumValue = 2.0
        speedSlider.value = 1
        speedSlider.addTarget(self, action: #selector(speedsliderChanged), for: .valueChanged)
        
        NSLayoutConstraint.activate([
            speedSlider.topAnchor.constraint(equalTo: exitButton.topAnchor, constant: 80),
            speedSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            speedSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            speedSlider.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func configureStackView() {
        view.addSubview(stackView)
        stackView.axis = .horizontal
        configureStackViewConstraints()
        stackView.distribution = .fillEqually
        
        for i in 1...4 {
            let button = UIButton()
            button.tag = i
            button.addTarget(self, action: #selector(colorChanged(sender:)), for: .touchUpInside)
            switch i {
                case 1:
                    button.backgroundColor = .systemGreen
                case 2:
                    button.backgroundColor = .systemBlue
                case 3:
                    button.backgroundColor = .systemRed
                case 4:
                    button.backgroundColor = .black
                default:
                    button.backgroundColor = .black
            }
            cellColorButtons.append(button)
            stackView.addArrangedSubview(button)
            if i == Settings.shared.cellColor.rawValue {
                colorChanged(sender: button)
            }
        }
        
    }
    
    @objc func exitButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func colorChanged(sender: UIButton) {
        guard let color = CellColor.init(rawValue: sender.tag) else { return }
        Settings.shared.cellColor = color
        for button in cellColorButtons {
            button.layer.borderWidth = 0
            if Settings.shared.cellColor.rawValue == button.tag {
                button.layer.borderWidth = 2
                button.layer.borderColor = UIColor.yellow.cgColor
            }
        }
    }
    
    private func configureStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: speedSlider.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    @objc func speedsliderChanged(){
        grid?.speed = speedSlider.value
    }
    
}
