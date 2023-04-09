//
//  Web.swift
//  SpaceX
//
//  Created by Caleb Danielsen on 07.04.2023.
//

protocol WebManagerDelegate {
    func didUpdate(viewModels: [ViewModel]?, text: String, messageStatus: MessageStatus)
}
