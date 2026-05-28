var myPanels = panels();
if (myPanels.length > 0) {
    var p = myPanels[0];
    p.location = "top";
    p.height = 24;
    
    // Change the launcher icon to a dot (media-record)
    for (var i = 0; i < p.applets.length; i++) {
        if (p.applets[i].pluginName === "org.kde.plasma.kickoff") {
            p.applets[i].currentConfigGroup = ["General"];
            p.applets[i].writeConfig("icon", "media-record");
        }
    }
}

var dock = new Panel("org.kde.panel");
dock.location = "bottom";
dock.height = 48;
dock.alignment = "center";
dock.lengthMode = "fit";
dock.floating = true;
dock.addWidget("org.kde.plasma.icontasks");
