// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum AddMoneyScreen {
    /// Type here
    internal static let placeholder = L10n.tr("Localizable", "AddMoneyScreen.Placeholder", fallback: "Type here")
  }
  internal enum Alert {
    internal enum Action {
      /// Ok
      internal static let ok = L10n.tr("Localizable", "Alert.Action.Ok", fallback: "Ok")
    }
    internal enum EmptyAdd {
      /// Please specify amount of money
      internal static let message = L10n.tr("Localizable", "Alert.EmptyAdd.Message", fallback: "Please specify amount of money")
      /// How much do you want to add?
      internal static let title = L10n.tr("Localizable", "Alert.EmptyAdd.Title", fallback: "How much do you want to add?")
    }
    internal enum EmptyAmount {
      /// Please specify amount of spent money
      internal static let message = L10n.tr("Localizable", "Alert.EmptyAmount.Message", fallback: "Please specify amount of spent money")
      /// How much did you spend?
      internal static let title = L10n.tr("Localizable", "Alert.EmptyAmount.Title", fallback: "How much did you spend?")
    }
    internal enum EmptyTransactionType {
      /// Please choose category
      internal static let message = L10n.tr("Localizable", "Alert.EmptyTransactionType.Message", fallback: "Please choose category")
      /// What did you spent your money on?
      internal static let title = L10n.tr("Localizable", "Alert.EmptyTransactionType.Title", fallback: "What did you spent your money on?")
    }
  }
  internal enum General {
    /// Add money
    internal static let addButtonTitle = L10n.tr("Localizable", "General.AddButtonTitle", fallback: "Add money")
    /// Added money
    internal static let addedMoneyTransactionType = L10n.tr("Localizable", "General.AddedMoneyTransactionType", fallback: "Added money")
    /// Add transaction
    internal static let addTransactionButtonTitle = L10n.tr("Localizable", "General.AddTransactionButtonTitle", fallback: "Add transaction")
    /// Localizable.strings
    ///   WalletApp
    /// 
    ///   Created by Anastasia Golts on 27.12.2022.
    internal static let walletApp = L10n.tr("Localizable", "General.WalletApp", fallback: "WalletApp")
  }
  internal enum MainScreen {
    /// Balance: 
    internal static let balance = L10n.tr("Localizable", "MainScreen.Balance", fallback: "Balance: ")
    /// Bitcoin: 
    internal static let bitcoin = L10n.tr("Localizable", "MainScreen.Bitcoin", fallback: "Bitcoin: ")
    /// transactionCellIdentifier
    internal static let transactionCellIdentifier = L10n.tr("Localizable", "MainScreen.TransactionCellIdentifier", fallback: "transactionCellIdentifier")
  }
  internal enum TransactionScreen {
    /// Spent amount of money
    internal static let placeholder = L10n.tr("Localizable", "TransactionScreen.Placeholder", fallback: "Spent amount of money")
  }
  internal enum TransactionType {
    /// Electronics
    internal static let electronics = L10n.tr("Localizable", "TransactionType.Electronics", fallback: "Electronics")
    /// Groceries
    internal static let groceries = L10n.tr("Localizable", "TransactionType.Groceries", fallback: "Groceries")
    /// Not chosen
    internal static let notChosen = L10n.tr("Localizable", "TransactionType.NotChosen", fallback: "Not chosen")
    /// Other
    internal static let other = L10n.tr("Localizable", "TransactionType.Other", fallback: "Other")
    /// Restaurants
    internal static let restaurants = L10n.tr("Localizable", "TransactionType.Restaurants", fallback: "Restaurants")
    /// Taxi
    internal static let taxi = L10n.tr("Localizable", "TransactionType.Taxi", fallback: "Taxi")
  }
  internal enum WalletAppTextField {
    /// Done
    internal static let doneButtonTitle = L10n.tr("Localizable", "WalletAppTextField.DoneButtonTitle", fallback: "Done")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
