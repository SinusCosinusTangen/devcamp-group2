//
//  UserPreference.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 16/10/22.
//

import Foundation

public class UserPreference: UserPreferenceProtocol {
    
    public static let shared = UserPreference()
    
    public var userDefault = UserDefaults.standard
    
    public var isWaiting: Bool? {
        get {
            return self.userDefault.bool(forKey: "IS_WAITING")
        }
        set {
            if self.userDefault.value(forKey: "IS_WAITING") == nil {
                self.userDefault.set(false, forKey: "IS_WAITING")
            }
            self.userDefault.setValue(newValue, forKey: "IS_WAITING")
        }
    }
    
    public var xpResult: Int? {
        get {
            return self.userDefault.integer(forKey: "XP_RESULT")
        }
        set {
            if self.userDefault.value(forKey: "XP_RESULT") == nil {
                self.userDefault.set(0, forKey: "XP_RESULT")
            }
            self.userDefault.setValue(newValue, forKey: "XP_RESULT")
        }
    }

}
