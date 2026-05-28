var panels = panels();
if (panels.length > 0) {
    panels[0].location = "top";
    panels[0].height = 24;
}

var dock = new Panel("org.kde.panel");
dock.location = "bottom";
dock.height = 48;
dock.alignment = "center";
dock.lengthMode = "fit";
dock.floating = true;
dock.addWidget("org.kde.plasma.icontasks");
