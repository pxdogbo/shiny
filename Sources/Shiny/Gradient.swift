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
            Color(#colorLiteral(red: 0, green: 0.0254901961, blue: 0.1960784314, alpha: 1)),
            Color(#colorLiteral(red: 0.0215686274, green: 0.0392156863, blue: 0.2568627451, alpha: 1)),   Color(#colorLiteral(red: 0.0215686274, green: 0.0392156863, blue: 0.2568627451, alpha: 1)),
            Color(#colorLiteral(red: 0.0431372549, green: 0.0529411765, blue: 0.3176470588, alpha: 1)),Color(#colorLiteral(red: 0.0431372549, green: 0.0529411765, blue: 0.3176470588, alpha: 1)),
            Color(#colorLiteral(red: 0.0598039216, green: 0.0568627451, blue: 0.3529411765, alpha: 1)),Color(#colorLiteral(red: 0.0598039216, green: 0.0568627451, blue: 0.3529411765, alpha: 1)),
            Color(#colorLiteral(red: 0.0764705882, green: 0.0607843137, blue: 0.3882352941, alpha: 1)),  Color(#colorLiteral(red: 0.0764705882, green: 0.0607843137, blue: 0.3882352941, alpha: 1)),
            Color(#colorLiteral(red: 0.1166666667, green: 0.0754901961, blue: 0.4117647059, alpha: 1)),
            Color(#colorLiteral(red: 0.1568627451, green: 0.0901960784, blue: 0.4352941176, alpha: 1)),
            Color(#colorLiteral(red: 0.1745098039, green: 0.0990196078, blue: 0.4431372549, alpha: 1)),
            Color(#colorLiteral(red: 0.1921568627, green: 0.1078431373, blue: 0.4509803922, alpha: 1)),
            // Repeat the sequence
            Color(#colorLiteral(red: 0, green: 0.0254901961, blue: 0.1960784314, alpha: 1)),
            Color(#colorLiteral(red: 0.0215686274, green: 0.0392156863, blue: 0.2568627451, alpha: 1)),Color(#colorLiteral(red: 0.0215686274, green: 0.0392156863, blue: 0.2568627451, alpha: 1)),
            Color(#colorLiteral(red: 0.0431372549, green: 0.0529411765, blue: 0.3176470588, alpha: 1)),      Color(#colorLiteral(red: 0.0431372549, green: 0.0529411765, blue: 0.3176470588, alpha: 1)),
            Color(#colorLiteral(red: 0.0598039216, green: 0.0568627451, blue: 0.3529411765, alpha: 1)), Color(#colorLiteral(red: 0.0598039216, green: 0.0568627451, blue: 0.3529411765, alpha: 1)),
            Color(#colorLiteral(red: 0.0764705882, green: 0.0607843137, blue: 0.3882352941, alpha: 1)),      Color(#colorLiteral(red: 0.0764705882, green: 0.0607843137, blue: 0.3882352941, alpha: 1)),
            Color(#colorLiteral(red: 0.1166666667, green: 0.0754901961, blue: 0.4117647059, alpha: 1)),
            Color(#colorLiteral(red: 0.1568627451, green: 0.0901960784, blue: 0.4352941176, alpha: 1)),
            Color(#colorLiteral(red: 0.1745098039, green: 0.0990196078, blue: 0.4431372549, alpha: 1)),
            Color(#colorLiteral(red: 0.1921568627, green: 0.1078431373, blue: 0.4509803922, alpha: 1))
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
