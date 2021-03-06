//
//  MirrorRoot.swift
//  Roastbook
//
//  Created by Pardeep on 27/04/17.
//  Copyright © 2017 Programming crew. All rights reserved.
//
//  -- auto-generated by JSON2Swift --
//

import Foundation


struct MirrorRoot {
    var content: [MirrorContentItem]
    var totalPages: Int
    var sort: Any?
    var number: Int
    var size: Int
    var numberOfElements: Int
    var totalElements: Int
    var first: Bool
    var last: Bool


    init?(json: [String: Any]?) {
        guard let json = json else {return nil}
        content = (json["content"] as? [[String: Any]] ?? []).flatMap{MirrorContentItem(json: $0)}
        totalPages = json["totalPages"] as? Int ?? 0
        sort = json["sort"]
        number = json["number"] as? Int ?? 0
        size = json["size"] as? Int ?? 0
        numberOfElements = json["numberOfElements"] as? Int ?? 0
        totalElements = json["totalElements"] as? Int ?? 0
        first = json["first"] as? Bool ?? false
        last = json["last"] as? Bool ?? false
    }



    init() {
        self.init(json: [:])!
    }



    init?(data: Data?) {
        guard let data = data else {return nil}
        guard let json = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any] else {return nil}
        self.init(json: json)
    }



    init(content: [MirrorContentItem], totalPages: Int, sort: Any?, number: Int, size: Int, numberOfElements: Int, totalElements: Int, first: Bool, last: Bool) {
        self.content = content
        self.totalPages = totalPages
        self.sort = sort
        self.number = number
        self.size = size
        self.numberOfElements = numberOfElements
        self.totalElements = totalElements
        self.first = first
        self.last = last
    }



    /// This function generate a json dictionary from the model.
    ///
    /// - Parameter useOriginalJsonKey: This parameter take effect only when you have modified a property's name making it different to the original json key. If true, the original json key will be used when generate json dictionary, otherwise, the modified property name will be used as key in the dictionary.
    func jsonDictionary(useOriginalJsonKey: Bool) -> [String: Any] {
        var dict: [String: Any] = [:]
        dict["content"] = content.map{$0.jsonDictionary(useOriginalJsonKey: useOriginalJsonKey)}
        dict["totalPages"] = totalPages
        dict["sort"] = sort
        dict["number"] = number
        dict["size"] = size
        dict["numberOfElements"] = numberOfElements
        dict["totalElements"] = totalElements
        dict["first"] = first
        dict["last"] = last
        return dict
    }



}



