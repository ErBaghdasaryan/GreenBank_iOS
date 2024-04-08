//
//  BaseViewController.swift
//  greenbank-ios1
//
//  Created by Hovo Ohanyan on 11.01.24.
//

import UIKit
import GreenBank_ViewModel

/* The created BaseViewController will be needed to change the default UIViewController and configure it for other ViewControllers with similar properties and methods.
 */

public class BaseViewController<T: IViewModel>: UIViewController {
    public var viewModel: T?
}
