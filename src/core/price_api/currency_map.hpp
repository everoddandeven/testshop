#pragma once
#ifndef CURRENCY_MAP_HPP_NEROSHOP
#define CURRENCY_MAP_HPP_NEROSHOP

#include "currency_enum.hpp" // neroshop::Currency::

namespace neroshop {

inline const std::map<std::string, std::tuple<neroshop::Currency, std::string, int, std::string>> CurrencyMap {// { currency_code, { id, name, decimals, sign } }
    // Fiat
    //{ "AED", { neroshop::Currency::, "United Arab Emirates Dirham" } },
    //{ "AFN", { neroshop::Currency::, "Afghanistan Afghani" } },
    //{ "ALL", { neroshop::Currency::, "Albania Lek" } },
    //{ "AMD", { neroshop::Currency::, "Armenia Dram" } },
    //{ "ANG", { neroshop::Currency::, "Netherlands Antilles Guilder" } },
    //{ "AOA", { neroshop::Currency::, "Angola Kwanza" } },
    //{ "ARS", { neroshop::Currency::, "Argentina Peso" } },
    { "AUD", { neroshop::Currency::AUD, "Australia Dollar", 2, "$" } },
    //{ "AWG", { neroshop::Currency::, "Aruba Guilder" } },
    //{ "AZN", { neroshop::Currency::, "Azerbaijan Manat" } },
    //{ "BAM", { neroshop::Currency::, "Bosnia and Herzegovina Convertible Mark" } },
    //{ "BBD", { neroshop::Currency::, "Barbados Dollar" } },
    //{ "BDT", { neroshop::Currency::, "Bangladesh Taka" } },
    //{ "BGN", { neroshop::Currency::, "Bulgaria Lev" } },
    //{ "BHD", { neroshop::Currency::, "Bahrain Dinar" } },
    //{ "BIF", { neroshop::Currency::, "Burundi Franc" } },
    //{ "BMD", { neroshop::Currency::, "Bermuda Dollar" } },
    //{ "BND", { neroshop::Currency::, "Brunei Darussalam Dollar" } },
    //{ "BOB", { neroshop::Currency::, "Bolivia Bolíviano" } },
    { "BRL", { neroshop::Currency::BRL, "Brazil Real", 2, "R$" } },
    //{ "BSD", { neroshop::Currency::, "Bahamas Dollar" } },
    //{ "BTN", { neroshop::Currency::, "Bhutan Ngultrum" } },
    //{ "BWP", { neroshop::Currency::, "Botswana Pula" } },
    //{ "BYN", { neroshop::Currency::, "Belarus Ruble" } },
    //{ "BZD", { neroshop::Currency::, "Belize Dollar" } },
    { "CAD", { neroshop::Currency::CAD, "Canada Dollar", 2, "$" } },
    //{ "CDF", { neroshop::Currency::, "Congo/Kinshasa Franc" } },
    { "CHF", { neroshop::Currency::CHF, "Switzerland Franc", 2, "Fr" } }, // francs, Fr
    //{ "CLP", { neroshop::Currency::, "Chile Peso" } },
    { "CNY", { neroshop::Currency::CNY, "China Yuan Renminbi", 2, "¥" } },
    //{ "COP", { neroshop::Currency::, "Colombia Peso" } },
    //{ "CRC", { neroshop::Currency::, "Costa Rica Colon" } },
    //{ "CUC", { neroshop::Currency::, "Cuba Convertible Peso" } },
    //{ "CUP", { neroshop::Currency::, "Cuba Peso" } },
    //{ "CVE", { neroshop::Currency::, "Cape Verde Escudo" } },
    //{ "CZK", { neroshop::Currency::, "Czech Republic Koruna" } },
    //{ "DJF", { neroshop::Currency::, "Djibouti Franc" } },
    //{ "DKK", { neroshop::Currency::, "Denmark Krone" } },
    //{ "DOP", { neroshop::Currency::, "Dominican Republic Peso" } },
    //{ "DZD", { neroshop::Currency::, "Algeria Dinar" } },
    //{ "EGP", { neroshop::Currency::, "Egypt Pound" } },
    //{ "ERN", { neroshop::Currency::, "Eritrea Nakfa" } },
    //{ "ETB", { neroshop::Currency::, "Ethiopia Birr" } },
    { "EUR", { neroshop::Currency::EUR, "Euro Member Countries", 2, "€" } },
    //{ "FJD", { neroshop::Currency::, "Fiji Dollar" } },
    //{ "FKP", { neroshop::Currency::, "Falkland Islands (Malvinas) Pound" } },
    { "GBP", { neroshop::Currency::GBP, "United Kingdom Pound", 2, "£" } },
    //{ "GEL", { neroshop::Currency::, "Georgia Lari" } },
    //{ "GGP", { neroshop::Currency::, "Guernsey Pound" } },
    { "GHS", { neroshop::Currency::GHS, "Ghana Cedi", 2, "₵" } },
    //{ "GIP", { neroshop::Currency::, "Gibraltar Pound" } },
    //{ "GMD", { neroshop::Currency::, "Gambia Dalasi" } },
    //{ "GNF", { neroshop::Currency::, "Guinea Franc" } },
    //{ "GTQ", { neroshop::Currency::, "Guatemala Quetzal" } },
    //{ "GYD", { neroshop::Currency::, "Guyana Dollar" } },
    { "HKD", { neroshop::Currency::HKD, "Hong Kong Dollar", 2, "$" } },
    //{ "HNL", { neroshop::Currency::, "Honduras Lempira" } },
    //{ "HRK", { neroshop::Currency::, "Croatia Kuna" } },
    //{ "HTG", { neroshop::Currency::, "Haiti Gourde" } },
    //{ "HUF", { neroshop::Currency::, "Hungary Forint" } },
    //{ "IDR", { neroshop::Currency::, "Indonesia Rupiah" } },
    //{ "ILS", { neroshop::Currency::, "Israel Shekel" } },
    //{ "IMP", { neroshop::Currency::, "Isle of Man Pound" } },
    { "INR", { neroshop::Currency::INR, "India Rupee", 2, "₹" } },
    //{ "IQD", { neroshop::Currency::, "Iraq Dinar" } },
    //{ "IRR", { neroshop::Currency::, "Iran Rial" } },
    //{ "ISK", { neroshop::Currency::, "Iceland Krona" } },
    //{ "JEP", { neroshop::Currency::, "Jersey Pound" } },
    //{ "JMD", { neroshop::Currency::, "Jamaica Dollar" } },
    //{ "JOD", { neroshop::Currency::, "Jordan Dinar" } },
    { "JPY", { neroshop::Currency::JPY, "Japan Yen", 2, "¥" } },
    //{ "KES", { neroshop::Currency::, "Kenya Shilling" } },
    //{ "KGS", { neroshop::Currency::, "Kyrgyzstan Som" } },
    //{ "KHR", { neroshop::Currency::, "Cambodia Riel" } },
    //{ "KMF", { neroshop::Currency::, "Comorian Franc" } },
    //{ "KPW", { neroshop::Currency::, "Korea (North) Won" } },
    { "KRW", { neroshop::Currency::KRW, "Korea (South) Won", 2, "₩‎" } },
    //{ "KWD", { neroshop::Currency::, "Kuwait Dinar" } },
    //{ "KYD", { neroshop::Currency::, "Cayman Islands Dollar" } },
    //{ "KZT", { neroshop::Currency::, "Kazakhstan Tenge" } },
    //{ "LAK", { neroshop::Currency::, "Laos Kip" } },
    //{ "LBP", { neroshop::Currency::, "Lebanon Pound" } },
    //{ "LKR", { neroshop::Currency::, "Sri Lanka Rupee" } },
    //{ "LRD", { neroshop::Currency::, "Liberia Dollar" } },
    //{ "LSL", { neroshop::Currency::, "Lesotho Loti" } },
    //{ "LYD", { neroshop::Currency::, "Libya Dinar" } },
    //{ "MAD", { neroshop::Currency::, "Morocco Dirham" } },
    //{ "MDL", { neroshop::Currency::, "Moldova Leu" } },
    //{ "MGA", { neroshop::Currency::, "Madagascar Ariary" } },
    //{ "MKD", { neroshop::Currency::, "Macedonia Denar" } },
    //{ "MMK", { neroshop::Currency::, "Myanmar (Burma) Kyat" } },
    //{ "MNT", { neroshop::Currency::, "Mongolia Tughrik" } },
    //{ "MOP", { neroshop::Currency::, "Macau Pataca" } },
    //{ "MRU", { neroshop::Currency::, "Mauritania Ouguiya" } },
    //{ "MUR", { neroshop::Currency::, "Mauritius Rupee" } },
    //{ "MVR", { neroshop::Currency::, "Maldives (Maldive Islands) Rufiyaa" } },
    //{ "MWK", { neroshop::Currency::, "Malawi Kwacha" } },
    { "MXN", { neroshop::Currency::MXN, "Mexico Peso", 2, "$" } },
    //{ "MYR", { neroshop::Currency::, "Malaysia Ringgit" } },
    //{ "MZN", { neroshop::Currency::, "Mozambique Metical" } },
    //{ "NAD", { neroshop::Currency::, "Namibia Dollar" } },
    { "NGN", { neroshop::Currency::NGN, "Nigeria Naira", 2, "₦" } },
    //{ "NIO", { neroshop::Currency::, "Nicaragua Cordoba" } },
    //{ "NOK", { neroshop::Currency::, "Norway Krone" } },
    //{ "NPR", { neroshop::Currency::, "Nepal Rupee" } },
    { "NZD", { neroshop::Currency::NZD, "New Zealand Dollar", 2, "$" } },
    //{ "OMR", { neroshop::Currency::, "Oman Rial" } },
    //{ "PAB", { neroshop::Currency::, "Panama Balboa" } },
    //{ "PEN", { neroshop::Currency::, "Peru Sol" } },
    //{ "PGK", { neroshop::Currency::, "Papua New Guinea Kina" } },
    { "PHP", { neroshop::Currency::PHP, "Philippines Peso", 2, "₱" } },
    //{ "PKR", { neroshop::Currency::, "Pakistan Rupee" } },
    //{ "PLN", { neroshop::Currency::, "Poland Zloty" } },
    //{ "PYG", { neroshop::Currency::, "Paraguay Guarani" } },
    //{ "QAR", { neroshop::Currency::, "Qatar Riyal" } },
    //{ "RON", { neroshop::Currency::, "Romania Leu" } },
    //{ "RSD", { neroshop::Currency::, "Serbia Dinar" } },
    { "RUB", { neroshop::Currency::RUB, "Russia Ruble", 2, "₽‎" } },
    //{ "RWF", { neroshop::Currency::, "Rwanda Franc" } },
    //{ "SAR", { neroshop::Currency::, "Saudi Arabia Riyal" } },
    //{ "SBD", { neroshop::Currency::, "Solomon Islands Dollar" } },
    //{ "SCR", { neroshop::Currency::, "Seychelles Rupee" } },
    //{ "SDG", { neroshop::Currency::, "Sudan Pound" } },
    { "SEK", { neroshop::Currency::SEK, "Sweden Krona", 2, "kr" } },
    { "SGD", { neroshop::Currency::SGD, "Singapore Dollar", 2, "S$" } },
    //{ "SHP", { neroshop::Currency::, "Saint Helena Pound" } },
    //{ "SLL", { neroshop::Currency::, "Sierra Leone Leone" } },
    //{ "SOS", { neroshop::Currency::, "Somalia Shilling" } },
    //{ "SPL*", { neroshop::Currency::, "Seborga Luigino" } },
    //{ "SRD", { neroshop::Currency::, "Suriname Dollar" } },
    //{ "STN", { neroshop::Currency::, "São Tomé and Príncipe Dobra" } },
    //{ "SVC", { neroshop::Currency::, "El Salvador Colon" } },
    //{ "SYP", { neroshop::Currency::, "Syria Pound" } },
    //{ "SZL", { neroshop::Currency::, "eSwatini Lilangeni" } },
    //{ "THB", { neroshop::Currency::, "Thailand Baht" } },
    //{ "TJS", { neroshop::Currency::, "Tajikistan Somoni" } },
    //{ "TMT", { neroshop::Currency::, "Turkmenistan Manat" } },
    //{ "TND", { neroshop::Currency::, "Tunisia Dinar" } },
    //{ "TOP", { neroshop::Currency::, "Tonga Pa'anga" } },
    //{ "TRY", { neroshop::Currency::, "Turkey Lira" } },
    //{ "TTD", { neroshop::Currency::, "Trinidad and Tobago Dollar" } },
    //{ "TVD", { neroshop::Currency::, "Tuvalu Dollar" } },
    //{ "TWD", { neroshop::Currency::, "Taiwan New Dollar" } },
    //{ "TZS", { neroshop::Currency::, "Tanzania Shilling" } },
    //{ "UAH", { neroshop::Currency::, "Ukraine Hryvnia" } },
    //{ "UGX", { neroshop::Currency::, "Uganda Shilling" } },
    { "USD", { neroshop::Currency::USD, "United States Dollar", 2, "$" } },
    //{ "UYU", { neroshop::Currency::, "Uruguay Peso" } },
    //{ "UZS", { neroshop::Currency::, "Uzbekistan Som" } },
    //{ "VEF", { neroshop::Currency::, "Venezuela Bolívar" } },
    //{ "VND", { neroshop::Currency::, "Viet Nam Dong" } },
    //{ "VUV", { neroshop::Currency::, "Vanuatu Vatu" } },
    //{ "WST", { neroshop::Currency::, "Samoa Tala" } },
    //{ "XAF", { neroshop::Currency::, "Communauté Financière Africaine (BEAC) CFA Franc BEAC" } },
    { "XAG", { neroshop::Currency::XAG, "Silver", 2, "" } },
    { "XAU", { neroshop::Currency::XAU, "Gold", 2, ""} },
    //{ "XCD", { neroshop::Currency::, "East Caribbean Dollar" } },
    //{ "XDR", { neroshop::Currency::, "International Monetary Fund (IMF) Special Drawing Rights" } },
    //{ "XOF", { neroshop::Currency::, "Communauté Financière Africaine (BCEAO) Franc" } },
    //{ "XPF", { neroshop::Currency::, "Comptoirs Français du Pacifique (CFP) Franc" } },
    //{ "YER", { neroshop::Currency::, "Yemen Rial" } },
    { "ZAR", { neroshop::Currency::ZAR, "South Africa Rand", 2, "R" } },
    //{ "ZMW", { neroshop::Currency::, "Zambia Kwacha" } },
    //{ "ZWD", { neroshop::Currency::, "Zimbabwe Dollar" } },
    // Crypto
    { "XMR", { neroshop::Currency::XMR, "Monero", 12, "" } },
    { "BTC", { neroshop::Currency::BTC, "Bitcoin", 8, "₿" } },
    { "ETH", { neroshop::Currency::ETH, "Ether", 18, "" } },    
    { "LTC", { neroshop::Currency::LTC, "Litecoin", 8, "" } },
    { "WOW", { neroshop::Currency::WOW, "Wownero", 11, "" } },
};

}
#endif
