//
//  ImageCache.swift
//  Rick and Morty
//
//  Created by Gonzalo Vizeu on 15/3/23.
//

import Foundation
import UIKit

final class ImageCache {
    static var current = ImageCache()
    private let apiRepository = APIRepository()
    private init() {}
    private let memoryCache: NSCache = {
        let cache = NSCache<NSString, UIImage>()
        cache.totalCostLimit = 1_024 * 1_024 * 100
        cache.countLimit = 100
        return cache
    }()

    func getImage(from url: String) async -> UIImage? {
        guard let image = memoryCache.object(forKey: url as NSString) else {
            guard let url = URL(string: url) else { return nil }
            return await fetchImage(from: url)
        }
        return image
    }
    
    func add(_ image: UIImage, for url: URL) {
        memoryCache.setObject(image, forKey: url.absoluteString as NSString)
    }

    private func fetchImage(from url: URL) async -> UIImage? {
        do {
            let image = try await apiRepository.fetchImage(for: url)
            guard let image = image else { return nil }
            self.add(image, for: url)
            return image
        } catch {
            return .placeholderError
        }
    }
}
