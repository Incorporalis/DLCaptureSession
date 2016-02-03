//
// AVCaptureSession+Authorization.m
// Copyright (c) 2015 Dmitry Lizin (sdkdimon@gmail.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "AVCaptureDevice+Authorization.h"

@implementation AVCaptureDevice (Authorization)
+(void)authorizeCameraCompletionHandler:(void(^)(BOOL granted))completionHandler{
    AVAuthorizationStatus authorizationStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    
    switch (authorizationStatus) {
        case AVAuthorizationStatusNotDetermined:{
            NSLog(@"Camera AVAuthorizationStatusNotDetermined");
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:completionHandler];
        }
            return;
        case AVAuthorizationStatusRestricted:
            NSLog(@"Camera AVAuthorizationStatusRestricted");
        case AVAuthorizationStatusDenied:{
            NSLog(@"Camera AVAuthorizationStatusDenied");
            completionHandler(NO);
            return;
        }
        case AVAuthorizationStatusAuthorized:
            NSLog(@"Camera AVAuthorizationStatusAuthorized");
            completionHandler(YES);
            return;
            
    }
}

@end
