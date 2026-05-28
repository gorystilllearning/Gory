var myPanels = panels();
for (var i = 0; i < myPanels.length; i++) {
    myPanels[i].remove();
}

var topPanel = new Panel("org.kde.panel");
topPanel.location = "top";
topPanel.height = 24;
topPanel.addWidget("org.kde.plasma.kickoff");
topPanel.addWidget("org.kde.plasma.appmenu");
topPanel.addWidget("org.kde.plasma.marginsseparator");
topPanel.addWidget("org.kde.plasma.systemtray");
topPanel.addWidget("org.kde.plasma.digitalclock");

// configure kickoff to have the media-record icon
for (var i = 0; i < topPanel.applets.length; i++) {
    if (topPanel.applets[i].pluginName === "org.kde.plasma.kickoff") {
        topPanel.applets[i].currentConfigGroup = ["General"];
        topPanel.applets[i].writeConfig("icon", "media-record");
    }
}

var dock = new Panel("org.kde.panel");
dock.location = "bottom";
dock.height = 48;
dock.alignment = "center";
dock.lengthMode = "fit";
dock.floating = true;
dock.addWidget("org.kde.plasma.icontasks");
