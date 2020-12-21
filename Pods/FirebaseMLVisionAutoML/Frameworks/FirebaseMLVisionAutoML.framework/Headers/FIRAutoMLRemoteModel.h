#import <Foundation/Foundation.h>


#import <FirebaseMLCommon/FirebaseMLCommon.h>


NS_ASSUME_NONNULL_BEGIN

/** An AutoML model that is stored remotely on the server and downloaded to the device. */
NS_SWIFT_NAME(AutoMLRemoteModel)
DEPRECATED_MSG_ATTRIBUTE(
    "This API is deprecated and replaced by the new standalone ML Kit SDK. See the migration guide "
    "at https://developers.google.com/ml-kit/migration")
@interface FIRAutoMLRemoteModel : FIRRemoteModel

/**
 * Creates a new instance with the given values.
 *
 * @param name The name of the remote model. Specify the name assigned to the model when it was
 *     published to the Firebase Console.
 * @return A new `AutoMLRemoteModel` instance.
 */
- (instancetype)initWithName:(NSString *)name NS_DESIGNATED_INITIALIZER;

/** Unavailable. */
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
