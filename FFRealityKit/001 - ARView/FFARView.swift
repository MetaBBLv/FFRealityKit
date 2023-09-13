//
//  FFARView.swift
//  FFRealityKit
//
//  Created by BBLv on 2023/9/9.
//
//  ARView
//ARView是一个视图，可以使用RealityKit显示增强现实（AR）体验。
//使用ARView实例来想用户显示渲染的3D图形。通常，会在应用程序storyBoard中添加一个视图，然后在代码中提供该视图的输出口。或者，可以在运行时以编程的方式创建并并添加一个视图到视图层次结构中，就像创建其他的视图一样。
//视图具有一个制度的scene属性，通过它可以访问一个Scene实例。可以向的Scene实例添加一个或多个AnchorEntity实例，这些实例告诉视图的AR会话如何将内容关联到现实世界的某个物体上。对于每个锚点，可以附加一个包含场景内容的其他Entity实例的层次结构

//此外，可以使用该是图完成以下操作：
//- 配置渲染选项、环境特性和相机模式。
//- 处理平台使用的用户交互，例如鼠标、键盘和手势输入。
//- 在视图中早到特定点处的实体。
//- 访问统计数据和可视化工具，帮助调试你的应用程序。

import SwiftUI
import RealityKit
import ARKit

//MARK: - 父类ARViewBase
//关于ARView的父类ARViewBase，实质上是UIView或NSView，分别对应iOS和mac平台，是UIView的一个别名
//typealias ARViewBase = UIView

//MARK: - ARView的两种常规初始化
//常规序列化
struct FFARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        //初始化ARView
        let arView = ARView(frame: .zero)
        //创建一个scene实例
        let scene = arView.scene
        //在scene中创建一个entity
        let entity = ModelEntity(mesh: .generateBox(size: 0.25), materials: [SimpleMaterial(color: .green, isMetallic: false)])
        //创建AnchorEntity并将ModelEntity添加到其中。
        let anchorEntity = AnchorEntity(world: [0,0,-0.5])
        anchorEntity.addChild(entity)
        //将anchorEntity添加到场景的锚点集合中
        scene.anchors.append(anchorEntity)
        return arView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

//MARK: - ARView的Property


struct FFARView: View {
    var body: some View {
        //init(frame:):创建具有制定尺寸、相机模式和会话配置状态的AR视图
        VStack {
            Text("ARView Above")
            FFARViewContainer()
                .frame(width: 300, height: 400)
            Text("ARView Below")
        }
    }
}

#Preview {
    FFARView()
}
