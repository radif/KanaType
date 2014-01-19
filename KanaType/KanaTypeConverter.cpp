//
//  KanaTypeConverter.cpp
//  KanaType
//
//  Created by Radif Sharafullin on 1/12/14.
//  Copyright (c) 2014 Radif Sharafullin. All rights reserved.
//

#include "KanaTypeConverter.h"
#include <map>
namespace KanaType{namespace Converter{
    static const std::map<char, std::string> kABCToKanaMap{
        {'~',"〜"},
        {'`',"｀"},
        {'!',"！"},
        {'@',"＠"},
        {'#',"＃"},
        {'$',"＄"},
        {'%',"％"},
        {'^',"＾"},
        {'&',"＆"},
        {'*',"＊"},
        {'(',"（"},
        {')',"）"},
        {'_',"＿"},
        {'-',"ー"},
        {'=',"＝"},
        {'+',"＋"},
        
        
        {'1',"１"},
        {'2',"２"},
        {'3',"３"},
        {'4',"４"},
        {'5',"５"},
        {'6',"６"},
        {'7',"７"},
        {'8',"８"},
        {'9',"９"},
        {'0',"０"},
        
        {'a',"ム"},
        {'b',"乃"},
        {'c',"匚"},
        {'d',"ワ"},
        {'e',"モ"},
        {'f',"千"},
        {'g',"匸"},
        {'h',"カ"},
        {'i',"エ"},
        {'j',"丁"},
        {'k',"ケ"},
        {'l',"乚"},
        {'m',"巾"},
        {'n',"门"},
        {'o',"ロ"},
        {'p',"ア"},
        {'q',"甲"},
        {'r',"㓀"},
        {'s',"弓"},
        {'t',"ナ"},
        {'u',"凵"},
        {'v',"レ"},
        {'w',"山"},
        {'x',"メ"},
        {'y',"ン"},
        {'z',"乙"},
    };
    std::string convertABCToKana(const std::string & abcString){
        std::string retVal;
        for (const char & c : abcString) {
            char lower(::tolower(c));
            auto it(kABCToKanaMap.find(lower));
            if (it!=kABCToKanaMap.end())
                retVal+=(*it).second;
            else
                retVal+=c;
        }
        return retVal;
    }
}}