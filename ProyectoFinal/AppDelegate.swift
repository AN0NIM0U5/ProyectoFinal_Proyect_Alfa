//
//  AppDelegate.swift
//  XAmpyAPP
//
//  Created by Alberto on 11/05/2019.
//  Copyright © 2019 Alberto. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UISplitViewControllerDelegate {

    var window: UIWindow?

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
               // Punto de anulación para la personalización después del inicio de la aplicación.
            let splitViewController = window!.rootViewController as! UISplitViewController
            let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
            navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
            splitViewController.preferredDisplayMode = .allVisible
            splitViewController.delegate = self
        
            UISearchBar.appearance().tintColor = .temaColor
            UINavigationBar.appearance().tintColor = .temaColor
            
        return true
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        
        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetallesViewController else { return false }
        
        if topAsDetailController.detallesMenu == nil {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        return false
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Se envía cuando la aplicación está a punto de pasar del estado activo al estado inactivo. Esto puede ocurrir para ciertos tipos de interrupciones temporales (como una llamada telefónica entrante o un mensaje SMS) o cuando el usuario abandona la aplicación y comienza la transición al estado de fondo.
        // Use este método para pausar las tareas en curso, deshabilitar los temporizadores e invalidar las devoluciones de llamadas de representación gráfica. Los juegos deben usar este método para pausar el juego.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use este método para liberar recursos compartidos, guardar datos de usuario, invalidar temporizadores y almacenar suficiente información de estado de la aplicación para restaurar su aplicación a su estado actual en caso de que se finalice más adelante.
        // Si su aplicación admite la ejecución en segundo plano, se llama a este método en lugar de applicationWillTerminate: cuando el usuario se cierra.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Llamado como parte de la transición desde el fondo al estado activo; Aquí puede deshacer muchos de los cambios realizados al ingresar el fondo.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Reinicie las tareas que se pausaron (o aún no se iniciaron) mientras la aplicación estaba inactiva. Si la aplicación estaba previamente en segundo plano, opcionalmente actualice la interfaz de usuario.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Llamado cuando la aplicación está a punto de terminar. Guardar los datos si es apropiado. Véase también applicationDidEnterBackground
        
    }


}


//
//  AppDelegate.swift
//  PROYECTO_Alfa
//
//  Created by Alberto on 19/05/2019.
//  Copyright © 2019 Alberto. All rights reserved.
//

//
//
//@UIApplicationMain
//class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate
//{
//
//    var window: UIWindow?
//
//
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        // Punto de anulación para la personalización después del inicio de la aplicación.
//
//        let splitViewController = window!.rootViewController as! UISplitViewController
//        let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
//        navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
//        splitViewController.preferredDisplayMode = .allVisible
//        splitViewController.delegate = self
//
//        UISearchBar.appearance().tintColor = .temaColor
//        UINavigationBar.appearance().tintColor = .temaColor
//
//        /// Request local notification authorizations.
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { accepted, error in
//            if !accepted {
//                print("Notification access denied.")
//                /// Render actions for notification.
//
//
//                let action = UNNotificationAction(identifier: "remindLater", title: "Remind me later", options: [])
//                let category = UNNotificationCategory(identifier: "normal", actions: [action], intentIdentifiers: [], options: [])
//                UNUserNotificationCenter.current().setNotificationCategories([category])
//            }
//        }
//
//
//
//        return true
//    }
//
//    /// Create a local notification at specific date.
//    ///
//    /// - Parameter date: Time to trigger notification.
//    func scheduleNotification(at date: Date) {
//        UNUserNotificationCenter.current().delegate = self
//
//        /// Create date component from date.
//        let calendar = Calendar(identifier: .gregorian)
//        let components = calendar.dateComponents(in: .current, from: date)
//        let newComponents = DateComponents.init(calendar: calendar, timeZone: .current, month: components.month, day: components.day, hour: components.hour, minute: components.minute)
//
//        /// Create trigger and content.
//        let trigger = UNCalendarNotificationTrigger(dateMatching: newComponents, repeats: false)
//        let content = UNMutableNotificationContent()
//        content.title = "Coding Reminder"
//        content.body = "Ready to code? Let us do some Swift!"
//        content.sound = UNNotificationSound.default
//        content.categoryIdentifier = "normal"
//
//        /// Add a image as attachment.
//        if let path = Bundle.main.path(forResource: "Swift", ofType: "png") {
//            let url = URL(fileURLWithPath: path)
//
//            do {
//                let attachment = try UNNotificationAttachment(identifier: "Swift", url: url, options: nil)
//                content.attachments = [attachment]
//            } catch {
//                print("The attachment was not loaded.")
//            }
//        }
//
//        /// Make a notification request.
//        let request = UNNotificationRequest(identifier: "textNotification", content: content, trigger: trigger)
//
//        /// Remove pending notifications to avoid duplicates.
//        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
//
//        /// Provide request to notification center.
//        UNUserNotificationCenter.current().add(request) { (error) in
//            if let error = error {
//                print("Error: " + error.localizedDescription)
//            }
//        }
//    }
//}
//
//extension AppDelegate: UNUserNotificationCenterDelegate {
//    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//        if response.actionIdentifier == "remindLater" {
//            let newDate = Date(timeInterval: 60, since: Date())
//            scheduleNotification(at: newDate)
//        }
//    }
//}
//
//
//
//
//func applicationWillResignActive(_ application: UIApplication) {
//    // Se envía cuando la aplicación está a punto de pasar del estado activo al estado inactivo. Esto puede ocurrir para ciertos tipos de interrupciones temporales (como una llamada telefónica entrante o un mensaje SMS) o cuando el usuario abandona la aplicación y comienza la transición al estado de fondo.
//    // Use este método para pausar las tareas en curso, deshabilitar los temporizadores e invalidar las devoluciones de llamadas de representación gráfica. Los juegos deben usar este método para pausar el juego.
//}
//
//func applicationDidEnterBackground(_ application: UIApplication) {
//    // Use este método para liberar recursos compartidos, guardar datos de usuario, invalidar temporizadores y almacenar suficiente información de estado de la aplicación para restaurar su aplicación a su estado actual en caso de que se finalice más adelante.
//    // Si su aplicación admite la ejecución en segundo plano, se llama a este método en lugar de applicationWillTerminate: cuando el usuario se cierra.
//}
//
//func applicationWillEnterForeground(_ application: UIApplication) {
//    // Llamado como parte de la transición desde el fondo al estado activo; Aquí puede deshacer muchos de los cambios realizados al ingresar el fondo.
//}
//
//func applicationDidBecomeActive(_ application: UIApplication) {
//    // Reinicie las tareas que se pausaron (o aún no se iniciaron) mientras la aplicación estaba inactiva. Si la aplicación estaba previamente en segundo plano, opcionalmente actualice la interfaz de usuario.
//}
//
//func applicationWillTerminate(_ application: UIApplication) {
//    // Llamado cuando la aplicación está a punto de terminar. Guardar los datos si es apropiado. Véase también applicationDidEnterBackground
//
//}
//
//
//
//
//
