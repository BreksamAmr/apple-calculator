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
    @State var value  =  0.0
    @State var op: operation = .none
    @State var final = 0.0
    @State var running = 0.0
    @State var tapped = 0.0
    @State var before: Double = 0.0
    @State var flag = false

    var body: some View {
        ZStack{
            Color(red: 248/255, green: 234/255, blue: 253/255).edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                HStack(spacing: 0.0){
                    Spacer()
                    Text(click)
                        .foregroundColor(.black)
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
                                //self.click = "\(final)"
                            }, label: {
                                Text(item.rawValue)
                                    //.bold()
                                    .font(.system(size: 35))
                                    .frame(width: self.buttonWidth(item: item), height: self.buttonHeight(item: item))
                                    .background(self.buttonColor(item: item))
                                    .foregroundColor(.black)
                                    .cornerRadius(self.buttonHeight(item: item)/2)
                                
                            })
                            
                        }
                    }
                }
            }
            .padding()
        }
    }
    
    func buttonTap (button: calcButtons)
    {
        switch button {
        case .ac:
            self.click = "0"
            self.final = 0
            self.flag = false
            self.op = .none
            break
        case .percent, .sign, .decimal:
            if button == .percent
            {
                let x = Double(self.click) ?? 0
                self.click = "\(x / 100.0)"
            }
            if button == .sign
            {
                let x = Double(self.click) ?? 0
                self.click = "\(-(x))"
            }
            else if button == .decimal
            {
                var flagPoint = false
                for char in self.click
                {
                    if char == "."
                    {
                        self.click = "0."
                        flagPoint = true
                        break
                    }
                    
                }
                if flagPoint == false
                {
                    self.click += "."
                }
            }
            self.flag = false
            
        case .div, .multi, .sub, .add, .equal:
            self.before = self.value
            if(button != .equal)
            {
                self.value = Double(self.click) ?? 0.0
                self.flag = true
            }
            if self.op != .none
            {
                running = self.before
                tapped = Double(self.click) ?? 0
            }
            if button == .div
            {
                
                if self.op != .none
                {
                    switch self.op {
                    case .add:
                        if final == 0
                        {
                            final = running + tapped
                        }
                        else
                        {
                            final += tapped
                        }
                    case .sub:
                        if final == 0
                        {
                            final = running - tapped
                        }
                        else
                        {
                            final -= tapped
                        }
                    case .multi:
                        if final == 0
                        {
                            final = running * tapped
                        }
                        else
                        {
                            final *= tapped
                        }
                    case .div:
                        if final == 0
                        {
                            final = running / tapped
                        }
                        else
                        {
                            final /= tapped
                        }
                    case .none:
                        break
                    }
                    
                    self.click = "\(final)"
                }

                self.op = .div
            }
            else if button == .multi
            {
                if self.op != .none
                {
                    switch self.op {
                    case .add:
                        if final == 0
                        {
                            final = running + tapped
                        }
                        else
                        {
                            final += tapped
                        }
                    case .sub:
                        if final == 0
                        {
                            final = running - tapped
                        }
                        else
                        {
                            final -= tapped
                        }
                    case .multi:
                        if final == 0
                        {
                            final = running * tapped
                        }
                        else
                        {
                            final *= tapped
                        }
                    case .div:
                        if final == 0
                        {
                            final = running / tapped
                        }
                        else
                        {
                            final /= tapped
                        }
                    case .none:
                        break
                    }
                    
                    self.click = "\(final)"
                }
                
                self.op = .multi
            }
            else if button == .sub
            {
                if self.op != .none
                {
                    switch self.op {
                    case .add:
                        if final == 0
                        {
                            final = running + tapped
                        }
                        else
                        {
                            final += tapped
                        }
                    case .sub:
                        if final == 0
                        {
                            final = running - tapped
                        }
                        else
                        {
                            final -= tapped
                        }
                    case .multi:
                        if final == 0
                        {
                            final = running * tapped
                        }
                        else
                        {
                            final *= tapped
                        }
                    case .div:
                        if final == 0
                        {
                            final = running / tapped
                        }
                        else
                        {
                            final /= tapped
                        }
                    case .none:
                        break
                    }
                    
                    self.click = "\(final)"
                }
                
                self.op = .sub
            }
            else if button == .add
            {
                if self.op != .none
                {
                    //self.click = "\(final)"
                    switch self.op {
                    case .add:
                        if final == 0
                        {
                            final = running + tapped
                        }
                        else
                        {
                            final += tapped
                        }
                    case .sub:
                        if final == 0
                        {
                            final = running - tapped
                        }
                        else
                        {
                            final -= tapped
                        }
                    case .multi:
                        if final == 0
                        {
                            final = running * tapped
                        }
                        else
                        {
                            final *= tapped
                        }
                    case .div:
                        if final == 0
                        {
                            final = running / tapped
                        }
                        else
                        {
                            final /= tapped
                        }
                    case .none:
                        break
                    }
                    
                    self.click = "\(final)"
                }
               // else {
                   // self.click = "0"
               // }
                self.op = .add
            }
            else if button == .equal
            {
                //let running = self.value
                //let tapped = Int(self.click) ?? 0
                switch self.op {
                case .add:
                    if final != 0
                    {
                        self.click = "\(final + tapped)"
                    }
                    else
                    {
                        self.click = "\(running + tapped)"
                    }
                case .sub:
                    if final != 0
                    {
                        self.click = "\(final - tapped)"
                    }
                    else
                    {
                        self.click = "\(running - tapped)"
                    }
                case .multi:
                    if final != 0
                    {
                        self.click = "\(final * tapped)"
                    }
                    else
                    {
                        self.click = "\(running * tapped)"
                    }
                case .div:
                    if final != 0
                    {
                        self.click = "\(final / tapped)"
                    }
                    else
                    {
                        self.click = "\(running / tapped)"
                    }
                case .none:
                    break
                }
                
                self.op = .none
                final = 0
            }
            /*if button != .equal
            {
                if final == 0
                {
                    self.click = "\(tapped)"
            
                }
                else
                {
                    self.click = "\(final)"
                }
            }*/
            default:
            
            let number = button.rawValue
            if flag
            {
                self.click = "0"
            }
            if self.click == "0"
            {
                click = number
            }
            else{
                self.click = "\(self.click)\(number)"
            }
            self.flag = false
        }
    }
    
    func buttonColor (item: calcButtons)->Color{
        switch item {
            case .ac , .sign , .percent:
                return Color(red: 240/255, green: 192/255, blue: 257/255)
            case .div, .multi, .sub, .add, .equal:
                return Color(red: 202/255, green: 102/255, blue: 186/255)
            default:
            return Color(red: 187/255, green: 131/255, blue: 207/255)
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
            .previewInterfaceOrientation(.portrait)
    }
}
