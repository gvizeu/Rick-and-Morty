//
//  FilterOptionsView.swift
//  Rick and Morty
//
//  Created by Gonzalo Vizeu on 17/3/23.
//

import SwiftUI

struct FilterOptionsView: View {
    @Binding var filterOptions: CharacterFilter
    @Binding var isPresented: Bool
    var onApplyFilters: () -> Void
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                RickText(.filterOptions)
                    .font(.primary(size: 28))
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 12) {
                        section(.status, option: $filterOptions.status)
                        section(.gender, option: $filterOptions.gender)
                    }
                }
                bottomBar
            }
            .padding()
            .background(Image.rickMortyBgSec.resizable().ignoresSafeArea())
        }
    }
    
    @ViewBuilder
    private var bottomBar: some View {
        HStack {
            HStack {
                Button(action: { shouldApplyChanges(false) },
                       label: { RickText(.reset).font(.system(size: 18)) })
                Spacer()
                Button(action: { shouldApplyChanges(false) },
                       label: { RickText(.done).font(.system(size: 18)) })
            }
            .padding(.top, 16)
            .frame(maxWidth: .infinity)
        }
    }
    
    private func section<E: CaseIterable>(_ name: String, option: Binding<E?>) -> some View where E: RawRepresentable, E.RawValue == String {
        VStack {
            Text(name).font(.title3)
                .padding(.bottom)
            HStack {
                ForEach(Array(E.allCases), id: \.rawValue) { status in
                    FilterOptionRow(option: status, isSelected: option)
                        .frame(maxWidth: .infinity)
                }
            }
        }
    }
    
    private func shouldApplyChanges(_ apply: Bool) {
        apply ? filterOptions.reset() : onApplyFilters()
        self.isPresented = false
        
    }
}

struct FilterOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        FilterOptionsView(filterOptions: .constant(CharacterFilter()), isPresented: .constant(true), onApplyFilters: {})
    }
}
