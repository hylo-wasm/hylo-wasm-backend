// swift-tools-version: 6.3

import PackageDescription

let package = Package(
  name: "hylo-wasm-backend",
  platforms: [
    .macOS(.v26)
  ],
  products: [
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
