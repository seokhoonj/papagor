# papagor

<!-- badges: start -->

<!-- badges: end -->

## Introduction

PAPAGO Text Translator for R users

1.  via Naver Developers (platform = FALSE, default option)

-   Papago Text Translation API (Free)
-   Please register your app on the webpage below and get your client id and secret.\
    <https://developers.naver.com/products/papago/nmt/nmt.md>
-   Papago can handle up to 5,000 characters at a time
-   The daily translation limit is 10,000 characters.

2.  via Naver Cloud Platform (platform = TRUE)

-   Papago Text Translation API for large-scale characters (Monthly payment)
-   You can register your app on the webpage below and get your client id and secret.
-   <https://www.ncloud.com/product/aiService/papagoTranslation>
-   Fees are charged based on the number of characters.
-   The number of characters is rounded up to the nearest 1,000,000 characters.

| 언어         | 언어 코드 |
|:-------------|:----------|
| 한국어       | ko        |
| 영어         | en        |
| 일본어       | ja        |
| 중국어 간체  | zh-CN     |
| 중국어번체   | zh-TW     |
| 베트남어     | vi        |
| 태국어       | th        |
| 인도네시아어 | id        |
| 프랑스어     | fr        |
| 스페인어     | es        |
| 러시아어     | ru        |
| 독일어       | de        |
| 이탈리아어   | it        |

## Installation

``` r
# install dev version
devtools::install_github("seokhoonj/papagor")
```

## Examples

``` r
library(papagor)

translate(c("Papago translator for R users", "Hi"), source = "en", target = "ko")
```
