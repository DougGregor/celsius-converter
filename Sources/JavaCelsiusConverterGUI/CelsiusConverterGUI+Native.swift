//
//  CelsiusConverterGUI+Native.swift
//  JavaCelsiusConverterGUI
//
//  Created by Doug Gregor on 10/24/24.
//
import JavaKit

@JavaImplementation("learn.CelsiusConverterGUI")
extension CelsiusConverterGUI: CelsiusConverterGUINativeMethods {
  @JavaMethod
  func convertButtonActionPerformed(_ evt: ActionEvent?) {
    if let celsius = Double(tempTextField.getText()) {
      let fahrenheit = celsius * 1.8 + 32
      fahrenheitLabel.setText("\(fahrenheit)°F")
    } else {
      fahrenheitLabel.setText("(not a number)")
    }
  }
}
