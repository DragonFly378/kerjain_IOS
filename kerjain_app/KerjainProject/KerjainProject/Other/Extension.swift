//
//  Extension.swift
//  KerjainProject
//
//  Created by Dragonfly378 on 24/8/25.
//

import Foundation


extension Encodable{
    
    func asDictionary() -> [String: Any]{
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
