//
//  AppConstants.swift
//  Fleet_Managment
//
//  Created by AppsTeamMacMini on 22/06/22.
//

import Foundation
import UIKit

struct AppDetails {
    //App Details
    static let APP_NAME = "Fleet Management"
    static let BUNDIL_ID = ""
}

struct AppURL {
    //static let BASE_URL = "https://fleetmobilemaintenance.com/api/"//"https://api.girfalco.sa/v2/" //LIVE
    //static let BASE_URL = "http://51.222.143.153:3001/v2/"
    static let BASE_URL = "https://epikonnectdev.epika.io/api/" //DEV
    static let SignIn = BASE_URL + "authenticate"
    static let logout = BASE_URL + "logout_from_device"
    static let forgotPassword = BASE_URL + "forgot_password"
    static let createRequest = BASE_URL + "create_work_request"
    static let createNewRequest = BASE_URL + "get_master_data"
    static let requestList = BASE_URL + "list_work_requests"
    static let editRequest = BASE_URL + "edit_work_request"
    static let deleteRequest = BASE_URL + "delete_work_request"
}

struct AppUI {
    static let NAV_BAR_SHADOW_COLOR = UIColor().colorFromHexString("#EFF2F4")
    
}

struct ApiKeys {
    static let login = "login"
    static let email = "email"
    static let password = "password"
    static let deviceId = "registered_id"
    
    
}

struct AppKeys {
    static let isLoggedIn = "isLoggedIn"
}

struct AppAlertMsg {
    static let netWorkAlertMessage = "No internet connection. Please move to an area with a better internet connection and click Retry to proceed."
    static let serverNotReached = "The server could not be reached because of a connection problem. Please click Retry to proceed."
    static let INVALID_CREDENTIAL = "Invalid Login Credentials"
    static let NoNotification = "No notification"
    static let PROFILE_EMPTY = "Please select profile photo"
    static let EMAIL_EMPTY = "Email Id cannot be empty"
    static let INVALID_EMAIL = "Invalid Email Address"
    static let PASSWORD_EMPTY = "Please enter a password to proceed"
    static let EMAIL_OR_PASSWORD_EMPTY = "Please enter Email Address / Password to proceed"
    static let FIRST_NAME_EMPTY = "First Name cannot be empty"
    static let SECOND_NAME_EMPTY = "Last name cannot be empty"
    static let PHONE_EMPTY = "Phone Number cannot be empty"
    static let PHONE_MIN_LENGTH = "Please enter a valid phone number"
    static let DESCRIPTION_EMPTY = "Please enter description"
    static let SESSION_EXPIRED = "You have logged into another device using the same account. Please login again"
    static let LOCATION_NOT_FOUND = "No location info available"
    static let SOMETHING_WRONG = "Something went wrong."
    static let TERMS_CONDITION = "Please check Terms & Conditions to proceed"
    static let ADDRESS_EMPTY = "Address cannot be empty"
}

struct AppAlertButtonTitle {
    static let okBuutonTitle = "OK"
    static let cancelBuutonTitle = "Cancel"
    static let yesBuutonTitle = "Yes"
    static let noBuutonTitle = "No"
    static let retryButtonTitle = "Retry"
}

struct AppAlertTitle {
    static let rejectRequestTitle = "Reject Request"
    static let revokecaregiverTitle = "Revoke Caregiver"
    static let revokeRescueeTitle = "Revoke Rescuee"
    //satheesh
    static let addSuppportCastTitle="Support Cast request successfully sent.\nYou may start linking Rescuee(s) to"
    static let deleteSupportCastRequestTitle="Delete Request"
    static let remindSupportCastRequest="Remind Request"
}

struct AppValidationMessages {
    static let requiredField = "This is a required field"
    static let validPhoneNumber = "Please enter valid number"
    static let validEmail = "Please enter valid email"
    static let validPassword = "Please enter valid password"
    static let validDOB = "Invalid date of birth"
    
}
