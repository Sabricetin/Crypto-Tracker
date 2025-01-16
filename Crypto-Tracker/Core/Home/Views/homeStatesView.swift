//
//  homeStatesView.swift
//  Crypto-Tracker
//
//  Created by Sabri Çetin on 17.01.2025.
//

import SwiftUI

struct homeStatesView: View {
    
  
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var  showPortfolio : Bool
    var body: some View {
        HStack {
            ForEach(vm.statistic) { stat in
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width , alignment: showPortfolio ? .trailing : .leading)
    }
}

struct HomeStatsView_Previews: PreviewProvider {
    static var previews: some View {
        homeStatesView(showPortfolio: .constant(false))
            .environmentObject(dev.homeVM)
    }
}
