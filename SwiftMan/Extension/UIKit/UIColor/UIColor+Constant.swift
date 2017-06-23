//
//  UIColor+Constant.swift
//  SwiftMan
//
//  Created by yangjun on 2017/6/21.
//  Copyright © 2017年 cactus. All rights reserved.
//

#if !os(macOS)
import UIKit

    //MARK: - Social Colors
    public extension UIColor {
        
        /// SwifterSwift: Brand identity color of popular social media platform.
        public struct m_social {
            // https://www.lockedowndesign.com/social-media-colors/
            
            /// red: 59, g: 89, b: 152
            public static let m_facebook = UIColor(r: 59, g: 89, b: 152)
            
            /// red: 0, g: 182, b: 241
            public static let m_twitter = UIColor(r: 0, g: 182, b: 241)
            
            /// red: 223, g: 74, b: 50
            public static let m_googlePlus = UIColor(r: 223, g: 74, b: 50)
            
            /// red: 0, g: 123, b: 182
            public static let m_linkedIn = UIColor(r: 0, g: 123, b: 182)
            
            /// red: 69, g: 187, b: 255
            public static let m_vimeo = UIColor(r: 69, g: 187, b: 255)
            
            /// red: 179, g: 18, b: 23
            public static let m_youtube = UIColor(r: 179, g: 18, b: 23)
            
            /// red: 195, g: 42, b: 163
            public static let m_instagram = UIColor(r: 195, g: 42, b: 163)
            
            /// red: 203, g: 32, b: 39
            public static let m_pinterest = UIColor(r: 203, g: 32, b: 39)
            
            /// red: 244, g: 0, b: 131
            public static let m_flickr = UIColor(r: 244, g: 0, b: 131)
            
            /// red: 67, g: 2, b: 151
            public static let m_yahoo = UIColor(r: 67, g: 2, b: 151)
            
            /// red: 67, g: 2, b: 151
            public static let m_soundCloud = UIColor(r: 67, g: 2, b: 151)
            
            /// red: 44, g: 71, b: 98
            public static let m_tumblr = UIColor(r: 44, g: 71, b: 98)
            
            /// red: 252, g: 69, b: 117
            public static let m_foursquare = UIColor(r: 252, g: 69, b: 117)
            
            /// red: 255, g: 176, b: 0
            public static let m_swarm = UIColor(r: 255, g: 176, b: 0)
            
            /// red: 234, g: 76, b: 137
            public static let m_dribbble = UIColor(r: 234, g: 76, b: 137)
            
            /// red: 255, g: 87, b: 0
            public static let m_reddit = UIColor(r: 255, g: 87, b: 0)
            
            /// red: 74, g: 93, b: 78
            public static let m_devianArt = UIColor(r: 74, g: 93, b: 78)
            
            /// red: 238, g: 64, b: 86
            public static let m_pocket = UIColor(r: 238, g: 64, b: 86)
            
            /// red: 170, g: 34, b: 182
            public static let m_quora = UIColor(r: 170, g: 34, b: 182)
            
            /// red: 247, g: 146, b: 30
            public static let m_slideShare = UIColor(r: 247, g: 146, b: 30)
            
            /// red: 0, g: 153, b: 229
            public static let m_px500 = UIColor(r: 0, g: 153, b: 229)
            
            /// red: 223, g: 109, b: 70
            public static let m_listly = UIColor(r: 223, g: 109, b: 70)
            
            /// red: 0, g: 180, b: 137
            public static let m_vine = UIColor(r: 0, g: 180, b: 137)
            
            /// red: 0, g: 175, b: 240
            public static let m_skype = UIColor(r: 0, g: 175, b: 240)
            
            /// red: 235, g: 73, b: 36
            public static let m_stumbleUpon = UIColor(r: 235, g: 73, b: 36)
            
            /// red: 255, g: 252, b: 0
            public static let m_snapchat = UIColor(r: 255, g: 252, b: 0)
            
        }
    }
    
    
    //MARK: - Material colors
    public extension UIColor {
        
        /// SwifterSwift: Google Material design colors palette.
        public struct m_material {
            // https://material.google.com/style/color.html
            
            public static let m_red					= m_red500
            public static let m_red50					= UIColor(rgbHex: 0xFFEBEE)
            public static let m_red100				= UIColor(rgbHex: 0xFFCDD2)
            public static let m_red200				= UIColor(rgbHex: 0xEF9A9A)
            public static let m_red300				= UIColor(rgbHex: 0xE57373)
            public static let m_red400				= UIColor(rgbHex: 0xEF5350)
            public static let m_red500				= UIColor(rgbHex: 0xF44336)
            public static let m_red600				= UIColor(rgbHex: 0xE53935)
            public static let m_red700				= UIColor(rgbHex: 0xD32F2F)
            public static let m_red800				= UIColor(rgbHex: 0xC62828)
            public static let m_red900				= UIColor(rgbHex: 0xB71C1C)
            public static let m_redA100				= UIColor(rgbHex: 0xFF8A80)
            public static let m_redA200				= UIColor(rgbHex: 0xFF5252)
            public static let m_redA400				= UIColor(rgbHex: 0xFF1744)
            public static let m_redA700				= UIColor(rgbHex: 0xD50000)
            
            public static let m_pink					= m_pink500
            public static let m_pink50				= UIColor(rgbHex: 0xFCE4EC)
            public static let m_pink100				= UIColor(rgbHex: 0xF8BBD0)
            public static let m_pink200				= UIColor(rgbHex: 0xF48FB1)
            public static let m_pink300				= UIColor(rgbHex: 0xF06292)
            public static let m_pink400				= UIColor(rgbHex: 0xEC407A)
            public static let m_pink500				= UIColor(rgbHex: 0xE91E63)
            public static let m_pink600				= UIColor(rgbHex: 0xD81B60)
            public static let m_pink700				= UIColor(rgbHex: 0xC2185B)
            public static let m_pink800				= UIColor(rgbHex: 0xAD1457)
            public static let m_pink900				= UIColor(rgbHex: 0x880E4F)
            public static let m_pinkA100				= UIColor(rgbHex: 0xFF80AB)
            public static let m_pinkA200				= UIColor(rgbHex: 0xFF4081)
            public static let m_pinkA400				= UIColor(rgbHex: 0xF50057)
            public static let m_pinkA700				= UIColor(rgbHex: 0xC51162)
            
            public static let m_purple				= m_purple500
            public static let m_purple50				= UIColor(rgbHex: 0xF3E5F5)
            public static let m_purple100				= UIColor(rgbHex: 0xE1BEE7)
            public static let m_purple200				= UIColor(rgbHex: 0xCE93D8)
            public static let m_purple300				= UIColor(rgbHex: 0xBA68C8)
            public static let m_purple400				= UIColor(rgbHex: 0xAB47BC)
            public static let m_purple500				= UIColor(rgbHex: 0x9C27B0)
            public static let m_purple600				= UIColor(rgbHex: 0x8E24AA)
            public static let m_purple700				= UIColor(rgbHex: 0x7B1FA2)
            public static let m_purple800				= UIColor(rgbHex: 0x6A1B9A)
            public static let m_purple900				= UIColor(rgbHex: 0x4A148C)
            public static let m_purpleA100			= UIColor(rgbHex: 0xEA80FC)
            public static let m_purpleA200			= UIColor(rgbHex: 0xE040FB)
            public static let m_purpleA400			= UIColor(rgbHex: 0xD500F9)
            public static let m_purpleA700			= UIColor(rgbHex: 0xAA00FF)
            
            public static let m_deepPurple			= m_deepPurple500
            public static let m_deepPurple50			= UIColor(rgbHex: 0xEDE7F6)
            public static let m_deepPurple100			= UIColor(rgbHex: 0xD1C4E9)
            public static let m_deepPurple200			= UIColor(rgbHex: 0xB39DDB)
            public static let m_deepPurple300			= UIColor(rgbHex: 0x9575CD)
            public static let m_deepPurple400			= UIColor(rgbHex: 0x7E57C2)
            public static let m_deepPurple500			= UIColor(rgbHex: 0x673AB7)
            public static let m_deepPurple600			= UIColor(rgbHex: 0x5E35B1)
            public static let m_deepPurple700			= UIColor(rgbHex: 0x512DA8)
            public static let m_deepPurple800			= UIColor(rgbHex: 0x4527A0)
            public static let m_deepPurple900			= UIColor(rgbHex: 0x311B92)
            public static let m_deepPurpleA100		= UIColor(rgbHex: 0xB388FF)
            public static let m_deepPurpleA200		= UIColor(rgbHex: 0x7C4DFF)
            public static let m_deepPurpleA400		= UIColor(rgbHex: 0x651FFF)
            public static let m_deepPurpleA700		= UIColor(rgbHex: 0x6200EA)
            
            public static let m_indigo				= m_indigo500
            public static let m_indigo50				= UIColor(rgbHex: 0xE8EAF6)
            public static let m_indigo100				= UIColor(rgbHex: 0xC5CAE9)
            public static let m_indigo200				= UIColor(rgbHex: 0x9FA8DA)
            public static let m_indigo300				= UIColor(rgbHex: 0x7986CB)
            public static let m_indigo400				= UIColor(rgbHex: 0x5C6BC0)
            public static let m_indigo500				= UIColor(rgbHex: 0x3F51B5)
            public static let m_indigo600				= UIColor(rgbHex: 0x3949AB)
            public static let m_indigo700				= UIColor(rgbHex: 0x303F9F)
            public static let m_indigo800				= UIColor(rgbHex: 0x283593)
            public static let m_indigo900				= UIColor(rgbHex: 0x1A237E)
            public static let m_indigoA100			= UIColor(rgbHex: 0x8C9EFF)
            public static let m_indigoA200			= UIColor(rgbHex: 0x536DFE)
            public static let m_indigoA400			= UIColor(rgbHex: 0x3D5AFE)
            public static let m_indigoA700			= UIColor(rgbHex: 0x304FFE)
            
            public static let m_blue					= m_blue500
            public static let m_blue50				= UIColor(rgbHex: 0xE3F2FD)
            public static let m_blue100				= UIColor(rgbHex: 0xBBDEFB)
            public static let m_blue200				= UIColor(rgbHex: 0x90CAF9)
            public static let m_blue300				= UIColor(rgbHex: 0x64B5F6)
            public static let m_blue400				= UIColor(rgbHex: 0x42A5F5)
            public static let m_blue500				= UIColor(rgbHex: 0x2196F3)
            public static let m_blue600				= UIColor(rgbHex: 0x1E88E5)
            public static let m_blue700				= UIColor(rgbHex: 0x1976D2)
            public static let m_blue800				= UIColor(rgbHex: 0x1565C0)
            public static let m_blue900				= UIColor(rgbHex: 0x0D47A1)
            public static let m_blueA100				= UIColor(rgbHex: 0x82B1FF)
            public static let m_blueA200				= UIColor(rgbHex: 0x448AFF)
            public static let m_blueA400				= UIColor(rgbHex: 0x2979FF)
            public static let m_blueA700				= UIColor(rgbHex: 0x2962FF)
            
            public static let m_lightBlue				= m_lightBlue500
            public static let m_lightBlue50			= UIColor(rgbHex: 0xE1F5FE)
            public static let m_lightBlue100			= UIColor(rgbHex: 0xB3E5FC)
            public static let m_lightBlue200			= UIColor(rgbHex: 0x81D4FA)
            public static let m_lightBlue300			= UIColor(rgbHex: 0x4FC3F7)
            public static let m_lightBlue400			= UIColor(rgbHex: 0x29B6F6)
            public static let m_lightBlue500			= UIColor(rgbHex: 0x03A9F4)
            public static let m_lightBlue600			= UIColor(rgbHex: 0x039BE5)
            public static let m_lightBlue700			= UIColor(rgbHex: 0x0288D1)
            public static let m_lightBlue800			= UIColor(rgbHex: 0x0277BD)
            public static let m_lightBlue900			= UIColor(rgbHex: 0x01579B)
            public static let m_lightBlueA100			= UIColor(rgbHex: 0x80D8FF)
            public static let m_lightBlueA200			= UIColor(rgbHex: 0x40C4FF)
            public static let m_lightBlueA400			= UIColor(rgbHex: 0x00B0FF)
            public static let m_lightBlueA700			= UIColor(rgbHex: 0x0091EA)
            
            public static let m_cyan					= m_cyan500
            public static let m_cyan50				= UIColor(rgbHex: 0xE0F7FA)
            public static let m_cyan100				= UIColor(rgbHex: 0xB2EBF2)
            public static let m_cyan200				= UIColor(rgbHex: 0x80DEEA)
            public static let m_cyan300				= UIColor(rgbHex: 0x4DD0E1)
            public static let m_cyan400				= UIColor(rgbHex: 0x26C6DA)
            public static let m_cyan500				= UIColor(rgbHex: 0x00BCD4)
            public static let m_cyan600				= UIColor(rgbHex: 0x00ACC1)
            public static let m_cyan700				= UIColor(rgbHex: 0x0097A7)
            public static let m_cyan800				= UIColor(rgbHex: 0x00838F)
            public static let m_cyan900				= UIColor(rgbHex: 0x006064)
            public static let m_cyanA100				= UIColor(rgbHex: 0x84FFFF)
            public static let m_cyanA200				= UIColor(rgbHex: 0x18FFFF)
            public static let m_cyanA400				= UIColor(rgbHex: 0x00E5FF)
            public static let m_cyanA700				= UIColor(rgbHex: 0x00B8D4)
            
            public static let m_teal					= m_teal500
            public static let m_teal50				= UIColor(rgbHex: 0xE0F2F1)
            public static let m_teal100				= UIColor(rgbHex: 0xB2DFDB)
            public static let m_teal200				= UIColor(rgbHex: 0x80CBC4)
            public static let m_teal300				= UIColor(rgbHex: 0x4DB6AC)
            public static let m_teal400				= UIColor(rgbHex: 0x26A69A)
            public static let m_teal500				= UIColor(rgbHex: 0x009688)
            public static let m_teal600				= UIColor(rgbHex: 0x00897B)
            public static let m_teal700				= UIColor(rgbHex: 0x00796B)
            public static let m_teal800				= UIColor(rgbHex: 0x00695C)
            public static let m_teal900				= UIColor(rgbHex: 0x004D40)
            public static let m_tealA100				= UIColor(rgbHex: 0xA7FFEB)
            public static let m_tealA200				= UIColor(rgbHex: 0x64FFDA)
            public static let m_tealA400				= UIColor(rgbHex: 0x1DE9B6)
            public static let m_tealA700				= UIColor(rgbHex: 0x00BFA5)
            
            public static let m_green					= m_green500
            public static let m_green50				= UIColor(rgbHex: 0xE8F5E9)
            public static let m_green100				= UIColor(rgbHex: 0xC8E6C9)
            public static let m_green200				= UIColor(rgbHex: 0xA5D6A7)
            public static let m_green300				= UIColor(rgbHex: 0x81C784)
            public static let m_green400				= UIColor(rgbHex: 0x66BB6A)
            public static let m_green500				= UIColor(rgbHex: 0x4CAF50)
            public static let m_green600				= UIColor(rgbHex: 0x43A047)
            public static let m_green700				= UIColor(rgbHex: 0x388E3C)
            public static let m_green800				= UIColor(rgbHex: 0x2E7D32)
            public static let m_green900				= UIColor(rgbHex: 0x1B5E20)
            public static let m_greenA100				= UIColor(rgbHex: 0xB9F6CA)
            public static let m_greenA200				= UIColor(rgbHex: 0x69F0AE)
            public static let m_greenA400				= UIColor(rgbHex: 0x00E676)
            public static let m_greenA700				= UIColor(rgbHex: 0x00C853)
            
            public static let m_lightGreen			= m_lightGreen500
            public static let m_lightGreen50			= UIColor(rgbHex: 0xF1F8E9)
            public static let m_lightGreen100			= UIColor(rgbHex: 0xDCEDC8)
            public static let m_lightGreen200			= UIColor(rgbHex: 0xC5E1A5)
            public static let m_lightGreen300			= UIColor(rgbHex: 0xAED581)
            public static let m_lightGreen400			= UIColor(rgbHex: 0x9CCC65)
            public static let m_lightGreen500			= UIColor(rgbHex: 0x8BC34A)
            public static let m_lightGreen600			= UIColor(rgbHex: 0x7CB342)
            public static let m_lightGreen700			= UIColor(rgbHex: 0x689F38)
            public static let m_lightGreen800			= UIColor(rgbHex: 0x558B2F)
            public static let m_lightGreen900			= UIColor(rgbHex: 0x33691E)
            public static let m_lightGreenA100		= UIColor(rgbHex: 0xCCFF90)
            public static let m_lightGreenA200		= UIColor(rgbHex: 0xB2FF59)
            public static let m_lightGreenA400		= UIColor(rgbHex: 0x76FF03)
            public static let m_lightGreenA700		= UIColor(rgbHex: 0x64DD17)
            
            public static let m_lime					= m_lime500
            public static let m_lime50				= UIColor(rgbHex: 0xF9FBE7)
            public static let m_lime100				= UIColor(rgbHex: 0xF0F4C3)
            public static let m_lime200				= UIColor(rgbHex: 0xE6EE9C)
            public static let m_lime300				= UIColor(rgbHex: 0xDCE775)
            public static let m_lime400				= UIColor(rgbHex: 0xD4E157)
            public static let m_lime500				= UIColor(rgbHex: 0xCDDC39)
            public static let m_lime600				= UIColor(rgbHex: 0xC0CA33)
            public static let m_lime700				= UIColor(rgbHex: 0xAFB42B)
            public static let m_lime800				= UIColor(rgbHex: 0x9E9D24)
            public static let m_lime900				= UIColor(rgbHex: 0x827717)
            public static let m_limeA100				= UIColor(rgbHex: 0xF4FF81)
            public static let m_limeA200				= UIColor(rgbHex: 0xEEFF41)
            public static let m_limeA400				= UIColor(rgbHex: 0xC6FF00)
            public static let m_limeA700				= UIColor(rgbHex: 0xAEEA00)
            
            public static let m_yellow				= m_yellow500
            public static let m_yellow50				= UIColor(rgbHex: 0xFFFDE7)
            public static let m_yellow100				= UIColor(rgbHex: 0xFFF9C4)
            public static let m_yellow200				= UIColor(rgbHex: 0xFFF59D)
            public static let m_yellow300				= UIColor(rgbHex: 0xFFF176)
            public static let m_yellow400				= UIColor(rgbHex: 0xFFEE58)
            public static let m_yellow500				= UIColor(rgbHex: 0xFFEB3B)
            public static let m_yellow600				= UIColor(rgbHex: 0xFDD835)
            public static let m_yellow700				= UIColor(rgbHex: 0xFBC02D)
            public static let m_yellow800				= UIColor(rgbHex: 0xF9A825)
            public static let m_yellow900				= UIColor(rgbHex: 0xF57F17)
            public static let m_yellowA100			= UIColor(rgbHex: 0xFFFF8D)
            public static let m_yellowA200			= UIColor(rgbHex: 0xFFFF00)
            public static let m_yellowA400			= UIColor(rgbHex: 0xFFEA00)
            public static let m_yellowA700			= UIColor(rgbHex: 0xFFD600)
            
            public static let m_amber					= m_amber500
            public static let m_amber50				= UIColor(rgbHex: 0xFFF8E1)
            public static let m_amber100				= UIColor(rgbHex: 0xFFECB3)
            public static let m_amber200				= UIColor(rgbHex: 0xFFE082)
            public static let m_amber300				= UIColor(rgbHex: 0xFFD54F)
            public static let m_amber400				= UIColor(rgbHex: 0xFFCA28)
            public static let m_amber500				= UIColor(rgbHex: 0xFFC107)
            public static let m_amber600				= UIColor(rgbHex: 0xFFB300)
            public static let m_amber700				= UIColor(rgbHex: 0xFFA000)
            public static let m_amber800				= UIColor(rgbHex: 0xFF8F00)
            public static let m_amber900				= UIColor(rgbHex: 0xFF6F00)
            public static let m_amberA100				= UIColor(rgbHex: 0xFFE57F)
            public static let m_amberA200				= UIColor(rgbHex: 0xFFD740)
            public static let m_amberA400				= UIColor(rgbHex: 0xFFC400)
            public static let m_amberA700				= UIColor(rgbHex: 0xFFAB00)
            
            public static let m_orange				= m_orange500
            public static let m_orange50				= UIColor(rgbHex: 0xFFF3E0)
            public static let m_orange100				= UIColor(rgbHex: 0xFFE0B2)
            public static let m_orange200				= UIColor(rgbHex: 0xFFCC80)
            public static let m_orange300				= UIColor(rgbHex: 0xFFB74D)
            public static let m_orange400				= UIColor(rgbHex: 0xFFA726)
            public static let m_orange500				= UIColor(rgbHex: 0xFF9800)
            public static let m_orange600				= UIColor(rgbHex: 0xFB8C00)
            public static let m_orange700				= UIColor(rgbHex: 0xF57C00)
            public static let m_orange800				= UIColor(rgbHex: 0xEF6C00)
            public static let m_orange900				= UIColor(rgbHex: 0xE65100)
            public static let m_orangeA100			= UIColor(rgbHex: 0xFFD180)
            public static let m_orangeA200			= UIColor(rgbHex: 0xFFAB40)
            public static let m_orangeA400			= UIColor(rgbHex: 0xFF9100)
            public static let m_orangeA700			= UIColor(rgbHex: 0xFF6D00)
            
            public static let m_deepOrange			= m_deepOrange500
            public static let m_deepOrange50			= UIColor(rgbHex: 0xFBE9E7)
            public static let m_deepOrange100			= UIColor(rgbHex: 0xFFCCBC)
            public static let m_deepOrange200			= UIColor(rgbHex: 0xFFAB91)
            public static let m_deepOrange300			= UIColor(rgbHex: 0xFF8A65)
            public static let m_deepOrange400			= UIColor(rgbHex: 0xFF7043)
            public static let m_deepOrange500			= UIColor(rgbHex: 0xFF5722)
            public static let m_deepOrange600			= UIColor(rgbHex: 0xF4511E)
            public static let m_deepOrange700			= UIColor(rgbHex: 0xE64A19)
            public static let m_deepOrange800			= UIColor(rgbHex: 0xD84315)
            public static let m_deepOrange900			= UIColor(rgbHex: 0xBF360C)
            public static let m_deepOrangeA100		= UIColor(rgbHex: 0xFF9E80)
            public static let m_deepOrangeA200		= UIColor(rgbHex: 0xFF6E40)
            public static let m_deepOrangeA400		= UIColor(rgbHex: 0xFF3D00)
            public static let m_deepOrangeA700		= UIColor(rgbHex: 0xDD2C00)
            
            public static let m_brown					= m_brown500
            public static let m_brown50				= UIColor(rgbHex: 0xEFEBE9)
            public static let m_brown100				= UIColor(rgbHex: 0xD7CCC8)
            public static let m_brown200				= UIColor(rgbHex: 0xBCAAA4)
            public static let m_brown300				= UIColor(rgbHex: 0xA1887F)
            public static let m_brown400				= UIColor(rgbHex: 0x8D6E63)
            public static let m_brown500				= UIColor(rgbHex: 0x795548)
            public static let m_brown600				= UIColor(rgbHex: 0x6D4C41)
            public static let m_brown700				= UIColor(rgbHex: 0x5D4037)
            public static let m_brown800				= UIColor(rgbHex: 0x4E342E)
            public static let m_brown900				= UIColor(rgbHex: 0x3E2723)
            
            public static let m_grey					= m_grey500
            public static let m_grey50				= UIColor(rgbHex: 0xFAFAFA)
            public static let m_grey100				= UIColor(rgbHex: 0xF5F5F5)
            public static let m_grey200				= UIColor(rgbHex: 0xEEEEEE)
            public static let m_grey300				= UIColor(rgbHex: 0xE0E0E0)
            public static let m_grey400				= UIColor(rgbHex: 0xBDBDBD)
            public static let m_grey500				= UIColor(rgbHex: 0x9E9E9E)
            public static let m_grey600				= UIColor(rgbHex: 0x757575)
            public static let m_grey700				= UIColor(rgbHex: 0x616161)
            public static let m_grey800				= UIColor(rgbHex: 0x424242)
            public static let m_grey900				= UIColor(rgbHex: 0x212121)
            
            public static let m_blueGrey				= m_blueGrey500
            public static let m_blueGrey50			= UIColor(rgbHex: 0xECEFF1)
            public static let m_blueGrey100			= UIColor(rgbHex: 0xCFD8DC)
            public static let m_blueGrey200			= UIColor(rgbHex: 0xB0BEC5)
            public static let m_blueGrey300			= UIColor(rgbHex: 0x90A4AE)
            public static let m_blueGrey400			= UIColor(rgbHex: 0x78909C)
            public static let m_blueGrey500			= UIColor(rgbHex: 0x607D8B)
            public static let m_blueGrey600			= UIColor(rgbHex: 0x546E7A)
            public static let m_blueGrey700			= UIColor(rgbHex: 0x455A64)
            public static let m_blueGrey800			= UIColor(rgbHex: 0x37474F)
            public static let m_blueGrey900			= UIColor(rgbHex: 0x263238)
            
            public static let m_black					= UIColor(rgbHex: 0x000000)
            public static let m_white					= UIColor(rgbHex: 0xFFFFFF)
        }
        
    }
    
    
    public extension UIColor {
        
        /// SwifterSwift: CSS colors.
        public struct m_css {
            // http://www.w3schools.com/colors/colors_names.asp
            public static let m_aliceBlue				= UIColor(rgbHex: 0xF0F8FF)
            public static let m_antiqueWhite			= UIColor(rgbHex: 0xFAEBD7)
            public static let m_aqua					= UIColor(rgbHex: 0x00FFFF)
            public static let m_aquamarine			= UIColor(rgbHex: 0x7FFFD4)
            public static let m_azure					= UIColor(rgbHex: 0xF0FFFF)
            public static let m_beige					= UIColor(rgbHex: 0xF5F5DC)
            public static let m_bisque				= UIColor(rgbHex: 0xFFE4C4)
            public static let m_black					= UIColor(rgbHex: 0x000000)
            public static let m_blanchedAlmond		= UIColor(rgbHex: 0xFFEBCD)
            public static let m_blue					= UIColor(rgbHex: 0x0000FF)
            public static let m_blueViolet			= UIColor(rgbHex: 0x8A2BE2)
            public static let m_brown					= UIColor(rgbHex: 0xA52A2A)
            public static let m_burlyWood				= UIColor(rgbHex: 0xDEB887)
            public static let m_cadetBlue				= UIColor(rgbHex: 0x5F9EA0)
            public static let m_chartreuse			= UIColor(rgbHex: 0x7FFF00)
            public static let m_chocolate				= UIColor(rgbHex: 0xD2691E)
            public static let m_coral					= UIColor(rgbHex: 0xFF7F50)
            public static let m_cornflowerBlue		= UIColor(rgbHex: 0x6495ED)
            public static let m_cornsilk				= UIColor(rgbHex: 0xFFF8DC)
            public static let m_crimson				= UIColor(rgbHex: 0xDC143C)
            public static let m_cyan					= UIColor(rgbHex: 0x00FFFF)
            public static let m_darkBlue				= UIColor(rgbHex: 0x00008B)
            public static let m_darkCyan				= UIColor(rgbHex: 0x008B8B)
            public static let m_darkGoldenRod			= UIColor(rgbHex: 0xB8860B)
            public static let m_darkGray				= UIColor(rgbHex: 0xA9A9A9)
            public static let m_darkGrey				= UIColor(rgbHex: 0xA9A9A9)
            public static let m_darkGreen				= UIColor(rgbHex: 0x006400)
            public static let m_darkKhaki				= UIColor(rgbHex: 0xBDB76B)
            public static let m_darkMagenta			= UIColor(rgbHex: 0x8B008B)
            public static let m_darkOliveGreen		= UIColor(rgbHex: 0x556B2F)
            public static let m_darkOrange			= UIColor(rgbHex: 0xFF8C00)
            public static let m_darkOrchid			= UIColor(rgbHex: 0x9932CC)
            public static let m_darkRed				= UIColor(rgbHex: 0x8B0000)
            public static let m_darkSalmon			= UIColor(rgbHex: 0xE9967A)
            public static let m_darkSeaGreen			= UIColor(rgbHex: 0x8FBC8F)
            public static let m_darkSlateBlue			= UIColor(rgbHex: 0x483D8B)
            public static let m_darkSlateGray			= UIColor(rgbHex: 0x2F4F4F)
            public static let m_darkSlateGrey			= UIColor(rgbHex: 0x2F4F4F)
            public static let m_darkTurquoise			= UIColor(rgbHex: 0x00CED1)
            public static let m_darkViolet			= UIColor(rgbHex: 0x9400D3)
            public static let m_deepPink				= UIColor(rgbHex: 0xFF1493)
            public static let m_deepSkyBlue			= UIColor(rgbHex: 0x00BFFF)
            public static let m_dimGray				= UIColor(rgbHex: 0x696969)
            public static let m_dimGrey				= UIColor(rgbHex: 0x696969)
            public static let m_dodgerBlue			= UIColor(rgbHex: 0x1E90FF)
            public static let m_fireBrick				= UIColor(rgbHex: 0xB22222)
            public static let m_floralWhite			= UIColor(rgbHex: 0xFFFAF0)
            public static let m_forestGreen			= UIColor(rgbHex: 0x228B22)
            public static let m_fuchsia				= UIColor(rgbHex: 0xFF00FF)
            public static let m_gainsboro				= UIColor(rgbHex: 0xDCDCDC)
            public static let m_ghostWhite			= UIColor(rgbHex: 0xF8F8FF)
            public static let m_gold					= UIColor(rgbHex: 0xFFD700)
            public static let m_goldenRod				= UIColor(rgbHex: 0xDAA520)
            public static let m_gray					= UIColor(rgbHex: 0x808080)
            public static let m_grey					= UIColor(rgbHex: 0x808080)
            public static let m_green					= UIColor(rgbHex: 0x008000)
            public static let m_greenYellow			= UIColor(rgbHex: 0xADFF2F)
            public static let m_honeyDew				= UIColor(rgbHex: 0xF0FFF0)
            public static let m_hotPink				= UIColor(rgbHex: 0xFF69B4)
            public static let m_indianRed				= UIColor(rgbHex: 0xCD5C5C)
            public static let m_indigo				= UIColor(rgbHex: 0x4B0082)
            public static let m_ivory					= UIColor(rgbHex: 0xFFFFF0)
            public static let m_khaki					= UIColor(rgbHex: 0xF0E68C)
            public static let m_lavender				= UIColor(rgbHex: 0xE6E6FA)
            public static let m_lavenderBlush			= UIColor(rgbHex: 0xFFF0F5)
            public static let m_lawnGreen				= UIColor(rgbHex: 0x7CFC00)
            public static let m_lemonChiffon			= UIColor(rgbHex: 0xFFFACD)
            public static let m_lightBlue				= UIColor(rgbHex: 0xADD8E6)
            public static let m_lightCoral			= UIColor(rgbHex: 0xF08080)
            public static let m_lightCyan				= UIColor(rgbHex: 0xE0FFFF)
            public static let m_lightGoldenRodYellow	= UIColor(rgbHex: 0xFAFAD2)
            public static let m_lightGray				= UIColor(rgbHex: 0xD3D3D3)
            public static let m_lightGrey				= UIColor(rgbHex: 0xD3D3D3)
            public static let m_lightGreen			= UIColor(rgbHex: 0x90EE90)
            public static let m_lightPink				= UIColor(rgbHex: 0xFFB6C1)
            public static let m_lightSalmon			= UIColor(rgbHex: 0xFFA07A)
            public static let m_lightSeaGreen			= UIColor(rgbHex: 0x20B2AA)
            public static let m_lightSkyBlue			= UIColor(rgbHex: 0x87CEFA)
            public static let m_lightSlateGray		= UIColor(rgbHex: 0x778899)
            public static let m_lightSlateGrey		= UIColor(rgbHex: 0x778899)
            public static let m_lightSteelBlue		= UIColor(rgbHex: 0xB0C4DE)
            public static let m_lightYellow			= UIColor(rgbHex: 0xFFFFE0)
            public static let m_lime					= UIColor(rgbHex: 0x00FF00)
            public static let m_limeGreen				= UIColor(rgbHex: 0x32CD32)
            public static let m_linen					= UIColor(rgbHex: 0xFAF0E6)
            public static let m_magenta				= UIColor(rgbHex: 0xFF00FF)
            public static let m_maroon				= UIColor(rgbHex: 0x800000)
            public static let m_mediumAquaMarine		= UIColor(rgbHex: 0x66CDAA)
            public static let m_mediumBlue			= UIColor(rgbHex: 0x0000CD)
            public static let m_mediumOrchid			= UIColor(rgbHex: 0xBA55D3)
            public static let m_mediumPurple			= UIColor(rgbHex: 0x9370DB)
            public static let m_mediumSeaGreen		= UIColor(rgbHex: 0x3CB371)
            public static let m_mediumSlateBlue		= UIColor(rgbHex: 0x7B68EE)
            public static let m_mediumSpringGreen		= UIColor(rgbHex: 0x00FA9A)
            public static let m_mediumTurquoise		= UIColor(rgbHex: 0x48D1CC)
            public static let m_mediumVioletRed		= UIColor(rgbHex: 0xC71585)
            public static let m_midnightBlue			= UIColor(rgbHex: 0x191970)
            public static let m_mintCream				= UIColor(rgbHex: 0xF5FFFA)
            public static let m_mistyRose				= UIColor(rgbHex: 0xFFE4E1)
            public static let m_moccasin				= UIColor(rgbHex: 0xFFE4B5)
            public static let m_navajoWhite			= UIColor(rgbHex: 0xFFDEAD)
            public static let m_navy					= UIColor(rgbHex: 0x000080)
            public static let m_oldLace				= UIColor(rgbHex: 0xFDF5E6)
            public static let m_olive					= UIColor(rgbHex: 0x808000)
            public static let m_oliveDrab				= UIColor(rgbHex: 0x6B8E23)
            public static let m_orange				= UIColor(rgbHex: 0xFFA500)
            public static let m_orangeRed				= UIColor(rgbHex: 0xFF4500)
            public static let m_orchid				= UIColor(rgbHex: 0xDA70D6)
            public static let m_paleGoldenRod			= UIColor(rgbHex: 0xEEE8AA)
            public static let m_paleGreen				= UIColor(rgbHex: 0x98FB98)
            public static let m_paleTurquoise			= UIColor(rgbHex: 0xAFEEEE)
            public static let m_paleVioletRed			= UIColor(rgbHex: 0xDB7093)
            public static let m_papayaWhip			= UIColor(rgbHex: 0xFFEFD5)
            public static let m_peachPuff				= UIColor(rgbHex: 0xFFDAB9)
            public static let m_peru					= UIColor(rgbHex: 0xCD853F)
            public static let m_pink					= UIColor(rgbHex: 0xFFC0CB)
            public static let m_plum					= UIColor(rgbHex: 0xDDA0DD)
            public static let m_powderBlue			= UIColor(rgbHex: 0xB0E0E6)
            public static let m_purple				= UIColor(rgbHex: 0x800080)
            public static let m_rebeccaPurple			= UIColor(rgbHex: 0x663399)
            public static let m_red					= UIColor(rgbHex: 0xFF0000)
            public static let m_rosyBrown				= UIColor(rgbHex: 0xBC8F8F)
            public static let m_royalBlue				= UIColor(rgbHex: 0x4169E1)
            public static let m_saddleBrown			= UIColor(rgbHex: 0x8B4513)
            public static let m_salmon				= UIColor(rgbHex: 0xFA8072)
            public static let m_sandyBrown			= UIColor(rgbHex: 0xF4A460)
            public static let m_seaGreen				= UIColor(rgbHex: 0x2E8B57)
            public static let m_seaShell				= UIColor(rgbHex: 0xFFF5EE)
            public static let m_sienna				= UIColor(rgbHex: 0xA0522D)
            public static let m_silver				= UIColor(rgbHex: 0xC0C0C0)
            public static let m_skyBlue				= UIColor(rgbHex: 0x87CEEB)
            public static let m_slateBlue				= UIColor(rgbHex: 0x6A5ACD)
            public static let m_slateGray				= UIColor(rgbHex: 0x708090)
            public static let m_slateGrey				= UIColor(rgbHex: 0x708090)
            public static let m_snow					= UIColor(rgbHex: 0xFFFAFA)
            public static let m_springGreen			= UIColor(rgbHex: 0x00FF7F)
            public static let m_steelBlue				= UIColor(rgbHex: 0x4682B4)
            public static let m_tan					= UIColor(rgbHex: 0xD2B48C)
            public static let m_teal					= UIColor(rgbHex: 0x008080)
            public static let m_thistle				= UIColor(rgbHex: 0xD8BFD8)
            public static let m_tomato				= UIColor(rgbHex: 0xFF6347)
            public static let m_turquoise				= UIColor(rgbHex: 0x40E0D0)
            public static let m_violet				= UIColor(rgbHex: 0xEE82EE)
            public static let m_wheat					= UIColor(rgbHex: 0xF5DEB3)
            public static let m_white					= UIColor(rgbHex: 0xFFFFFF)
            public static let m_whiteSmoke			= UIColor(rgbHex: 0xF5F5F5)
            public static let m_yellow				= UIColor(rgbHex: 0xFFFF00)
            public static let m_yellowGreen			= UIColor(rgbHex: 0x9ACD32)
            
        }
        
    }


#endif
