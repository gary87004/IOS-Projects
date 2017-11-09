//
//  ParseJsonStruct.swift
//  Pets
//
//  Created by  Yo on 2017/11/4.
//  Copyright © 2017年  Yo. All rights reserved.
//

import UIKit

struct Result: Decodable {
    var result: Layer1?
}
struct Layer1: Decodable {
    var offset: Int?
    var limit: Int?
    var count: Int?
    var sort: String?
    var results: [Layer2]?
}
struct Layer2: Decodable {

    var _id: String?
    var Name: String?
    var Sex: String?
    var `Type`: String?
    var Build: String?
    var Age: String?
    var Variety: String?
    var Reason: String?
    var AcceptNum: String?
    var ChipNum: String?
    var IsSterilization: String?
    var HairType: String?
    var Note: String?
    var Resettlement: String?
    var Phone: String?
    var Email: String?
    var ChildreAnlong: String?
    var AnimalAnlong: String?
    var Bodyweight: String?
    var ImageName: String?
    
}



