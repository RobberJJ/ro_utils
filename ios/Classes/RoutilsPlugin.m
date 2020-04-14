#import "RoutilsPlugin.h"
#if __has_include(<routils/routils-Swift.h>)
#import <routils/routils-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "routils-Swift.h"
#endif

@implementation RoutilsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftRoutilsPlugin registerWithRegistrar:registrar];
}
@end
