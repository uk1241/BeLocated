//
//  onBoardingViewController.swift
//  BelocatedTabBar
//
//  Created by R.Unnikrishnan on 07/09/23.
//

import UIKit
import FacebookLogin
import GoogleSignIn
import FirebaseCore
import FirebaseAuth
import AuthenticationServices

class onBoardingViewController: UIViewController ,ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding{
    @IBOutlet var emailSignInBtn: UIButton!
    @IBOutlet var googleSignInBtn: UIButton!
    @IBOutlet var facebookSignInBtn: UIButton!
    @IBOutlet var appleSignInBtn: UIButton!
    let KGoogle = GIDSignIn.sharedInstance.configuration


    override func viewDidLoad() {
        super.viewDidLoad()
        emailSignInBtn.makeRounded()
        googleSignInBtn.makeRounded()
        facebookSignInBtn.makeRounded()
        appleSignInBtn.makeRounded()
        
        emailSignInBtn.addTarget(self, action: #selector(emailSignIN), for: .touchUpInside)
        googleSignInBtn.addTarget(self, action: #selector(googleSignIN), for: .touchUpInside)
        facebookSignInBtn.addTarget(self, action: #selector(facebookSignIN), for: .touchUpInside)
        appleSignInBtn.addTarget(self, action: #selector(appleSignIN), for: .touchUpInside)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    
    @objc func emailSignIN()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController

        if let navigationController = self.navigationController {
            navigationController.pushViewController(loginVc, animated: true)
        }
    }
    
    
    @objc func googleSignIN()
    {
        performGoogleSignInFlow()
    }
    
    @objc func facebookSignIN()
    {
        // Trigger Facebook login when the button is tapped
           let loginManager = LoginManager()
           loginManager.logIn(permissions: [.publicProfile, .email], viewController: self) { loginResult in
               switch loginResult {
               case .success(_, _, let token):
                   // Facebook login was successful, you can access the token here
                   print("Facebook login successful. Token: \(token.tokenString)")
                   let storyboard = UIStoryboard(name: "Main", bundle: nil)
                   let mainVc = storyboard.instantiateViewController(withIdentifier: "AlertViewController") as! LoginViewController

                   if let navigationController = self.navigationController {
                       navigationController.pushViewController(mainVc, animated: true)
                   }
                   
                   // You can use the token to make requests to the Facebook Graph API or perform other tasks.
               case .failed(let error):
                   // Handle login failure
                   print("Facebook login failed with error: \(error.localizedDescription)")
               case .cancelled:
                   // Handle user cancellation
                   print("Facebook login was cancelled")
               }
           }
    }
    // MARK: - appleSignIN
    @objc func appleSignIN()
    {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error.localizedDescription)
    }

    /// Handle successful sign ins
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        guard let credentials = authorization.credential as? ASAuthorizationAppleIDCredential else { return }
        print("credentials,\(credentials)")
//        identifierLabel.text = "Identifier: " + credentials.user
        
        let statusText: String
        switch credentials.realUserStatus {
        case .likelyReal:
            statusText = "You are trusted by Apple"
        case .unsupported:
            statusText = "You're not trusted by Apple"
        case .unknown:
            statusText = "Apple does not know whether to trust you"
        @unknown default:
            statusText = "Unknown trust status"
        }
         print("statusText" , statusText)
        
        // On secondary sign ins, credentials are no longer provided, instead, only the user ID is available
//        nameLabel.text = credentials.fullName?.description ?? nameLabel.text
//        emailLabel.text = credentials.email ?? emailLabel.text
    }
    
    // MARK: - ASAuthorizationControllerPresentationContextProviding
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window ?? UIWindow()
    }
    
    private func performGoogleSignInFlow() {
        // [START headless_google_auth]
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        // [START_EXCLUDE silent]
        // TODO: Move configuration to Info.plist
        // [END_EXCLUDE]
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
            guard error == nil else {
                // [START_EXCLUDE]
                return
                // [END_EXCLUDE]
            }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else {
                // [START_EXCLUDE]
                let error = NSError(
                    domain: "GIDSignInError",
                    code: -1,
                    userInfo: [
                        NSLocalizedDescriptionKey: "Unexpected sign in result: required authentication data is missing.",
                    ]
                )
                
                
                return displayError(error)
                // [END_EXCLUDE]
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)
            
            // [START_EXCLUDE]
            signIn(with: credential)
            
            // [END_EXCLUDE]
        }
        
        // [END headless_google_auth]
    }
    
    func signIn(with credential: AuthCredential) {
      // [START signin_google_credential]
      Auth.auth().signIn(with: credential) { result, error in
        // [START_EXCLUDE silent]
        guard error == nil else { return self.displayError(error) }
        // [END_EXCLUDE]
//          let storyboard = UIStoryboard(name: "Main", bundle: nil)
//          let alertVc = storyboard.instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
          
          let storyboard = UIStoryboard(name: "Main", bundle: nil)
          let alertVc = storyboard.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController

          if let navigationController = self.navigationController {
              navigationController.pushViewController(alertVc, animated: true)
          }
          print("**************************************SignIn successfull****************************************")
      }
      // [END signin_google_credential]
    }

}
extension UIViewController {
  public func displayError(_ error: Error?, from function: StaticString = #function) {
    guard let error = error else { return }
    print("ⓧ Error in \(function): \(error.localizedDescription)")
    let message = "\(error.localizedDescription)\n\n Ocurred in \(function)"
    let errorAlertController = UIAlertController(
      title: "Error",
      message: message,
      preferredStyle: .alert
    )
    errorAlertController.addAction(UIAlertAction(title: "OK", style: .default))
    present(errorAlertController, animated: true, completion: nil)
  }
}
