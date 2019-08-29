#import "header.h"

const CFArrayCallBacks *pCFTypeArrayCallBacks = &kCFTypeArrayCallBacks;

const CFDictionaryKeyCallBacks *pCFTypeDictionaryKeyCallBacks = &kCFTypeDictionaryKeyCallBacks;
const CFDictionaryValueCallBacks *pCFTypeDictionaryValueCallBacks = &kCFTypeDictionaryValueCallBacks;

const void * CFTypeBridgeToRawPointer(CFTypeRef v) {
    return v;
}

const CFTypeRef CFTypeBridgeFromRawPointer(const void *v) {
    return v;
}

id withAlloca(NSInteger size, const id context, id (*body)(void * ptr, const id context)) {
    UInt8 buffer[size];
    return body(buffer, context);
}
