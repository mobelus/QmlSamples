var component;
var sprite;

function createSpriteObjects() {
    component = Qt.createComponent("ErrorCircle.qml");
    sprite = component.createObject(appWindow, {"x": 350, "y": 350});

    if (sprite == null) {
        // Error Handling
        console.log("Error creating object");
    }
	else
	{
        console.log("Creation OK!");
	}
}