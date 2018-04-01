//: Playground - noun: a place where people can play

// Constructing Struct for API Calls.

import UIKit


// POST API CALL

struct postApi: Encodable{
    let emailId: String!
}
private enum CodingKeys: String, CodingKey {
    case emailId = "email_Id"
}

// GET API CALL

struct InitialLoad: Decodable {
    
    let result: initialresults?
    
}

struct initialresults: Decodable {
    
    let data: initialData?
    let message: String?
    let status: Bool?
    let statusCode: Int?
    
    private enum CodingKeys: String, CodingKey {
        case data
        case message
        case status
        case statusCode = "status_code"
    }
}

struct initialData: Decodable{
    
    
    let image: [InitialImage]?
    let creditBal: String?
    let conditions: [termsConditions]?
    let sliderMenu: [SliderMenu]?
    let token: String?
    
    private enum CodingKeys: String, CodingKey {
        case image
        case creditBal = "credit_bal"
        case conditions
        case sliderMenu = "slider_menu"
        case token
    }
}

struct InitialImage: Decodable {
    
    let imageUrl: String?
    let text1: String?
    let text2: String?
    
}

struct termsConditions: Decodable {
    
    let terms: String?
    let policy: String?
    
}

struct SliderMenu: Decodable {
    
    let imageUrl: String?
    let link: String?
    
}
