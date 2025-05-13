//
//  MailHelper.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 13/05/25.
//

import SwiftUI
import MessageUI

struct MailComposeView: UIViewControllerRepresentable {
    @Binding var result: Result<MFMailComposeResult, Error>?
    var recipient: String
    var subject: String
    var body: String
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        @Binding var result: Result<MFMailComposeResult, Error>?
        
        init(result: Binding<Result<MFMailComposeResult, Error>?>) {
            _result = result
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            defer { controller.dismiss(animated: true) }
            if let error = error {
                self.result = .failure(error)
                return
            }
            self.result = .success(result)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(result: $result)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        if MFMailComposeViewController.canSendMail() {
            let mailComposeVC = MFMailComposeViewController()
            mailComposeVC.mailComposeDelegate = context.coordinator
            mailComposeVC.setToRecipients([recipient])
            mailComposeVC.setSubject(subject)
            mailComposeVC.setMessageBody(body, isHTML: false)
            return mailComposeVC
        } else {
            // Return a dummy view controller if mail can't be sent
            return UIViewController()
        }
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
