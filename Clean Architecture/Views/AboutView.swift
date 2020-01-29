//
//  AboutView.swift
//  Clean Architecture
//
//  Created by Alex Dearden on 29/01/2020.
//  Copyright © 2020 Alex Dearden. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Text("About Clean Architecture")
                .font(.title)
            Text("Bob Martin's amazing Clean Architecture book:")
                .font(.body)
        Text("https://www.amazon.co.uk/Clean-Architecture-Craftsmans-Software-Structure/dp/0134494164/")
                .font(.caption)
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
