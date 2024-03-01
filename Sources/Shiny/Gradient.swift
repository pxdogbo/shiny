//
//  Gradient.swift
//
//
//  Created by Michael Verges on 7/31/20.
//

import SwiftUI

#if os(iOS)
internal extension UIColor {
    var redValue: CGFloat{ return CIColor(color: self).red }
    var greenValue: CGFloat{ return CIColor(color: self).green }
    var blueValue: CGFloat{ return CIColor(color: self).blue }
    var alphaValue: CGFloat{ return CIColor(color: self).alpha }
}

public extension Gradient {
    
    static var iridescent: Gradient {
        Gradient(colors: [
            Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 0.2),
            Color(red: 0.0, green: 0.5, blue: 1.0, opacity: 0.2),
            Color(red: 1.0, green: 0.5, blue: 1.0, opacity: 0.4),
            Color(red: 0.5, green: 1.0, blue: 1.0, opacity: 0.6),
            Color(red: 0.5, green: 1.0, blue: 1.0, opacity: 0.6),
            Color(red: 1.0, green: 0.5, blue: 1.0, opacity: 0.4),
            Color(red: 0.0, green: 0.5, blue: 1.0, opacity: 0.2),
            Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 0.2),
//            Color.clear
        ])
    }
    
    static var rainbow: Gradient {
        Gradient(colors: [
            .red, .red, .red,
            .red, .orange, .yellow, .green, .blue, .purple, .pink,
            .red, .orange, .yellow, .green, .blue, .purple, .pink,
            .red, .orange, .yellow, .green, .blue, .purple, .pink
        ])
    }
    
    static var dice: Gradient {
        Gradient(colors: [
            Color(#colorLiteral(red: 0, green: 0.05098039284348488, blue: 0.3921568691730499, alpha: 1)),
            Color(#colorLiteral(red: 0.08627451211214066, green: 0.10588235408067703, blue: 0.6352941393852234, alpha: 1)),
            Color(#colorLiteral(red: 0.15294118225574493, green: 0.12156862765550613, blue: 0.7764706015586853, alpha: 1)),
            Color(#colorLiteral(red: 0.3137255012989044, green: 0.18039216101169586, blue: 0.8705882430076599, alpha: 1)),
            Color(#colorLiteral(red: 0.3843137323856354, green: 0.21568627655506134, blue: 0.9019607901573181, alpha: 1)),
            Color(#colorLiteral(red: 0, green: 0.05098039284348488, blue: 0.3921568691730499, alpha: 1)),
            Color(#colorLiteral(red: 0.08627451211214066, green: 0.10588235408067703, blue: 0.6352941393852234, alpha: 1)),
            Color(#colorLiteral(red: 0.15294118225574493, green: 0.12156862765550613, blue: 0.7764706015586853, alpha: 1)),
            Color(#colorLiteral(red: 0.3137255012989044, green: 0.18039216101169586, blue: 0.8705882430076599, alpha: 1)),
            Color(#colorLiteral(red: 0.3843137323856354, green: 0.21568627655506134, blue: 0.9019607901573181, alpha: 1)),
            Color(#colorLiteral(red: 0, green: 0.05098039284348488, blue: 0.3921568691730499, alpha: 1)),
            Color(#colorLiteral(red: 0.08627451211214066, green: 0.10588235408067703, blue: 0.6352941393852234, alpha: 1)),
            Color(#colorLiteral(red: 0.15294118225574493, green: 0.12156862765550613, blue: 0.7764706015586853, alpha: 1)),
            Color(#colorLiteral(red: 0.3137255012989044, green: 0.18039216101169586, blue: 0.8705882430076599, alpha: 1)),
            Color(#colorLiteral(red: 0.3843137323856354, green: 0.21568627655506134, blue: 0.9019607901573181, alpha: 1)),
            Color(#colorLiteral(red: 0, green: 0.05098039284348488, blue: 0.3921568691730499, alpha: 1)),
            Color(#colorLiteral(red: 0.08627451211214066, green: 0.10588235408067703, blue: 0.6352941393852234, alpha: 1)),
            Color(#colorLiteral(red: 0.15294118225574493, green: 0.12156862765550613, blue: 0.7764706015586853, alpha: 1)),
            Color(#colorLiteral(red: 0.3137255012989044, green: 0.18039216101169586, blue: 0.8705882430076599, alpha: 1)),
            Color(#colorLiteral(red: 0.3843137323856354, green: 0.21568627655506134, blue: 0.9019607901573181, alpha: 1))
        ])
    }

    
    static func matte(_ color: UIColor, intensity: CGFloat = 0.5) -> Gradient {
        let i = min(max(intensity, 0), 1)
        
        let red = color.redValue
        let green = color.greenValue
        let blue = color.blueValue
        
        let newRed = red+(1-red)*(0.7)
        let newGreen = green+(1-green)*(0.7)
        let newBlue = blue+(1-blue)*(0.7)
        
        let colors = [
            UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0 * i),
            UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: 0.85 * i),
            UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: 0.6 * i),
            UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: 0.3 * i),
            UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: 0.0 * i),
            color
        ]
        
        return Gradient(colors: colors.map { Color($0) })
    }
    
    static func glossy(_ color: UIColor, intensity: CGFloat = 0.5) -> Gradient {
        
        let i = min(max(intensity, 0), 1)
        
        let colors = [
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.90 * i),
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.90 * i),
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.80 * i),
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.50 * i),
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.10 * i),
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.00 * i),
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.00 * i),
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.00 * i),
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.00 * i),
            color
        ]
        
        return Gradient(colors: colors.map { Color($0) })
    }
    
    static func hyperGlossy(_ color: UIColor, intensity: CGFloat = 1.0) -> Gradient {
        
        let i = min(max(intensity, 0), 1)
        
        let colors = [
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.90 * i),
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.70 * i),
            UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.00),
            color
        ]
        
        return Gradient(colors: colors.map { Color($0) })
    }
}
#elseif os(macOS)
internal extension NSColor {
    var redValue: CGFloat{ return CIColor(color: self)?.red ?? 0 }
    var greenValue: CGFloat{ return CIColor(color: self)?.green ?? 0 }
    var blueValue: CGFloat{ return CIColor(color: self)?.blue ?? 0 }
    var alphaValue: CGFloat{ return CIColor(color: self)?.alpha ?? 0 }
}

public extension Gradient {
    
    static var iridescent: Gradient {
        Gradient(colors: [
            Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 0.2),
            Color(red: 0.0, green: 0.5, blue: 1.0, opacity: 0.2),
            Color(red: 1.0, green: 0.5, blue: 1.0, opacity: 0.4),
            Color(red: 0.5, green: 1.0, blue: 1.0, opacity: 0.6),
            Color(red: 0.5, green: 1.0, blue: 1.0, opacity: 0.6),
            Color(red: 1.0, green: 0.5, blue: 1.0, opacity: 0.4),
            Color(red: 0.0, green: 0.5, blue: 1.0, opacity: 0.2),
            Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 0.2),
            Color.clear
        ])
    }
    
    static var rainbow: Gradient {
        Gradient(colors: [
            .red, .red, .red,
            .red, .orange, .yellow, .green, .blue, .purple, .pink,
            .red, .orange, .yellow, .green, .blue, .purple, .pink,
            .red, .orange, .yellow, .green, .blue, .purple, .pink
        ])
    }
    
    static func matte(_ color: NSColor, intensity: CGFloat = 0.5) -> Gradient {
        let i = min(max(intensity, 0), 1)
        
        let red = color.redValue
        let green = color.greenValue
        let blue = color.blueValue
        
        let newRed = red+(1-red)*(0.7)
        let newGreen = green+(1-green)*(0.7)
        let newBlue = blue+(1-blue)*(0.7)
        
        let colors = [
            NSColor(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0 * i),
            NSColor(red: newRed, green: newGreen, blue: newBlue, alpha: 0.85 * i),
            NSColor(red: newRed, green: newGreen, blue: newBlue, alpha: 0.6 * i),
            NSColor(red: newRed, green: newGreen, blue: newBlue, alpha: 0.3 * i),
            NSColor(red: newRed, green: newGreen, blue: newBlue, alpha: 0.0 * i),
            color
        ]
        
        return Gradient(colors: colors.map { Color($0) })
    }
    
    static func glossy(_ color: NSColor, intensity: CGFloat = 0.5) -> Gradient {
        
        let i = min(max(intensity, 0), 1)
        
        let colors = [
            NSColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.90 * i),
            NSColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.90 * i),
            NSColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.80 * i),
            NSColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.50 * i),
            NSColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.10 * i),
            NSColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.00 * i),
            NSColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.00 * i),
            NSColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.00 * i),
            NSColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.00 * i),
            color
        ]
        
        return Gradient(colors: colors.map { Color($0) })
    }
    
    static func hyperGlossy(_ color: NSColor, intensity: CGFloat = 1.0) -> Gradient {
        
        let i = min(max(intensity, 0), 1)
        
        let colors = [
            NSColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.90 * i),
            NSColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.70 * i),
            NSColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.00),
            color
        ]
        
        return Gradient(colors: colors.map { Color($0) })
    }
}
#endif
