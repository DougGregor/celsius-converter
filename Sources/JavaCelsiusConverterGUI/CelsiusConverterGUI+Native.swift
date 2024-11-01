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
  func initComponents() {
    tempTextField = JTextField()
    celsiusLabel = JLabel()
    convertButton = JButton()
    fahrenheitLabel = JLabel()

    try! setDefaultCloseOperation(JavaClass<WindowConstants>().EXIT_ON_CLOSE)
    setTitle("Celsius Converter in Swift")

    celsiusLabel.setText("Celsius")
    convertButton.setText("Convert")
    fahrenheitLabel.setText("Fahrenheit")

    let layout = GroupLayout(getContentPane())
    getContentPane().setLayout(layout.as(LayoutManager.self))

    let groupAlignmentClass = try! JavaClass<GroupLayout.Alignment>()
    let groupLayoutClass = try! JavaClass<GroupLayout>()
    let componentPlacementClass = try! JavaClass<LayoutStyle.ComponentPlacement>()
    let swingConstantsClass = try! JavaClass<SwingConstants>()
    try! layout.setHorizontalGroup(
      layout.createParallelGroup(groupAlignmentClass.LEADING)
        .addGroup(layout.createSequentialGroup()
          .addContainerGap()
          .addGroup(layout.createParallelGroup(groupAlignmentClass.LEADING)
            .addGroup(layout.createSequentialGroup()
              .addComponent(tempTextField,
                            groupLayoutClass.PREFERRED_SIZE,
                            groupLayoutClass.DEFAULT_SIZE,
                            groupLayoutClass.PREFERRED_SIZE)
                .addPreferredGap(componentPlacementClass.RELATED)
                .addComponent(celsiusLabel)
                .as(GroupLayout.Group.self))
              .addGroup(layout.createSequentialGroup()
                .addComponent(convertButton)
                .addPreferredGap(componentPlacementClass.RELATED)
                .addComponent(fahrenheitLabel)
                .as(GroupLayout.Group.self))
                .as(GroupLayout.Group.self))
            .addContainerGap(27, Int32(JavaClass<JavaShort>().MAX_VALUE))
            .as(GroupLayout.Group.self))
        .as(GroupLayout.Group.self)
    )

    layout.linkSize(swingConstantsClass.HORIZONTAL, [convertButton, tempTextField])

    try! layout.setVerticalGroup(
      layout.createParallelGroup(groupAlignmentClass.LEADING)
        .addGroup(layout.createSequentialGroup()
          .addContainerGap()
          .addGroup(layout.createParallelGroup(groupAlignmentClass.BASELINE)
            .addComponent(tempTextField, groupLayoutClass.PREFERRED_SIZE, groupLayoutClass.DEFAULT_SIZE, groupLayoutClass.PREFERRED_SIZE)
            .addComponent(celsiusLabel)
            .as(GroupLayout.Group.self))
            .addPreferredGap(componentPlacementClass.RELATED)
            .addGroup(layout.createParallelGroup(groupAlignmentClass.BASELINE)
              .addComponent(convertButton)
              .addComponent(fahrenheitLabel)
              .as(GroupLayout.Group.self))
              .addContainerGap(21, Int32(JavaClass<JavaShort>().MAX_VALUE))
              .as(GroupLayout.Group.self)
        )!
        .as(GroupLayout.Group.self)
    )

    pack()
  }
  
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
