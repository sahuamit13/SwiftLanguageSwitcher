//
//  LanguageManager.h
//  ios_language_manager
//
//  Created by Maxim Bilan on 12/23/14.
//  Copyright (c) 2014 Maxim Bilan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Defines.h"

typedef NS_ENUM(NSInteger, ELanguage)
{
    ELanguageEnglish,
    ELanguageGerman,
    ELanguageFrench,
	ELanguageArabic,
    ELanguageChinese,
	
    ELanguageCount
};

@interface LanguageManager : NSObject

+ (void)setupCurrentLanguage;
+ (NSArray *)languageStrings;
+ (NSString *)currentLanguageString;
+ (NSString *)currentLanguageCode;
+ (NSInteger)currentLanguageIndex;
+ (void)saveLanguageByIndex:(NSInteger)index;
+ (BOOL)isCurrentLanguageRTL;

@end
