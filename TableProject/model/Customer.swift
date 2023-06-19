//
//  Customer.swift
//  LayoutProject
//
//  Created by Karin Prater on 28.04.23.
//

import Foundation

struct Customer: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let email: String
    let isSubscribed: Bool
    let status: SubscriptionStatus
    let moneySpent: Int
    let creationDate: Date
    
    init(name: String,
         email: String,
         isSubscribed: Bool = false,
         status: SubscriptionStatus = .cancelled,
         moneySpent: Int = 0,
         creationDate: Date) {
        self.name = name
        self.email = email
        self.isSubscribed = isSubscribed
        self.status = status
        self.moneySpent = moneySpent
        self.creationDate = creationDate
    }
    
    var fomattedisSubscribed: String {
        isSubscribed ? "subscribed" : "not subscribed"
    }
    
    public var formattedDate: String {
        let date: String = {
            if Calendar.current.isDateInToday(creationDate) {
                return String(localized: "Today")
            } else if Calendar.current.isDateInYesterday(creationDate) {
                return String(localized: "Yesterday")
            } else {
                return creationDate.formatted(date: .numeric, time: .omitted)
            }
        }()
        let time = creationDate.formatted(date: .omitted, time: .shortened)
        return "\(date), \(time)"
    }
    
    static func examples() -> [Customer] {
        [ Customer(name: "John Smith", email: "john.smith@example.com",
                   isSubscribed: true, status: .cancelled,
                   moneySpent: 100, creationDate: Date() + 100),
          Customer(name: "Jane Doe", email: "jane.doe@example.com",
                   isSubscribed: false, status: .full,
                   moneySpent: 50, creationDate: Date() - 3000),
          Customer(name: "Bob Johnson", email: "bob.johnson@example.com",
                   isSubscribed: true, status: .trial,
                   moneySpent: 200, creationDate: Date())]
    }
}

enum SubscriptionStatus: Int, Codable, Comparable {
    case trial
    case full
    case cancelled
    case expired
    
    var title: String {
        switch self {
            case .trial:
                return "on trial"
            case .full:
                return "active"
            case .cancelled:
                return "canceled"
            case .expired:
                return "expired"
        }
    }
    
    public static func < (lhs: SubscriptionStatus, rhs: SubscriptionStatus) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}
