//
//  doctorModel.swift
//  DoctorAppointmentApp
//
//  Created by Manish Jawale on 30/04/25.
//

import Foundation

struct Doctor : Codable {
    let doctorID : String
    let doctorName : String
    let doctorSpeciality : String
    let doctorLocation : String
    let doctorExperienceYears : Int
    let doctorRating : Double
    let doctorReviewCount : Int
    let doctorPatientCount : Int
    let doctorImageURL : String?
    let doctorAvailableSlots : [DoctorAvailableSlot]
    
}


struct DoctorAvailableSlot : Codable {
    let dateDAS : Date
    let times : [String]
}
