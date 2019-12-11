//
//  Odds.swift
//  BetterRemake
//
//  Created by Davide Monsurrocco on 10/12/2019.
//  Copyright © 2019 monsud. All rights reserved.
//

import Foundation
import UIKit

class Odds: NSObject {
    var teamOne: String?
    var teamTwo: String?
    var resultOne: NSInteger?
    var resultTwo: NSInteger?
    var category: [String]?
    var data: String?
}

let category : [String] = ["Serie A", "Premier League", "Bundesliga", "Liga", "Ligue 1"]
//let news: [Notizia] = [Notizia(temaPrincipale: "Serie A", testoPrincipale: "Si parte, ricomincia il campionato di Serie A", immagineNews: UIImageView, categoriaDiAppartenenza: ["Serie A", "Ultime notizie"], data: "10 min fa")]
