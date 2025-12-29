LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := RemovePackages
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_OVERRIDES_PACKAGES := \
    Chrome \
    Chrome-Stub \
    Maps \
    YouTube \
    YouTubeMusicPrebuilt \
    Photos \
    Videos \
    Duo \
    Keep \
    GoogleAssistant \
    GoogleFeedback \
    GoogleOneTimeInitializer \
    MarkupGoogle \
    Music2 \
    SafetyHubPrebuilt \
    ScribePrebuilt \
    Books \
    Magazines \
    Aperture \
    Camera2
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_SRC_FILES := /dev/null
include $(BUILD_PREBUILT)
