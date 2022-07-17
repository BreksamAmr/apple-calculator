//
//  ContentView.swift
//  Shared
//
//  Created by Cofo on 17/07/2022.
//

import SwiftUI

enum calcButtons: String{
    case ac = "C"
    case sign = "+/-"
    case percent = "%"
    case div = "÷"
    case multi = "x"
    case sub = "-"
    case add = "+"
    case equal = "="
    case decimal = "."
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
}

enum operation{
    case add,sub,multi,div, none
}



struct ContentView: View {
    let buttons: [[calcButtons]] = [
        [.ac,.sign,.percent,.div],
        [.seven,.eight,.nine,.multi],
        [.four,.five,.six,.sub],
        [.one,.two,.three,.add],
        [.zero,.decimal,.equal],
    ]
    
    @State var click = "0"
    @State var value  =  0
    @State var op: operation = .none

    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Text(click)
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 85))
                }
                .padding()
                ForEach(buttons,id:\.self)
                {
                    row in HStack (spacing: 10){
                       ForEach(row,id:\.self)
                        {
                            item in Button(action:{
                                self.buttonTap(button: item)
                            }, label: {
                                Text(item.rawValue)
                                    //.bold()
                                    .font(.system(size: 35))
                                    .frame(width: self.buttonWidth(item: item), height: self.buttonHeight(item: item))
                                    .background(self.buttonColor(item: item))
                                    .foregroundColor(.white)
                                    .cornerRadius(self.buttonHeight(item: item)/2)
                                
                            })
                            
                        }
                    }
                }
            }
        }
    }
    
    func buttonTap (button: calcButtons)
    {
        switch button {
        case .ac:
            self.click = "0"
            break
        case .percent, .sign, .decimal:
            break
        case .div, .multi, .sub, .add, .equal:
            if(button != .equal)
            {
                self.value = Int(self.click) ?? 0
            }
            if button == .div
            {
                self.op = .div
            }
            else if button == .multi
            {
                self.op = .multi
            }
            else if button == .sub
            {
                self.op = .sub
            }
            else if button == .add
            {
                self.op = .add
            }
            else if button == .equal
            {
                let running = self.value
                let tapped = Int(self.click) ?? 0
                switch self.op {
                case .add:
                    self.click = "\(running + tapped)"
                case .sub:
                    self.click = "\(running - tapped)"
                case .multi:
                    self.click = "\(running * tapped)"
                case .div:
                    self.click = "\(running / tapped)"
                case .none:
                    break
                }
            }
            if button != .equal
            {
                self.click = "0"
            }
        default:
            let number = button.rawValue
            if self.click == "0"
            {
                click = number
            }
            else{
                self.click = "\(self.click)\(number)"
            }
        }
    }
    
    func buttonColor (item: calcButtons)->Color{
        switch item {
            case .ac , .sign , .percent:
                return .gray
            case .div, .multi, .sub, .add, .equal:
                return .orange
            default:
            return Color(red: 80/255, green: 80/255, blue: 80/255)
        }
    }
    
    func buttonWidth (item: calcButtons)->CGFloat{
        if (item == calcButtons.zero)
        {
            return (UIScreen.main.bounds.width - (4*15))/2
        }
        return (UIScreen.main.bounds.width - (5*15))/4
    }
    func buttonHeight (item: calcButtons)->CGFloat{
        return (UIScreen.main.bounds.width - (5*15))/4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
