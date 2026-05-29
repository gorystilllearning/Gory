var myPanels = panels();
for (var i = 0; i < myPanels.length; i++) {
    myPanels[i].remove();
}

var topPanel = new Panel("org.kde.panel");
topPanel.location = "top";
topPanel.height = 24;

var kickoff = topPanel.addWidget("org.kde.plasma.kickoff");
kickoff.currentConfigGroup = ["General"];
kickoff.writeConfig("icon", "radiobutton-unchecked"); // pure circle icon

topPanel.addWidget("org.kde.plasma.appmenu");
topPanel.addWidget("org.kde.plasma.panelspacer");
topPanel.addWidget("org.kde.plasma.digitalclock");
topPanel.addWidget("org.kde.plasma.panelspacer");
topPanel.addWidget("org.kde.plasma.systemtray");

var dock = new Panel("org.kde.panel");
dock.location = "bottom";
dock.height = 48;
dock.alignment = "center";
dock.lengthMode = "fit";
dock.floating = true;

var tasks = dock.addWidget("org.kde.plasma.icontasks");
tasks.currentConfigGroup = ["General"];
tasks.writeConfig("launchers", "applications:org.kde.dolphin.desktop,applications:org.kde.konsole.desktop");
