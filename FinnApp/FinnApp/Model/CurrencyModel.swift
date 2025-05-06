//
//  CurrencyModel.swift
//  FinnApp
//
//  Created by Phillip on 06.05.2025.
//

import Foundation

enum Currency {
    case usd
    case eur
    case rub
    case gbp
    case jpy
    case chf
    case cad
    case aud
    case nzd
    case sek
    case nok
    case dkk
    case pln
    case czk
    case huf
    
    var symbol: String {
        switch self {
        case .usd: return "$"
        case .eur: return "€"
        case .rub: return "₽"
        case .gbp: return "£"
        case .jpy: return "¥"
        case .chf: return "CHF"
        case .cad: return "C$"
        case .aud: return "A$"
        case .nzd: return "NZ$"
        case .sek: return "SEK"
        case .nok: return "NOK"
        case .dkk: return "DKK"
        case .pln: return "zł"
        case .czk: return "Kč"
        case .huf: return "Ft"
        }
    }
}
