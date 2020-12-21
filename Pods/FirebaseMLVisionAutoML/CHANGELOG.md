# 2020-02-02 -- v0.20.0
- Updated the TensorFlow Lite dependency from `TensorFlowLite` 1.14.0 to
  `TensorFlowLiteObjC` 2.1.0.

# 2019-10-08 -- v0.19.0
- Adds `AutoMLRemoteModel` and `AutoMLLocalModel` as instantiable subclasses of
  `RemoteModel` and `LocalModel` classes, respectively.
- **Breaking change:** Updates the initializers for
  `VisionOnDeviceAutoMLImageLabelerOptions`. The
  `VisionOnDeviceAutoMLImageLabelerOptions` can be initialized with either an
  `AutoMLRemoteModel` or `AutoMLLocalModel`, but not both.
- **Breaking change:** Implicit model downloading is no longer available through
  the `VisionOnDeviceAutoMLImageLabeler`. You must invoke the `ModelManager`'s
  `download(_:conditions:)` API to download `AutoMLRemoteModel`s. Please see the
  Vision QuickStart app for an example of how to download `AutoMLRemoteModel`s.

# 2019-09-03 -- v0.18.0
- Updated the TensorFlow Lite dependency from `TensorFlowLite` 1.13.1 to
  `TensorFlowLiteObjC` 1.14.0.

# 2019-07-09 -- v0.17.0
- Bug fixes.

# 2019-05-07 -- v0.16.0
- Initial release of on-device AutoML Image Labeling API using image
  classification models trained by AutoML on custom images.
