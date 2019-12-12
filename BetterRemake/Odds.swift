//
//  Odds.swift
//  BetterRemake
//
//  Created by Davide Monsurrocco on 10/12/2019.
//  Copyright © 2019 monsud. All rights reserved.
//

import Foundation
import UIKit

/*
class Odds: NSObject {
    var teamOne: String?
    var teamTwo: String?
    var resultOne: NSInteger?
    var resultTwo: NSInteger?
    var category: [String]?
    var data: String?
}

let category : [String] = ["Serie A", "Premier League", "Bundesliga", "Liga", "Ligue 1"]
 */
struct SportData: Codable {
    let data: [Sports]
}

struct Sports {
    let group: String?
    let details: String?
    let title: String?
}

extension Sports: Codable {
    enum CodingKeys: String, CodingKey {
        case group
        case details
        case title = "display_title"
    }
}

struct Odds {
    let teams: [String]
    let home_team: String?
    let sites: [String]
}

struct Sites {
    let site_nice: String?
    let odds: [Numbers]
}

struct Numbers {
    let homeodd: Int?
    let drawodd: Int?
    let awayodd: Int?
}

extension Odds: Codable {
    enum CodingKeys: String, CodingKey {
        case teams
        case home_team
        case sites
    }
}

struct Wrapper<T: Decodable>: Decodable {
    let items: [T]
}
