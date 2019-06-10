//
//  ContentView.swift
//  SwiftUI-MVVM
//
//  Created by Yusuke Kita on 6/5/19.
//  Copyright © 2019 Yusuke Kita. All rights reserved.
//

import SwiftUI

struct RepositoryListView : View {
    @ObjectBinding var viewModel: RepositoryListViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.repositories) { repository in
                RepositoryListRow(repository: repository)
            }
            .presentation($viewModel.isErrorShown) { () -> Alert in
                Alert(title: Text("Error"), message: Text(viewModel.errorMessage))
            }
            .navigationBarTitle(Text("Repositories"))
        }
        .onAppear(perform: { self.viewModel.apply(.onAppear) })
    }
}

#if DEBUG
struct RepositoryListView_Previews : PreviewProvider {
    static var previews: some View {
        RepositoryListView(viewModel: .init())
    }
}
#endif
