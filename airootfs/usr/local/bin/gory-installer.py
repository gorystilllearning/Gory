#!/usr/bin/env python3
import sys
import subprocess
from PyQt6.QtWidgets import QApplication, QWidget, QVBoxLayout, QLabel, QPushButton
from PyQt6.QtGui import QPixmap, QFont
from PyQt6.QtCore import Qt

class InstallerWindow(QWidget):
    def __init__(self):
        super().__init__()
        self.initUI()

    def initUI(self):
        self.setWindowTitle('Gory OS Installer')
        self.setFixedSize(500, 650)
        self.setStyleSheet("background-color: #2b2b2b; color: white;")

        layout = QVBoxLayout()
        layout.setSpacing(20)

        title = QLabel('Welcome to Gory OS')
        title.setFont(QFont('Arial', 24, QFont.Weight.Bold))
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(title)

        subtitle = QLabel('The Ultimate Gaming Experience')
        subtitle.setFont(QFont('Arial', 12))
        subtitle.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(subtitle)

        # Saweria QR Code
        qr_label = QLabel(self)
        pixmap = QPixmap('/usr/share/pixmaps/gory-installer-logo.png')
        scaled_pixmap = pixmap.scaled(300, 300, Qt.AspectRatioMode.KeepAspectRatio, Qt.TransformationMode.SmoothTransformation)
        qr_label.setPixmap(scaled_pixmap)
        qr_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(qr_label)

        support_text = QLabel('Support the Developer via Saweria!')
        support_text.setFont(QFont('Arial', 10, QFont.Weight.Bold))
        support_text.setStyleSheet("color: #d35400;")
        support_text.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(support_text)

        install_btn = QPushButton('Install Gory OS to Hard Drive')
        install_btn.setFont(QFont('Arial', 14, QFont.Weight.Bold))
        install_btn.setStyleSheet("""
            QPushButton {
                background-color: #d35400;
                border: none;
                padding: 15px;
                border-radius: 5px;
            }
            QPushButton:hover {
                background-color: #e67e22;
            }
        """)
        install_btn.clicked.connect(self.start_install)
        layout.addWidget(install_btn)
        
        cancel_btn = QPushButton('Try Live CD')
        cancel_btn.setFont(QFont('Arial', 12))
        cancel_btn.setStyleSheet("""
            QPushButton {
                background-color: #555555;
                border: none;
                padding: 10px;
                border-radius: 5px;
            }
            QPushButton:hover {
                background-color: #666666;
            }
        """)
        cancel_btn.clicked.connect(self.close)
        layout.addWidget(cancel_btn)

        self.setLayout(layout)

    def start_install(self):
        # Close the GUI window and open Konsole running archinstall
        subprocess.Popen(['konsole', '-e', 'sudo', 'archinstall'])
        self.close()

if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = InstallerWindow()
    ex.show()
    sys.exit(app.exec())
