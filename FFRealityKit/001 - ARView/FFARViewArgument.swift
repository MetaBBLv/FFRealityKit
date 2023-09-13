//
//  FFARViewArgument.swift
//  FFRealityKit
//
//  Created by BBLv on 2023/9/12.
//

import SwiftUI
import RealityKit

//指定更多参数序列化
//init(frame:cameraMode:automaticallyConfigureSession:)
//- frame： 以point为单位测量
//- cameraMode： 指示是使用设备摄像头还是虚拟摄像头
//- automcallyConfigureSession：指示是否使用AR会话，该会话配置会根据相机模式和场景锚自动更新。如果希望使用自己的配置手动运行，将值设定为false
struct FFARViewArgumentContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        //初始化ARView
        let arView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)
        //创建一个scene实例
        let scene = arView.scene
        //在scene中创建一个entity
        let entity = ModelEntity(mesh: .generateBox(size: 0.5), materials: [SimpleMaterial(color: .red, isMetallic: false)])
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

struct FFARViewArgument: View {
    var body: some View {
        //参数说明：
        //- frameRect： 视图的帧矩形，以点（point）为单位来测量
        //- camerMode: 指示是否使用设备的摄像头或虚拟摄像头。
        //- automaticallyConfigureSession：指示是否使用具有根据摄像头模式和场景猫店自动更新的配置的AR会话。如果想要手动使用自己的配置来运行会话，将此值设置为false
        VStack {
            Text("ARView Above")
            FFARViewArgumentContainer()
                .frame(width: 300, height: 400)
            Text("ARView Below")
                        
        }
    }
}

#Preview {
    FFARViewArgument()
}
