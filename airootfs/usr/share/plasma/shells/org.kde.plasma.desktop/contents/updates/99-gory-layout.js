var myPanels = panels();
if (myPanels.length > 0) {
    var p = myPanels[0];
    p.location = "top";
    p.height = 24;
    
    // Modify applets on the top panel
    for (var i = p.applets.length - 1; i >= 0; i--) {
        var plugin = p.applets[i].pluginName;
        // Change the launcher icon to a dot
        if (plugin === "org.kde.plasma.kickoff") {
            p.applets[i].currentConfigGroup = ["General"];
            p.applets[i].writeConfig("icon", "media-record");
        }
        // Remove task managers from top panel
        if (plugin === "org.kde.plasma.icontasks" || plugin === "org.kde.plasma.taskmanager" || plugin === "org.kde.plasma.pager") {
            p.applets[i].remove();
        }
    }
    
    // Add global menu next to the kickoff (index 1)
    p.addWidget("org.kde.plasma.appmenu");
}

var dock = new Panel("org.kde.panel");
dock.location = "bottom";
dock.height = 48;
dock.alignment = "center";
dock.lengthMode = "fit";
dock.floating = true;
dock.addWidget("org.kde.plasma.icontasks");
