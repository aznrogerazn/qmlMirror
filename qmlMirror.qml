import QtQuick 2.0
import QtMultimedia 5.4

Rectangle {
    id:   page
    width: 1280
    height: 720
    transform: Rotation {
        origin.x: page.width / 2
        origin.y: page.height / 2
        axis.x: 0; axis.y: 1; axis.z: 0
        angle: 180
    }
   
    Camera {
        id: camera

        imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash

        exposure {
            exposureCompensation: -1.0
            exposureMode: Camera.ExposurePortrait
        }

        flash.mode: Camera.FlashRedEyeReduction

        imageCapture {
            onImageCaptured: {
                photoPreview.source = preview  // Show the preview in an Image
            }
        }
        position: Camera.FrontFace
    }

    VideoOutput {
        source: camera
        anchors.fill: parent
        focus : visible
        
    }
    Image {
           width: 140
           height: 140
           source: "logosmall.png"
           transform: Rotation {
                origin.x: page.width / 2
                origin.y: page.height / 2
                axis.x: 0; axis.y: 1; axis.z: 0
                angle: 180
           }
    }
}
