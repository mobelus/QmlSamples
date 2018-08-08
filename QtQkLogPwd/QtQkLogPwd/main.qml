import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
//import QtQuick 2.1

//import Enginio 1.0
//import QtQuick.Controls 1.0
//import QtQuick.Layouts 1.0


ApplicationWindow
{
    visible: true
    width: 500
    height: 280
    title: qsTr("Hello World")

    //import QtQuick 2.7
    //import QtQuick.Controls 1.4

    Grid
    {
        id: rtfm
        x: 87; y: 69

        columns: 2
        rows: 3
        spacing: 5

        // Password stuff
        Label {
            id: login_label
            text: qsTr("Login")
        }

        TextField {
            id: login_field
            placeholderText: qsTr("Enter login")
            echoMode: TextInput.Normal
        }

        // Password stuff
        Label {
            id: password_label
            text: qsTr("Password")
        }

        TextField {
            id: password_field
            placeholderText: qsTr("Enter password")
            echoMode: TextInput.Password
        }

        // Confirm password stuff
        Label {
            id: confirm_password_label
            text: qsTr("Confirm password")
        }

        TextField {
            id: confirm_field
            placeholderText: qsTr("Confirm the password")
            echoMode: TextInput.PasswordEchoOnEdit

            // Called each time the user types in the confirm password text field.
            onTextChanged: {
                // Checks whether the password and its confirmation are the same.
                if (password_field.text === confirm_field.text) {
                    text_color_box.text = qsTr("Password and confirm password match.");
                    text_color_box.color = "#00ff00";
                }
                else {
                    text_color_box.text = qsTr("Password and confirm password do not match.");
                    text_color_box.color = "#ff0000";
                }
            }
        }
    }

    // Your text color box
    Text {
        id: text_color_box
        x: rtfm.x + rtfm.width/2 - text_color_box.paintedWidth/2 //rtfm.x
        y: rtfm.y + rtfm.height + 10
        text: qsTr("Enter your Login and Password and confirm Password.")
    }


/*
    ColumnLayout {

        EnginioOAuth2Authentication {
            id: identity
            user: login.text
            password: password.text
        }


        anchors.fill: parent
        anchors.margins: 3
        spacing: 3

        TextField {
            id: login
            Layout.fillWidth: true
            placeholderText: "Username"
            enabled: enginioClient.authenticationState == Enginio.NotAuthenticated
        }

        TextField {
            id: password
            Layout.fillWidth: true
            placeholderText: "Password"
            echoMode: TextInput.PasswordEchoOnEdit
            enabled: enginioClient.authenticationState == Enginio.NotAuthenticated
        }

        Button {
            id: proccessButton
            Layout.fillWidth: true
        }

        TextArea {
            id: data
            text: "Not logged in.\n\n"
            readOnly: true
            Layout.fillHeight: true
            Layout.fillWidth: true

            Connections {
                target: enginioClient
                onSessionAuthenticated: {
                    data.text = data.text + "User '"+ login.text +"' is logged in.\n\n" + JSON.stringify(reply.data, undefined, 2) + "\n\n"
                }
                onSessionAuthenticationError: {
                    data.text = data.text + "Authentication of user '"+ login.text +"' failed.\n\n" + JSON.stringify(reply.data, undefined, 2) + "\n\n"
                }
                onSessionTerminated: {
                    data.text = data.text + "Session closed.\n\n"
                }
            }
        }

        states: [
            State {
                name: "NotAuthenticated"
                when: enginioClient.authenticationState == Enginio.NotAuthenticated
                PropertyChanges {
                    target: proccessButton
                    text: "Login"
                    onClicked: {
                        enginioClient.identity = identity
                    }
                }
            },
            State {
                name: "Authenticating"
                when: enginioClient.authenticationState == Enginio.Authenticating
                PropertyChanges {
                    target: proccessButton
                    text: "Authenticating..."
                    enabled: false
                }
            },
            State {
                name: "AuthenticationFailure"
                when: enginioClient.authenticationState == Enginio.AuthenticationFailure
                PropertyChanges {
                    target: proccessButton
                    text: "Authentication failed, restart"
                    onClicked: {
                        enginioClient.identity = null
                    }
                }
            },
            State {
                name: "Authenticated"
                when: enginioClient.authenticationState == Enginio.Authenticated
                PropertyChanges {
                    target: proccessButton
                    text: "Logout"
                    onClicked: {
                        enginioClient.identity = null
                    }
                }
            }
        ]
    }
*/


    /*
    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1 {
        }

        Page {
            Label {
                text: qsTr("Second page")
                anchors.centerIn: parent
            }
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("First")
        }
        TabButton {
            text: qsTr("Second")
        }
    }
    */
}
