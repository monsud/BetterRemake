//
//  OddsAPI.swift
//  BetterRemake
//
//  Created by Davide Monsurrocco on 10/12/2019.
//  Copyright © 2019 monsud. All rights reserved.
//

import Foundation

class OddsApi {
    private static let singleton = OddsApi()
    
    var odds: [Odds] = []

    private init() {
    }
    
    static func getApi() -> OddsApi {
        return singleton
    }
    
    func getOdds() -> [Odds] {
        return odds
    }
    
    /*
    func appendOdds(odds: Odds) {
        odds.append(odds)
    }
 */
    
    func getNumberOfNews() -> Int {
        return odds.count
    }

}
