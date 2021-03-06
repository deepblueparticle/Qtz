QT       -= gui
QT       += sql network
CONFIG   += c++11

DEFINES += QTZ_CORE_LIBRARY

TEMPLATE = lib

VERSION = 0.4.0

CONFIG(release, debug|release){
    DESTDIR = ./release
    OBJECTS_DIR = release/.obj
    MOC_DIR = release/.moc
    RCC_DIR = release/.rcc
    UI_DIR = release/.ui
    BUILD = "release"
    BUILD_SUFFIX = ""
    TARGET = QtzCore
}

CONFIG(debug, debug|release){
    DESTDIR = ./debug
    OBJECTS_DIR = debug/.obj
    MOC_DIR = debug/.moc
    RCC_DIR = debug/.rcc
    UI_DIR = debug/.ui
    BUILD = "debug"
    BUILD_SUFFIX = "d"
    TARGET = QtzCored
}

default_key {
    DEFINES+=PRIVATE_KEY=\\\"f9bf8a579d1fa38c4e20ee884e4096c054b57771153799f49fb674d1006caf52\\\"
}

DEPENDPATH += .
INCLUDEPATH += .

unix {
    target.path = /usr/lib
    headers.path = /usr/include/qtz/core
    LIBS += -lssl -lcrypto
    LINK_MAJ = ""
    CONFIG += create_pc create_prl no_install_prl
    QMAKE_PKGCONFIG_NAME = libqtz-core
    QMAKE_PKGCONFIG_DESCRIPTION = Qtz Core Library
    QMAKE_PKGCONFIG_PREFIX = $$INSTALLBASE
    QMAKE_PKGCONFIG_LIBDIR = $$target.path
    QMAKE_PKGCONFIG_INCDIR = $$headers.path
    QMAKE_PKGCONFIG_VERSION = $$VERSION
    QMAKE_PKGCONFIG_DESTDIR = pkgconfig
}

win32 {
    target.path = $$INSTALL_ROOT/lib
    headers.path = $$INSTALL_ROOT/include/qtz/core
    LINK_MAJ = "0"
    RC_FILE = QtzCore.rc
    msvc:LIBS += Advapi32.lib
    gcc:LIBS += -lAdvapi32
}

CONFIG(local){
    INCLUDEPATH += ../../
}

HEADERS += \
    settings.hpp \
    number-formatter.hpp \
    jalali-date.hpp \
    qtz-core.hpp \
    qtz-single-core-application.hpp \
    qtz-single-core-application_p.hpp \
    qio.hpp

SOURCES += \
    settings.cpp \
    number-formatter.cpp \
    jalali-date.cpp \
    qtz-single-core-application.cpp \
    qio.cpp

headers.files = $$HEADERS

INSTALLS += target
INSTALLS += headers
