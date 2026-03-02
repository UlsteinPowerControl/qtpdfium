TARGET = QtPdfium

DEFINES += __QT__ \
    OPJ_STATIC \
    PNG_PREFIX \
    PNG_USE_READ_MACROS

# This is to prevent an undefined reference of qt_version_tag
# when on Linux, x86 architecture and the GNU tools.
DEFINES += QT_NO_VERSION_TAGGING

QT = core-private core gui
QT = core gui
DEFINES += QT_BUILD_PDFIUM_LIB
CONFIG += warn_on strict_flags c++17 shared
TEMPLATE = lib
VERSION = 5.5.0

#QMAKE_DOCS = $$PWD/doc/qtpdfium.qdocconf
include($$PWD/../3rdparty/pdfium.pri)


PUBLIC_HEADERS += \
    $$PWD/qpdfium.h \
    $$PWD/qpdfiumpage.h \
    $$PWD/qpdfiumglobal.h \
    $$PWD/QPdfium \
    $$PWD/QPdfiumPage
SOURCES += \
    $$PWD/qpdfiumglobal.cpp \
    $$PWD/qpdfium.cpp \
    $$PWD/qpdfiumpage.cpp

HEADERS += $$PUBLIC_HEADERS $$PRIVATE_HEADERS

target.path = $$[QT_INSTALL_LIBS]
headers.path = $$[QT_INSTALL_HEADERS]/QtPdfium
headers.files = $$PUBLIC_HEADERS
module_pri.path = $$[QT_INSTALL_ARCHDATA]/mkspecs/modules
module_pri.files = $$PWD/../../mkspecs/modules/qt_lib_pdfium.pri
INSTALLS += target headers module_pri
