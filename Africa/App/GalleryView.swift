//
//  GalleryView.swift
//  Africa
//
//  Created by Naman Vaishnav on 31/07/22.
//

import SwiftUI

struct GalleryView: View {
    @State private var  selectedAnimal: String = "lion"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    // SIMPLE GRID DEFINATION
//    let gridLayout : [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    
    // EFFICIENT GRID DEFINITION
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    //  DYNAMIC GRID LAYOUT
    @State private var gridLayout : [GridItem] = [GridItem (.flexible())]
    @State private var gridColumn:   Double = 3.0
    @State private var value1: Double = 0
    
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
        
    }
     
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack (alignment: .center, spacing: 30){
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white,lineWidth: 8))
                
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) { value in
                        value1 = value
                        gridSwitch()
                    }
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    }
                } // LAZY GRID
            } // GRID
            .animation(Animation.easeIn(duration: 0.5),value: value1)
            .onAppear {
                gridSwitch()
            }
            .padding(.top, 50)
        } // SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
        .ignoresSafeArea()
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
