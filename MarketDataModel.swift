//
//  MarketDataModel.swift
//  Crypto-Tracker
//
//  Created by Sabri Çetin on 17.01.2025.
//

import Foundation

// JSON DATA:
/*
 
 URL: "https://api.coingecko.com/api/v3/global"
 
 JSON Response:
 
 {
 {
   "data": {
     "active_cryptocurrencies": 16733,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 1203,
     "total_market_cap": {
       "btc": 36692025.1899175,
       "eth": 1100224584.06971,
       "ltc": 27384512061.7577,
       "bch": 7828026286.03381,
       "bnb": 5206166431.64532,
       "eos": 3789333587769.54,
       "xrp": 1149600770606.12,
       "xlm": 7749308074401.69,
       "link": 156151792925.937,
       "dot": 505809892049.326,
       "yfi": 441444309.824582,
       "usd": 3751351705612.96,
       "aed": 13778696057957.9,
       "ars": 3.90607995806268e+15,
       "aud": 6037703035039.72,
       "bdt": 456096494196127,
       "bhd": 1414008252451.81,
       "bmd": 3751351705612.96,
       "brl": 22729439984309,
       "cad": 5403019342670.48,
       "chf": 3413853846714.08,
       "clp": 3802220034741077,
       "cny": 27493281515266.9,
       "czk": 92093981259124,
       "dkk": 27164055386878.9,
       "eur": 3640971933027.01,
       "gbp": 3075365630964.92,
       "gel": 10653838843940.8,
       "hkd": 29205698541845.1,
       "huf": 1.50583224517733e+15,
       "idr": 61467369498045290,
       "ils": 13516397795349.7,
       "inr": 324893058324754,
       "jpy": 583042272189641,
       "krw": 5465401331707510,
       "kwd": 1157216974147.49,
       "lkr": 1.11224429561938e+15,
       "mmk": 7870335878376002,
       "mxn": 78383961196840.7,
       "myr": 16899839433786.4,
       "ngn": 5838678821650131,
       "nok": 42641611086350.9,
       "nzd": 6694924848456.29,
       "php": 219808577514539,
       "pkr": 1.04628257546591e+15,
       "pln": 15528281477235.3,
       "rub": 385246995354052,
       "sar": 14075630550864,
       "sek": 41836278404893.3,
       "sgd": 5124684051520.81,
       "thb": 129121525707198,
       "try": 133429510481594,
       "twd": 123443423495307,
       "uah": 158252628620377,
       "vef": 375622846283.026,
       "vnd": 95205545697172200,
       "zar": 70113581172578.2,
       "xdr": 2893511354331.92,
       "xag": 122745428240.202,
       "xau": 1383573536.06417,
       "bits": 36692025189917.5,
       "sats": 3669202518991747
     },
     "total_volume": {
       "btc": 1878587.02025885,
       "eth": 56330159.2731655,
       "ltc": 1402053679.21409,
       "bch": 400785415.87912,
       "bnb": 266549383.229022,
       "eos": 194009266497.802,
       "xrp": 58858159912.4614,
       "xlm": 396755139276.38,
       "link": 7994781696.08968,
       "dot": 25896850691.782,
       "yfi": 22601411.2415759,
       "usd": 192064640371.143,
       "aed": 705452463760.007,
       "ars": 199986538527891,
       "aud": 309123044996.705,
       "bdt": 23351585243592.8,
       "bhd": 72395501089.0161,
       "bmd": 192064640371.143,
       "brl": 1163719656008.76,
       "cad": 276628012621.592,
       "chf": 174785160870.873,
       "clp": 194669036894576,
       "cny": 1407622542816.07,
       "czk": 4715099723764.84,
       "dkk": 1390766565847.82,
       "eur": 186413330392.863,
       "gbp": 157454976305.544,
       "gel": 545463578654.046,
       "hkd": 1495296209852.69,
       "huf": 77096777728548.8,
       "idr": 3.14705448693012e+15,
       "ils": 692023112040.616,
       "inr": 16634129056163.4,
       "jpy": 29851054531017.3,
       "krw": 279821894515446,
       "kwd": 59248100261.6903,
       "lkr": 56945553871517.3,
       "mmk": 402951615498658,
       "mxn": 4013163387376.1,
       "myr": 865251204872,
       "ngn": 298933247566455,
       "nok": 2183198575034.14,
       "nzd": 342772001731.168,
       "php": 11253931570226.9,
       "pkr": 53568394102524.8,
       "pln": 795029107253.424,
       "rub": 19724177156204.3,
       "sar": 720655148303.945,
       "sek": 2141966522168.55,
       "sgd": 262377584564.615,
       "thb": 6610864921574.75,
       "try": 6831428497413.44,
       "twd": 6320153000939.38,
       "uah": 8102341926053.66,
       "vef": 19231432440.3626,
       "vnd": 4874408034924032,
       "zar": 3589729998628.27,
       "xdr": 148144258734.272,
       "xag": 6284416493.62872,
       "xau": 70837280.661685,
       "bits": 1878587020258.85,
       "sats": 187858702025885
     },
     "market_cap_percentage": {
       "btc": 53.9930159141062,
       "eth": 10.9542610800551,
       "xrp": 5.01917511845362,
       "usdt": 3.66714577379858,
       "sol": 2.80517946881319,
       "bnb": 2.80331944428432,
       "doge": 1.64435672713858,
       "usdc": 1.24037211861781,
       "ada": 1.07339605791013,
       "steth": 0.871208238506353
     },
     "market_cap_change_percentage_24h_usd": 2.33456898742883,
     "updated_at": 1737105225
   }
 }
 */


struct GlobalData : Codable {
    let data: MarketDataModel?
}


struct MarketDataModel: Codable {
    
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys : String , CodingKey {
        
        case totalMarketCap = "total_market_cap"
        case totalVolume  = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"

    }
    var marketCap : String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var  volume : String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    var btcDominance : String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return String(format: "%.2f%%", item.value) 
            //return item.value.asNumberString()
        }
        return ""
    }
    
   
}
