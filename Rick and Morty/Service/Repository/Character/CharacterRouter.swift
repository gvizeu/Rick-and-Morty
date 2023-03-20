//
//  CharacterRouter.swift
//  Rick and Morty
//
//  Created by Gonzalo Vizeu on 13/3/23.
//

import Foundation
struct CharacterFilter: Codable {
    var page: Int = 1
    var name: String = ""
    var status: Status?
    var species: String?
    var gender: Gender?
    
    var toDictionary: [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else { return  [String: Any]() }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] else { return  [String: Any]() }
        return json
    }

    mutating func reset() {
        self.status = nil
        self.gender = nil
    }
}


enum CharacterRouter: APIRouter {

    case all(page: Int?)
    case getSingle(id: Int)
    case getMutiple(ids: [Int])
    case filter(filter: CharacterFilter)
    
    var path: String {
        switch self {
        case .all, .filter: return "/character"
        case .getSingle(let id): return "/character/\(id)"
        case .getMutiple(let ids): return "/character/\(ids)"
        }
    }
    
        var method: HTTPMethod {
            switch self {
            case .all, .getSingle, .getMutiple, .filter:
                return .GET
            }
        }
    
        var parameters: [String : Any]? {
            switch self {
            case .all(let page):
                var params = [String: Any]()
                params["page"] = page
                return params
            case .filter(let filter):
                var params = filter.toDictionary
                if let name = (params["name"] as? String), name.isEmpty {
                    params.removeValue(forKey: "name")
                }
                return params
            default: break
            }
            return nil
        }
}
