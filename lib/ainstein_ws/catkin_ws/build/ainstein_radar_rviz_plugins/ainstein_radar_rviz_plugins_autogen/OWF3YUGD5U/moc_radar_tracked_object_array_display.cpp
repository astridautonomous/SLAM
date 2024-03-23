/****************************************************************************
** Meta object code from reading C++ file 'radar_tracked_object_array_display.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.8)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../src/ainstein_radar_rviz_plugins/src/radar_tracked_object_array/radar_tracked_object_array_display.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'radar_tracked_object_array_display.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.12.8. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_ainstein_radar_rviz_plugins__RadarTrackedObjectArrayDisplay_t {
    QByteArrayData data[8];
    char stringdata0[167];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_ainstein_radar_rviz_plugins__RadarTrackedObjectArrayDisplay_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_ainstein_radar_rviz_plugins__RadarTrackedObjectArrayDisplay_t qt_meta_stringdata_ainstein_radar_rviz_plugins__RadarTrackedObjectArrayDisplay = {
    {
QT_MOC_LITERAL(0, 0, 59), // "ainstein_radar_rviz_plugins::..."
QT_MOC_LITERAL(1, 60, 18), // "updateDisplayAlert"
QT_MOC_LITERAL(2, 79, 0), // ""
QT_MOC_LITERAL(3, 80, 16), // "updateAlertScale"
QT_MOC_LITERAL(4, 97, 19), // "updateAlertRangeMax"
QT_MOC_LITERAL(5, 117, 19), // "updateColorAndAlpha"
QT_MOC_LITERAL(6, 137, 11), // "updateScale"
QT_MOC_LITERAL(7, 149, 17) // "updateObjectShape"

    },
    "ainstein_radar_rviz_plugins::RadarTrackedObjectArrayDisplay\0"
    "updateDisplayAlert\0\0updateAlertScale\0"
    "updateAlertRangeMax\0updateColorAndAlpha\0"
    "updateScale\0updateObjectShape"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_ainstein_radar_rviz_plugins__RadarTrackedObjectArrayDisplay[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   44,    2, 0x08 /* Private */,
       3,    0,   45,    2, 0x08 /* Private */,
       4,    0,   46,    2, 0x08 /* Private */,
       5,    0,   47,    2, 0x08 /* Private */,
       6,    0,   48,    2, 0x08 /* Private */,
       7,    0,   49,    2, 0x08 /* Private */,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void ainstein_radar_rviz_plugins::RadarTrackedObjectArrayDisplay::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<RadarTrackedObjectArrayDisplay *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->updateDisplayAlert(); break;
        case 1: _t->updateAlertScale(); break;
        case 2: _t->updateAlertRangeMax(); break;
        case 3: _t->updateColorAndAlpha(); break;
        case 4: _t->updateScale(); break;
        case 5: _t->updateObjectShape(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject ainstein_radar_rviz_plugins::RadarTrackedObjectArrayDisplay::staticMetaObject = { {
    &rviz::MessageFilterDisplay<ainstein_radar_msgs::RadarTrackedObjectArray>::staticMetaObject,
    qt_meta_stringdata_ainstein_radar_rviz_plugins__RadarTrackedObjectArrayDisplay.data,
    qt_meta_data_ainstein_radar_rviz_plugins__RadarTrackedObjectArrayDisplay,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *ainstein_radar_rviz_plugins::RadarTrackedObjectArrayDisplay::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ainstein_radar_rviz_plugins::RadarTrackedObjectArrayDisplay::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_ainstein_radar_rviz_plugins__RadarTrackedObjectArrayDisplay.stringdata0))
        return static_cast<void*>(this);
    return rviz::MessageFilterDisplay<ainstein_radar_msgs::RadarTrackedObjectArray>::qt_metacast(_clname);
}

int ainstein_radar_rviz_plugins::RadarTrackedObjectArrayDisplay::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = rviz::MessageFilterDisplay<ainstein_radar_msgs::RadarTrackedObjectArray>::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 6;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
