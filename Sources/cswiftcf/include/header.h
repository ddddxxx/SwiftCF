#import <Foundation/Foundation.h>

CF_EXPORT const CFArrayCallBacks * _Nonnull pCFTypeArrayCallBacks;

CF_EXPORT const CFDictionaryKeyCallBacks * _Nonnull pCFTypeDictionaryKeyCallBacks;
CF_EXPORT const CFDictionaryValueCallBacks * _Nonnull pCFTypeDictionaryValueCallBacks;

CF_EXPORT
NS_SWIFT_NAME(bridge(_:))
const void * _Nonnull CFTypeBridgeToRawPointer(CFTypeRef _Nonnull v);

CF_EXPORT
CF_RETURNS_NOT_RETAINED
NS_SWIFT_NAME(bridge(_:))
const CFTypeRef _Nonnull CFTypeBridgeFromRawPointer(const void * _Nonnull v);

CF_EXPORT
id _Nonnull withAlloca(NSInteger size, const id _Nullable context, id _Nonnull (* _Nonnull body)(void * _Nonnull ptr, const id _Nullable context));

//extern void ** __CFRuntimeClassTable;
//extern void ** __CFRuntimeObjCClassTable;
