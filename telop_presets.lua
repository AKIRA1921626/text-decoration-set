local M = {}
function M.telop_presets(p,b)

local effect = obj.effect -- obj,effectはよく使うためeffect変数に代入している。

local presets = {
    -- ノーマルテロップ
orange = {
        [1] = { text_col = 0xebebeb, effects = {} },
        [2] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xebebeb} } },
        [3] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [4] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x141414} } },
        [5] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x141414}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [6] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="縁取り", size=3, blur=10, col=0x141414} } },
        [7] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="縁取り", size=3, blur=10, col=0x141414}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [8] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="縁取り", size=3, blur=10, col=0x141414}, {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x141414} } },
        [9] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="縁取り", size=3, blur=10, col=0x141414}, {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x141414}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [10] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=3, blur=10, col=0x141414} } },
        [11] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=3, blur=10, col=0x141414}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [12] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=3, blur=10, col=0x141414}, {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x141414} } },
        [13] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=3, blur=10, col=0x141414}, {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x141414}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [14] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0x141414} } },
        [15] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0x141414}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [16] = { text_col = 0xff9632, effects = { {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=7, blur=10, col=0x141414} } },
        [17] = { text_col = 0xff9632, effects = { {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=7, blur=10, col=0x141414}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [18] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0x141414}, {type="縁取り", size=7, blur=10, col=0xebebeb} } },
        [19] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0x141414}, {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [20] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0x141414}, {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=7, blur=10, col=0xebebeb} } },
        [21] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0x141414}, {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [22] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="縁取り", size=7, blur=10, col=0xff9632} } },
        [23] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="縁取り", size=7, blur=10, col=0xff9632}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [24] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0xff9632}, {type="縁取り", size=7, blur=10, col=0xff9632} } },
        [25] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0xff9632}, {type="縁取り", size=7, blur=10, col=0xff9632}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [26] = { text_col = 0xff9632, effects = { {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="縁取り", size=7, blur=10, col=0xff9632} } },
        [27] = { text_col = 0xff9632, effects = { {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="縁取り", size=7, blur=10, col=0xff9632}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [28] = { text_col = 0xff9632, effects = { {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=3, blur=10, col=0x141414}, {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="縁取り", size=7, blur=10, col=0xff9632} } },
        [29] = { text_col = 0xff9632, effects = { {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=3, blur=10, col=0x141414}, {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="縁取り", size=7, blur=10, col=0xff9632}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [30] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0xff9632}, {type="縁取り", size=3, blur=10, col=0x141414}, {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="縁取り", size=7, blur=10, col=0xff9632} } },
        [31] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0xff9632}, {type="縁取り", size=3, blur=10, col=0x141414}, {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="縁取り", size=7, blur=10, col=0xff9632}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [32] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=3, blur=10, col=0x141414}, {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="縁取り", size=7, blur=10, col=0xff9632} } },
        [33] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=3, blur=10, col=0x141414}, {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="縁取り", size=7, blur=10, col=0xff9632}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [34] = { text_col = 0xff9632, effects = { {type="縁取り", size=14, blur=10, col=0xebebeb}, {type="縁取り", size=3, blur=10, col=0x141414}, {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="縁取り", size=7, blur=10, col=0xff9632} } },
        [35] = { text_col = 0xff9632, effects = { {type="縁取り", size=14, blur=10, col=0xebebeb}, {type="縁取り", size=3, blur=10, col=0x141414}, {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="縁取り", size=7, blur=10, col=0xff9632}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [36] = { text_col = 0xff9632, effects = { {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0xebebeb}, {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="縁取り", size=7, blur=10, col=0xff9632} } },
        [37] = { text_col = 0xff9632, effects = { {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0xebebeb}, {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="縁取り", size=7, blur=10, col=0xff9632}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [38] = { text_col = 0xff9632, effects = { {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0xebebeb}, {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0xff9632}, {type="縁取り", size=7, blur=10, col=0xff9632} } },
        [39] = { text_col = 0xff9632, effects = { {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0xebebeb}, {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0xff9632}, {type="縁取り", size=7, blur=10, col=0xff9632}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [40] = { text_col = 0xff9632, effects = { {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0xebebeb}, {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0xff9632}, {type="縁取り", size=7, blur=10, col=0x141414} } },
        [41] = { text_col = 0xff9632, effects = { {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0xebebeb}, {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0xff9632}, {type="縁取り", size=7, blur=10, col=0x141414}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [42] = { text_col = 0xff9632, effects = { {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0xebebeb}, {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=7, blur=10, col=0x141414} } },
        [43] = { text_col = 0xff9632, effects = { {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0xebebeb}, {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=7, blur=10, col=0x141414}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [44] = { text_col = 0xff9632, effects = { {type="縁取り", size=20, blur=10, col=0xebebeb}, {type="縁取り", size=3, blur=10, col=0x141414} } },
        [45] = { text_col = 0xff9632, effects = { {type="縁取り", size=20, blur=10, col=0xebebeb}, {type="縁取り", size=3, blur=10, col=0x141414}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [46] = { text_col = 0xff9632, effects = { {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=7, blur=10, col=0x141414}, {type="縁取り", size=20, blur=10, col=0xebebeb}, {type="縁取り", size=3, blur=10, col=0x141414} } },
        [47] = { text_col = 0xff9632, effects = { {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=7, blur=10, col=0x141414}, {type="縁取り", size=20, blur=10, col=0xebebeb}, {type="縁取り", size=3, blur=10, col=0x141414}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [48] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="縁取り", size=30, blur=70, col=0xebebeb} } },
        [49] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="縁取り", size=30, blur=70, col=0xebebeb}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [50] = { text_col = 0xff9632, effects = { {type="シャドウ", x=0, y=0, alpha=50, diff=10, col=0x141414} } },
        [51] = { text_col = 0xff9632, effects = { {type="縁取り", size=50, blur=100, col=0x141414} } },
        [52] = { text_col = 0xff9632, effects = { {type="縁取り", size=50, blur=100, col=0x141414}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [53] = { text_col = 0x141414, effects = { {type="縁取り", size=3, blur=10, col=0xebebeb}, {type="縁取り", size=20, blur=10, col=0xdc1e1e} } },
        [54] = { text_col = 0x141414, effects = { {type="縁取り", size=3, blur=10, col=0xebebeb}, {type="縁取り", size=20, blur=10, col=0xdc1e1e}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [55] = { text_col = 0x141414, effects = { {type="シャドウ", x=5, y=3, alpha=100, diff=0, col=0xebebeb}, {type="縁取り", size=3, blur=10, col=0xebebeb}, {type="縁取り", size=20, blur=10, col=0xdc1e1e} } },
        [56] = { text_col = 0x141414, effects = { {type="シャドウ", x=5, y=3, alpha=100, diff=0, col=0xebebeb}, {type="縁取り", size=3, blur=10, col=0xebebeb}, {type="縁取り", size=20, blur=10, col=0xdc1e1e}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [57] = { text_col = 0xff9632, effects = { {type="縁取り", size=20, blur=10, col=0xebebeb}, {type="縁取り", size=3, blur=10, col=0x141414}, {type="シャドウ", x=10, y=10, alpha=100, diff=0, col=0x141414} } },
        [58] = { text_col = 0xff9632, effects = { {type="縁取り", size=20, blur=10, col=0xebebeb}, {type="縁取り", size=3, blur=10, col=0x141414}, {type="シャドウ", x=10, y=10, alpha=100, diff=0, col=0x141414}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [59] = { text_col = 0xff9632, effects = { {type="縁取り", size=20, blur=10, col=0xebebeb}, {type="縁取り", size=3, blur=10, col=0x141414}, {type="シャドウ", x=10, y=10, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=5, blur=5, col=0xebebeb} } },
        [60] = { text_col = 0xff9632, effects = { {type="縁取り", size=20, blur=10, col=0xebebeb}, {type="縁取り", size=3, blur=10, col=0x141414}, {type="シャドウ", x=10, y=10, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=5, blur=5, col=0xebebeb}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [61] = { text_col = 0xff9632, effects = { {type="縁取り", size=20, blur=10, col=0xebebeb}, {type="縁取り", size=3, blur=10, col=0x141414}, {type="シャドウ", x=10, y=10, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=5, blur=5, col=0xebebeb}, {type="縁取り", size=30, blur=70, col=0xffc084} } },
        [62] = { text_col = 0xff9632, effects = { {type="縁取り", size=20, blur=10, col=0xebebeb}, {type="縁取り", size=3, blur=10, col=0x141414}, {type="シャドウ", x=10, y=10, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=5, blur=5, col=0xebebeb}, {type="縁取り", size=30, blur=70, col=0xffc084}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
    },
    -- 特殊テロップ
    special = {
        [1] = { text_col = 0xebebeb, effects = {} },
        [2] = {
            text_col = 0xff9632,
            effects = {
                {type="ノイズ", pow=71, speedX=0, speedY=90.5, cycleX=8.15, cycleY=3.55, mode="明るさと乗算", n_type=2},
                {type="グラデーション", pow=100, x=0, y=0, angle=0, width=43, mode="加算", shape="線形", start_c=0xff0000, end_c=0x8e8e37},
                {type="縁取り", size=7, blur=10, col=0xebebeb},
                {type="縁取り", size=7, blur=10, col=0xd50c0c},
                {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x141414},
                {type="縁取り", size=7, blur=10, col=0x141414},
                {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414}
            }
        },
        [3] = { text_col = 0xff2b2c, effects = { {type="ノイズ", pow=71, speedX=0, speedY=90.5, cycleX=8.15, cycleY=3.55, mode="明るさと乗算", n_type=3}, {type="縁取り", size=3, blur=10, col=0xebebeb}, {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=7, blur=10, col=0x141414}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [4] = { text_col = 0xff9632, effects = { {type="ノイズ", pow=71, speedX=0, speedY=90.5, cycleX=8.15, cycleY=3.55, mode="明るさと乗算", n_type=3}, {type="縁取り", size=3, blur=10, col=0xebebeb}, {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=7, blur=10, col=0x141414}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [5] = { text_col = 0xf7ff2b, effects = { {type="ノイズ", pow=71, speedX=0, speedY=90.5, cycleX=8.15, cycleY=3.55, mode="明るさと乗算", n_type=3}, {type="縁取り", size=3, blur=10, col=0xebebeb}, {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=7, blur=10, col=0x141414}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [6] = { text_col = 0x2bff2b, effects = { {type="ノイズ", pow=71, speedX=0, speedY=90.5, cycleX=8.15, cycleY=3.55, mode="明るさと乗算", n_type=3}, {type="縁取り", size=3, blur=10, col=0xebebeb}, {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=7, blur=10, col=0x141414}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [7] = { text_col = 0x39ffff, effects = { {type="ノイズ", pow=71, speedX=0, speedY=90.5, cycleX=8.15, cycleY=3.55, mode="明るさと乗算", n_type=3}, {type="縁取り", size=3, blur=10, col=0xebebeb}, {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=7, blur=10, col=0x141414}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [8] = { text_col = 0x2626ff, effects = { {type="ノイズ", pow=71, speedX=0, speedY=90.5, cycleX=8.15, cycleY=3.55, mode="明るさと乗算", n_type=3}, {type="縁取り", size=3, blur=10, col=0xebebeb}, {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=7, blur=10, col=0x141414}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [9] = { text_col = 0xba26ff, effects = { {type="ノイズ", pow=71, speedX=0, speedY=90.5, cycleX=8.15, cycleY=3.55, mode="明るさと乗算", n_type=3}, {type="縁取り", size=3, blur=10, col=0xebebeb}, {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=7, blur=10, col=0x141414}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
        [10] = { text_col = 0xff26b1, effects = { {type="ノイズ", pow=71, speedX=0, speedY=90.5, cycleX=8.15, cycleY=3.55, mode="明るさと乗算", n_type=3}, {type="縁取り", size=3, blur=10, col=0xebebeb}, {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=7, blur=10, col=0x141414}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x141414} } },
    },
    gradation = {
        [1] = { text_col = 0xebebeb, effects = {} },
    },
    tsukkomi = {
        [1] = { text_col = 0xebebeb, effects = {} },
    },
    anger = {
        [1] = { text_col = 0xebebeb, effects = {} },
    },
    laugh = {
        [1] = { text_col = 0xebebeb, effects = {} },
    },
    sadness = {
        [1] = { text_col = 0xebebeb, effects = {} },
    },
    shyness = {
        [1] = { text_col = 0xebebeb, effects = {} },
    },
    moved = {
        [1] = { text_col = 0xebebeb, effects = {} },
    },
}

local p_num

local data

if(p.deco2 ~= 1) then
    p_num = p.deco2
    data= presets.normal[p_num]
elseif(p.deco3 ~= 1) then
    p_num = p.deco3
elseif(p.deco4 ~= 1) then
    p_num = p.deco4
elseif(p.deco5 ~= 1) then
    p_num = p.deco5
    data= presets.orange[p_num]
elseif(p.deco6 ~= 1) then
    p_num = p.deco6
elseif(p.deco7 ~= 1) then
    p_num = p.deco7
elseif(p.deco8 ~= 1) then
    p_num = p.deco8
elseif(p.deco9 ~= 1) then
    p_num = p.deco9
elseif(p.deco10 ~= 1) then
    p_num = p.deco10
    data= presets.special[p_num]
end

if(data.text_col ~= nil) then
    obj.effect("単色化", "強さ", 100, "色", data.text_col, "輝度を保持する", 0)
end

for _, eff in ipairs(data.effects) do -- _はキーを表し、effはそのキーの中身を表す。data.effectsはpresets.normal[].effectsであり、そのキー_とそれに対応する中身eff
    
    if eff == nil then
        break
    elseif eff.type == "縁取り" then
        obj.effect("縁取り", "サイズ", eff.size, "ぼかし", eff.blur, "縁色", eff.col)
    elseif eff.type == "シャドウ" then
        obj.effect("ドロップシャドウ", "X", eff.x, "Y", eff.y, "濃さ", eff.alpha, "拡散", eff.diff, "影色", eff.col)
        
    elseif eff.type == "ノイズ" then
        obj.effect("ノイズ", "強さ", eff.pow, "速度X", eff.speedX, "速度Y", eff.speedY, "周期X", eff.cycleX, "周期Y", eff.cycleY, "合成モード", eff.mode, "ノイズの種類", eff.n_type)
        
    elseif eff.type == "グラデーション" then
        obj.effect("グラデーション", "強さ", eff.pow, "中心X", eff.x, "中心Y", eff.y, "角度", eff.angle, "幅", eff.width, "合成モード", eff.mode, "形状", eff.shape, "開始色", eff.start_c, "終了色", eff.end_c)
    end
end

end

return M