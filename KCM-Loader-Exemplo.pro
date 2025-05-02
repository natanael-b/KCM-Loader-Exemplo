QT += core gui widgets

CONFIG += c++17

# Para Plasma 6
equals(QT_MAJOR_VERSION, 6) {
  # Evita erros de QVariant se os módulos de compatibilidade com KF5 estiverem instalados
  DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000
  INCLUDEPATH += /usr/include/KF6/KCoreAddons
  INCLUDEPATH += /usr/include/KF6/KCMUtils/
  INCLUDEPATH += /usr/include/KF6/KWidgetsAddons/
  LIBS += -lKF6CoreAddons -lKF6KCMUtils

  message("Compilando para o KDE Plasma 6...")
}

# Para Plasma 5
equals(QT_MAJOR_VERSION, 5) {
    # Evitar erros de forward declaration
    DEFINES += KCMUTILS_DISABLE_DEPRECATED_BEFORE_AND_AT=0x058800
    INCLUDEPATH += /usr/include/KF5/KCoreAddons
    INCLUDEPATH += /usr/include/KF5/KCMUtils/
    INCLUDEPATH += /usr/include/KF5/KWidgetsAddons/
    INCLUDEPATH += /usr/include/KF5/KService/
    LIBS += -lKF5CoreAddons -lKF5KCMUtils

    message("Compilando para o KDE Plasma 5...")
}

lessThan(QT_MAJOR_VERSION, 5): error("Aviso: Este projeto foi feito para Qt 5 ou posterior!")

SOURCES += \
    main.cpp \
    mainwindow.cpp

HEADERS += \
    mainwindow.h

FORMS += \
    mainwindow.ui

# Default rules for deployment.
target.path = /opt/$${TARGET}/bin
INSTALLS += target
