//
//  ContentViewModel.swift
//  Art-Inspector
//
//  Created by Swapna Dirisala on 7/30/25.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var droppedURLs: [URL] = []
    @Published var selected: URL?
    
    func handleDrop(_ urls: [URL]) {
        droppedURLs.append(contentsOf: urls)
    }
    
    func selectFile(_ url: URL) {
        selected = url
    }
}

