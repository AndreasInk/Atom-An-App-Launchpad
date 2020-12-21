#import <Foundation/Foundation.h>


#import <FirebaseMLCommon/FirebaseMLCommon.h>


NS_ASSUME_NONNULL_BEGIN

/** An AutoML Vision Edge model stored locally on the device. */
NS_SWIFT_NAME(AutoMLLocalModel)
DEPRECATED_MSG_ATTRIBUTE(
    "This API is deprecated and replaced by the new standalone ML Kit SDK. See the migration guide "
    "at https://developers.google.com/ml-kit/migration")
@interface FIRAutoMLLocalModel : FIRLocalModel

/**
 * Creates a new instance with the given manifest file path.
 *
 * @param manifestPath An absolute path to the manifest file of an AutoML Vision Edge model.
 * @return A new `AutoMLLocalModel` instance.
 */
- (instancetype)initWithManifestPath:(NSString *)manifestPath NS_DESIGNATED_INITIALIZER;

/** Unavailable. */
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
