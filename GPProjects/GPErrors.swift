//
//  GPErrors.swift
//  GPProjects
//
//  Created by Mukhammadjon Askarov on 25/12/20.
//

import Foundation

enum GPError: String, Error {
    
    case invalidUsername  = "This username created an invalid request. Please, try again."
    case unableToComplete = "Unable to complete Your request. Please, check your internet connection"
    case invalidResponse  = "Invalid response from the  server. Please, Try again."
    case invalidData      = "The data received from the server was invalid "
}
