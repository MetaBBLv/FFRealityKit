//
//  ContentView.swift
//  FFRealityKit
//
//  Created by BBLv on 2023/9/9.
//
//  RealityKit用于模拟和渲染3D内容用于增强现实应用程序
//  RealityKit提供高性能的3D模拟和渲染功能，可以使用它来创建visionOS应用程序或未iOS、macOS和tvOS创建增强现实（AR）应用程序。RealityKit是一个ar优先于3D框架，它利用ARKit将虚拟对象无缝集成到现实世界中。

//使用RealityKit的丰富功能来创建引人入胜的增强现实（AR）体验。
//- 通过使用Reality Composer Pro for visionOS创建和导入完整的RealityKit场景，包括模型、动画和空间音频
//- 通过从代码中添加3D模型、形状基元和声音来构建和修改场景。
//- 使用虚拟对象于现实世界中的对象互动。
//- 手动和通过物理模拟来为对象添加动画。
//- 响应用户输入和人们周围的环境变化。
//- 阔设备同步并使用SharePlay来启用群体AR体验。

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
