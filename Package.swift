// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "hylo-wasm-backend",
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "HyloWasmBackEnd",
      targets: ["WasmBackEnd"]
    )
  ],
  dependencies: [
    .package(path: "./hylo-new"),
    .package(path: "./swifty-wasm"),
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "WasmBackEnd",
      dependencies: [
        .product(name: "HyloFrontEnd", package: "hylo-new"),
        .product(name: "SwiftyWasm", package: "swifty-wasm"),
      ]
    ),
    .testTarget(
      name: "WasmBackEndTests",
      dependencies: ["WasmBackEnd"]
    ),
  ],
  swiftLanguageModes: [.v6]
)
