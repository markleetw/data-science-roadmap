# 賦值
x = 123
y <- 456 # 和等號(=)使用方式相同，也等同於 456 -> y
z <<- 789 # 全域變數
assign("v", 566) # 和(=)及(->)用法相同
assign("w", 5566, globalenv()) # 全域變數，和 (<<-或->>) 相同

# 賦值並印出，印出的方式有 print()、變數名稱或加上小括弧
# 例如：rnorm(x) 表示x個常態分佈隨機數
r = rnorm(100); r
(r = rnorm(100))

# 序列的產生方式很簡單，使用函式 c，
# 例如宣告一個向量值為(1, 3, 5)，只需要輸入
c(1, 3, 5)

# 如果向量的數值為連續，也就是說數與數中間的間隔值是固定的，
# 則可以使用 seq 函式，又或者，數與數中間的間隔值固定為 1，
# 還可以使用更簡單的冒號(:)
1:10 # 等同於 seq(1, 10) = 1, 2, 3 ... 10
seq(1, 10, 0.5) # 區間為 0.5，等於 1, 1.5, 2 ... 9.5, 10

# 在此補充一點，在 R 中向量的重要性完全不遜於變數，所以大部
# 份的函式都能夠同時支援變數及向量！

# 向量運算是一對一計算的，短的向量會被重複使用
1:6 + 1:3 # 意即 (1 + 1), (2 + 2), (3 + 3), (4 + 1) ...
c(1, 2, 3, 4, 5, 6) + c(1, 2, 3) # 等同上式

# 向量加減乘，向量中每一個變數都會進行運算
c(0, 5, 7, 6, 3) + 2 # 意即 (0 + 2), (5 + 2), (7 + 2) ...
c(0, 5, 7, 6, 3) - 2 # 意即 (0 - 2), (5 - 2), (7 - 2) ...
-9:2 * -3:-2 # 意即 (-9 * -3), (-8 * -2), (-7 * -3) ...

# 浮點數除法
1:5 / 5

# 整數除法(無條件捨去)
1:10 %/% 5

# 餘數
1:10 %% 5

# 判斷是否相等
identical(2 ^ 10, 1024, 2 ** 10)

# 向量內可以串接多個向量及變數，甚至做運算後再賦值
x <- c(10.4, 5.6, 3.1, 6.4, 21.7)
length(x)
y <- c(x, 0, x)
length(y)
v <- 2 * x + y + 1; v
length(v)

# 也可對向量進行邏輯運算
c(9, 5 + 4, 12 - 3, 3 ** 2) == 9
1:3 == 3:1
(1:10) ^ 2 >= 10

# 向量範圍函式
max(v)
min(v)
range(v)

# 向量排序(預設為升冪)
sort(v)
sort(v, TRUE) # 降冪排序

# 總和
sum(1:10)
sum(1, 3, 5, 7)
sum(v)

# 乘積
prod(1:10)
prod(1, 3, 5, 7)
prod(v)

# 絕對值
b = -3:2
abs(b)

# 有時在運算時會有捨位誤差，例如開根號(sqrt)
sqrt(2) ^ 2 == 2

# 可以使用all.equal來忽略容忍度內的誤差，如果在容忍範圍內，
# 會回傳 TRUE，若否，則會回傳差距
all.equal(sqrt(2) ^ 2, 2)

# 所以可再搭配isTRUE來回傳true or false
isTRUE(all.equal(sqrt(2) ^ 2, 2))

# 有時候遇到複數會有error，則需要加上 0i，先轉成複數再運算
sqrt(-17)
sqrt(-17 + 0i)

# 中位數
median(c(1, 3, 5, 7, 9))
median(1, 3, 5, 7) # Error! Only 2 args are available!

# 平均數
mean(1:10)
sum(1:10) / length(1:10)

# 變異數
var(x)
sum((x - mean(x)) ^ 2) / (length(x) - 1)

# <note> 沒有眾數專用的函式
which.max(table(c(0, 1, 2, 9, 3, 4, 9)))
# 離散眾數，第一個值為眾數，第二個值為由小到大排列位置(0, 1, 2, 3, 4, 9)
# 所以會為9(眾數), 6(由小到大排列第六個)

# 階層 factorial(7) = 7! = 7 * 6 * 5 * 4 * 3 * 2 * 1
factorial(7) + factorial(1) - 71 ^ 2

# 組合 choose(5, 2) = 5! / (2!3!) = (5 * 4) / (2 * 1) = 10
choose(5, 2)

# exp(5) = e ^ 5，e代表指數函數中的無理數，近似於2.718281828
exp(1:5) < 100

# Inf 表無窮大、-Inf 表無窮小
# NaN (Not a Number) 表示沒有數學意義或無法正常執行
# NA (Not Available) 表示缺失值(missing value)，任何涉及NA的計算，
# 結果都為NA，如果計算涉及 NA 及 NaN，則結果必為兩者之一，取決於系統

# 以下結果為 NaN
Inf - Inf
Inf / Inf
sin(Inf)
log(Inf, base = Inf)

# 以下結果為 NA
NA + 1
NA * 2
NA / 3
NA + Inf

# 判斷是否為有限/無限/NaN/NA
is.finite(x)
is.infinite(x)
is.na(x) # NA 及 NaN 都會為 TRUE
is.nan(x) # 僅 NaN 為TRUE

# 字串比較
c("yes", "no", "YES", "NO") == "yes"
isTRUE(all.equal("yes", "yes"))

# 字串連接
paste(c("X","Y"), 1:10, sep="")
paste(c("X","Y"), 1:10, sep="&")

# 邏輯運算 ! & |
1:10 >= 5
!TRUE
TRUE & FALSE
FALSE | TRUE

# 三個邏輯值 (TRUE, FALSE, NA) 的真值表
x = c(TRUE, FALSE, NA)
xy = expand.grid(x = x, y = x)
within(
  xy, 
{
  and = x & y 
  or = x | y 
  not.y = !y 
  not.x = !x
}
)

# 索引向量
# 邏輯向量，中括弧[]為條件式，為TRUE者才會被篩選出來
a = c(-1:3, 9, NaN, NA)
a[!is.na(a)]
(a + 1)[(!is.na(a)) & a > 0]

# 正整數向量，取出索引鍵為該數的值
a[6]
a[1:10]
c("a", "b")[rep(c(1, 2, 2, 1), times=4)]

# 負整數向量，表示排除該索引值
a[-(1:3)]

# 字串向量
fruit <- c(5, 10, 1, 20);
names(fruit) <- c("orange", "banana", "apple", "peach"); fruit
lunch <- fruit[c("apple","orange")]; lunch

# 使用索引向量來取絕對值
b = c(-3:2)
b[b < 0] = -b[b < 0]
