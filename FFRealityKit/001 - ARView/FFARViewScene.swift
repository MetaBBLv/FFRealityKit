//
//  FFARViewScene.swift
//  FFRealityKit
//
//  Created by BBLv on 2023/9/13.
//

import SwiftUI
import RealityKit
//import ARKit

struct FFARViewSceneContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let arView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)
        let scene = arView.scene
        //在scene中创建一个entity
        let entity = ModelEntity(mesh: .generateBox(size: 0.25), materials: [SimpleMaterial(color: .green, isMetallic: false)])
        //创建AnchorEntity并将ModelEntity添加到其中。
        let anchorEntity = AnchorEntity(world: [0,0,-0.5])
        anchorEntity.addChild(entity)
        //将anchorEntity添加到场景的锚点集合中
        scene.anchors.append(anchorEntity)
        
        //MARK: - environment
        ///虚拟entity会被真实世界的物体遮挡
        arView.environment.sceneUnderstanding.options.insert(.occlusion)
        ///Receives lighting 接受照明（可以使虚拟物体更真实，看起来不像漂浮在空中，添加照明就会产生阴影，就会产生空间感）
        arView.environment.sceneUnderstanding.options.insert(.receivesLighting)
        ///physics 添加物理选项，重力效果等
        arView.environment.sceneUnderstanding.options.insert(.physics)
        ///collision 碰撞
        arView.environment.sceneUnderstanding.options.insert(.collision)
        
        //MARK: - Mesh visualization(网格可视化)
        ///给真实世界添加网格
        arView.debugOptions.insert(.showSceneUnderstanding)
        
        //MARK: - Improved Rendering Debugging

        return arView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct FFARViewScene: View {
    var body: some View {
        FFARViewSceneContainer()
            .frame(width: 300, height: 400)
    }
}

#Preview {
    FFARViewScene()
}
