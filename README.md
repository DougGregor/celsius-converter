# Swift/Java Interoperability Example: Swing Celsius -> Fahrenheit converter

This repository demonstrates Swift targets that mix Java and Swift
source files, where Swift can be used to implement `native` methods
declared in Java. It uses the
[swift-java](https://github.com/swiftlang/swift-java/) package for
Swift/Java interoperability.

## How to run the example

First, set the `JAVA_HOME` environment variable to point to your Java installation.

Then, build the example with the following command:

```
swift build
```

Finally, run the example as follows:

```
java -cp .build/plugins/outputs/celsius-converter/JavaCelsiusConverterGUI/destination/JavaCompilerPlugin/Java -Djava.library.path=.build/debug learn.CelsiusConverterGUI
```

## Exploring the source

The project only has two source files:
* `Sources/JavaCelsiusConverterGUI/learn/CelsiusConverterGUI.java`: Java source code for the Java parts of this example, which originally came from [a Java tutorial](https://docs.oracle.com/javase/tutorial/uiswing/learn/creatinggui.html).
* `Sources/JavaCelsiusConverterGUI/CelsiusConverterGUI+Native.swift`: Swift source code that implements the `native` Java methods for `CelsiusConverterGUI`.

## Evolution of the example from Java to (mostly) Swift

The HEAD of the `main` branch contains the final version of the the program, with a mix of Java and Swift. Browse back in the git history for this project to see earlier states, starting with an all-Java implementation and then moving toward Swift implementations one commit at a time.