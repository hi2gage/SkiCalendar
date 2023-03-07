//
//  SquareColorPickerView.swift
//  SkiCalendar
//
//  Created by Gage Halverson on 3/7/23.
//

import SwiftUI

struct SquareColorPickerView: View {
    @Binding var color: ColorDescription

    var body: some View {
        HStack {
            Color(hex: color.color!)
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(10.0)
                .overlay(
                    ColorPicker(
                        "",
                        selection: Binding(
                            get: { Color(hex: color.color ?? "") },
                            set: { color.color = $0.toHex() }
                        ),
                        supportsOpacity: false
                    )
                    .labelsHidden().opacity(0.015)
                )

            TextField("Placeholder", text: Binding(
                get: { color.textDescription ?? "" },
                set: { color.textDescription = $0 }
            ))
        }
    }
}
