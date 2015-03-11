# object 的 class 有 numeric, complex, logical, character, raw
# numeric 實際上是兩種獨立模式的混合說法，即 integer 和 double
# complex 為複數，即包含虛數的數值
# logical 為邏輯值 (TRUE、FALSE...)
# character 為字串，被引號框住的值
# raw 為原始數據

# 每個 object 都有兩個內建屬性: mode(類型), length(長度)

# 如果要幫 object 自訂屬性(很少使用)
z = c(1:100)
attr(z, "dim") = c(10, 10)
attr(z, "dim")

# class 可以查出變數的類型
class(123)
class("hello")
class(TRUE)

# 數字的類型有 numeric(包含 double 浮點數和 integer 整數) 
# 和 complex(複數)
class(2 / 3)
class(10) # 一個數字也算 numeric
class(1:10) # 所有值都為整數才算 integer
class(3 + 2i) # i 為虛數

# 轉換 class (以 character 為例)
n = 123
as(n, 'character') # 較靈活
as.character(n) # 建議用這個效率較好

# 轉成2位 HEX，超過則為0，分數虛數會被丟棄
as.raw(1:256)

# charToChar() 字串轉 raw 不可用 as.raw
charToRaw("Ivy!")

# data.frame 不適用此種方式，會出錯！
y = c(123, 456, 789)
as(c, 'data.frame')
as.data.frame(c)

# 判斷變數是否為某 class
n = 123.123
is(n, 'numeric') # 較靈活
is.numeric(n) # 建議用這個效率較好

# 每種不同的 class 都有不同的 summary 方式
# 例如：runif 會產生均勻分布於 0 ~ 1 的隨機變數
num = runif(30)
summary(num)

# 例如：sample 會產生隨機樣本，以下列為例，由 TRUE、FALSE、NA
# 產生 30 筆隨機樣本
bool = sample(c(TRUE, FALSE, NA), 30, replace = TRUE)
summary(bool)

# data.frame 要用此種方式產生
dfr = data.frame(num, bool)
head(dfr) # 前六筆
summary(dfr)

# str 能顯示結構，尤其對 data.frame 很有用
str(num)
str(dfr)

# unclass 能顯示該變數是如何建構
unclass(bool)

# attributes 能顯示變量的所有屬性
attributes(dfr)

# View 可將資料變成電子表格
View(head(dfr, 10))

# edit/fix 除變表格外還能手動修改(不建議，會無法追朔)
edit(dfr)
fix(dfr)

# ls + str = 查看所有 variable 的結構
ls.str()

# 類似 ls.str ，但為 html 版
browseEnv()
