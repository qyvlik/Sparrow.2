//! code from
import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

ProgressBar {
    id: progressBar
    /*!
           The color for the progress bar. By default this is
           the primary color defined in \l Theme::primaryColor
         */
    property color color: "#2196F3"
        
    width: dp * 200
    height: dp * 4
    
    style: ProgressBarStyle {
        background: Rectangle {
            width: control.width
            height: control.height
            color: control.color
            opacity: 0.2
        }
        progress: Rectangle {
            color: control.indeterminate ? "transparent" : control.color
            
            // Indeterminate animation
            Item {
                id: independentRect
                anchors.fill: parent
                visible: control.indeterminate
                Rectangle {
                    id: rect
                    property real end: 0
                    width: end - x
                    height: control.height
                    color: control.color
                    ParallelAnimation {
                        running: control.indeterminate
                        SequentialAnimation {
                            loops: Animation.Infinite
                            PauseAnimation {
                                duration: 500
                            }
                            
                            NumberAnimation{
                                target: rect; property: "x"
                                from: 0; to: control.width
                                duration: 1500
                                easing.type: Easing.InCubic
                            }
                        }
                        SequentialAnimation {
                            loops: Animation.Infinite
                            NumberAnimation {
                                target: rect; property: "end"
                                from: 0; to: control.width
                                duration: 1500
                            }
                            PauseAnimation {
                                duration: 500
                            }
                            ScriptAction {
                                script: rect.x = 0
                            }
                        }
                    }
                }
            }
        }
    }
}
