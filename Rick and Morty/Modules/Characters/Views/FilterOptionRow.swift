//
//  FilterOptionRow.swift
//  Rick and Morty
//
//  Created by Gonzalo Vizeu on 17/3/23.
//

import SwiftUI

struct FilterOptionRow<E: RawRepresentable>: View where E.RawValue == String {
    var option: E
    @Binding var isSelected: E?
    
    init(option: E, isSelected: Binding<E?>) {
        self.option = option
        self._isSelected = isSelected
    }
    
    var body: some View {
        Button(action: {
            if let optionSelected = isSelected, optionSelected == option {
                isSelected = nil
            } else {
                isSelected = option
            }
        }) {
            VStack(spacing: 0) {
                Text(option.rawValue)
                    .font(.primary(size: 18))
                    .lineLimit(1)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 8)
                icon.frame(width: 18, height: 18)
                
            }
            .tint(Color.black)
        }
        
    }
    @ViewBuilder private var icon: some View {
        if let optionSelected = isSelected, optionSelected == option {
            Image.mortyOk.resizable()
        } else {
            Image.circleIcon
        }
    }
}

struct FilterOptionRow_Previews: PreviewProvider {
    static var previews: some View {
        FilterOptionRow(option: Status.alive, isSelected: .constant(.alive))
        FilterOptionRow(option: Status.alive, isSelected: .constant(.dead))
    }
}
