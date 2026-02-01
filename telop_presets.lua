local M = {}
function M.telop_presets(p,b)

local effect = obj.effect -- obj,effectはよく使うためeffect変数に代入している。

local presets = {
    -- ノーマルテロップ
    normal = {
        [1] = { text_col = 0x00ffffff, effects = {} },
        [2] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xffffff} } },
        [3] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xffffff}, {type="縁取り", size=3, blur=10, col=0x0a0a0a} } },
        [4] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xffffff}, {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x0a0a0a} } },
        [5] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xffffff}, {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x0a0a0a}, {type="縁取り", size=3, blur=10, col=0x0a0a0a} } },
        [6] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0x0a0a0a}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [7] = { text_col = 0xff9632, effects = { {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0x0a0a0a}, {type="縁取り", size=7, blur=10, col=0x0a0a0a}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [8] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0x0a0a0a}, {type="縁取り", size=7, blur=10, col=0xffffff}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [9] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0x0a0a0a}, {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0x0a0a0a}, {type="縁取り", size=7, blur=10, col=0xffffff}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [10] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xffffff}, {type="縁取り", size=7, blur=10, col=0xff9632}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [11] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xffffff}, {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0xff9632}, {type="縁取り", size=7, blur=10, col=0xff9632}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [12] = { text_col = 0xff9632, effects = { {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0x0a0a0a}, {type="縁取り", size=7, blur=10, col=0xffffff}, {type="縁取り", size=7, blur=10, col=0xff9632}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [13] = { text_col = 0xff9632, effects = { {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0x0a0a0a}, {type="縁取り", size=3, blur=10, col=0x0a0a0a}, {type="縁取り", size=7, blur=10, col=0xffffff}, {type="縁取り", size=7, blur=10, col=0xff9632}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [14] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xffffff}, {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0xff9632}, {type="縁取り", size=3, blur=10, col=0x0a0a0a}, {type="縁取り", size=7, blur=10, col=0xffffff}, {type="縁取り", size=7, blur=10, col=0xff9632}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [15] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xffffff}, {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0x0a0a0a}, {type="縁取り", size=3, blur=10, col=0x0a0a0a}, {type="縁取り", size=7, blur=10, col=0xffffff}, {type="縁取り", size=7, blur=10, col=0xff9632}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [16] = { text_col = 0xff9632, effects = { {type="縁取り", size=14, blur=10, col=0xffffff}, {type="縁取り", size=3, blur=10, col=0x0a0a0a}, {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0x0a0a0a}, {type="縁取り", size=7, blur=10, col=0xffffff}, {type="縁取り", size=7, blur=10, col=0xff9632}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [17] = { text_col = 0xff9632, effects = { {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0xffffff}, {type="縁取り", size=7, blur=10, col=0xffffff}, {type="縁取り", size=7, blur=10, col=0xff9632}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [18] = { text_col = 0xff9632, effects = { {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0xffffff}, {type="縁取り", size=7, blur=10, col=0xffffff}, {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0xff9632}, {type="縁取り", size=7, blur=10, col=0xff9632}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [19] = { text_col = 0xff9632, effects = { {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0xffffff}, {type="縁取り", size=7, blur=10, col=0xffffff}, {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0xff9632}, {type="縁取り", size=7, blur=10, col=0x0a0a0a}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [20] = { text_col = 0xff9632, effects = { {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0xffffff}, {type="縁取り", size=7, blur=10, col=0xffffff}, {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0x0a0a0a}, {type="縁取り", size=7, blur=10, col=0x0a0a0a}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [21] = { text_col = 0xff9632, effects = { {type="縁取り", size=20, blur=10, col=0xffffff}, {type="縁取り", size=3, blur=10, col=0x0a0a0a}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [22] = { text_col = 0xff9632, effects = { {type="シャドウ", x=5, y=5, alpha=100, diff=0, col=0x0a0a0a}, {type="縁取り", size=7, blur=10, col=0x0a0a0a}, {type="縁取り", size=20, blur=10, col=0xffffff}, {type="縁取り", size=3, blur=10, col=0x0a0a0a}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [23] = { text_col = 0xff9632, effects = { {type="縁取り", size=7, blur=10, col=0xffffff}, {type="縁取り", size=30, blur=70, col=0xffffff}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [24] = { text_col = 0xff9632, effects = { {type="シャドウ", x=0, y=0, alpha=50, diff=10, col=0x0a0a0a} } },
        [25] = { text_col = 0xff9632, effects = { {type="縁取り", size=50, blur=100, col=0x0a0a0a} } },
        [26] = { text_col = 0x0a0a0a, effects = { {type="縁取り", size=3, blur=10, col=0xffffff}, {type="縁取り", size=20, blur=10, col=0xdc1e1e}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [27] = { text_col = 0x0a0a0a, effects = { {type="シャドウ", x=5, y=3, alpha=100, diff=0, col=0xffffff}, {type="縁取り", size=3, blur=10, col=0xffffff}, {type="縁取り", size=20, blur=10, col=0xdc1e1e}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [28] = { text_col = 0xff9632, effects = { {type="縁取り", size=20, blur=10, col=0xffffff}, {type="縁取り", size=3, blur=10, col=0x0a0a0a}, {type="シャドウ", x=10, y=10, alpha=100, diff=0, col=0x0a0a0a}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [29] = { text_col = 0xff9632, effects = { {type="縁取り", size=20, blur=10, col=0xffffff}, {type="縁取り", size=3, blur=10, col=0x0a0a0a}, {type="シャドウ", x=10, y=10, alpha=100, diff=0, col=0x0a0a0a}, {type="縁取り", size=5, blur=5, col=0xffffff}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [30] = { text_col = 0xff9632, effects = { {type="縁取り", size=20, blur=10, col=0xffffff}, {type="縁取り", size=3, blur=10, col=0x0a0a0a}, {type="シャドウ", x=10, y=10, alpha=100, diff=0, col=0x0a0a0a}, {type="縁取り", size=5, blur=5, col=0xffffff}, {type="縁取り", size=30, blur=70, col=0xffc084} } },
    },
    -- 特殊テロップ
    special = {
        [1] = { text_col = 0x00ffffff, effects = {} },
        [2] = {
            text_col = 0xff9632,
            effects = {
                {type="ノイズ", pow=71, speedX=0, speedY=90.5, cycleX=8.15, cycleY=3.55, mode="明るさと乗算", n_type=2},
                {type="グラデーション", pow=100, x=0, y=0, angle=0, width=43, mode="加算", shape="線形", start_c=0xff0000, end_c=0x8e8e37},
                {type="縁取り", size=7, blur=10, col=0xffffff},
                {type="縁取り", size=7, blur=10, col=0xd50c0c},
                {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x0a0a0a},
                {type="縁取り", size=7, blur=10, col=0x0a0a0a},
                {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a}
            }
        },
        [3] = { text_col = 0xff2b2c, effects = { {type="ノイズ", pow=71, speedX=0, speedY=90.5, cycleX=8.15, cycleY=3.55, mode="明るさと乗算", n_type=3}, {type="縁取り", size=3, blur=10, col=0xffffff}, {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x0a0a0a}, {type="縁取り", size=7, blur=10, col=0x0a0a0a}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [4] = { text_col = 0xff9632, effects = { {type="ノイズ", pow=71, speedX=0, speedY=90.5, cycleX=8.15, cycleY=3.55, mode="明るさと乗算", n_type=3}, {type="縁取り", size=3, blur=10, col=0xffffff}, {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x0a0a0a}, {type="縁取り", size=7, blur=10, col=0x0a0a0a}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [5] = { text_col = 0xf7ff2b, effects = { {type="ノイズ", pow=71, speedX=0, speedY=90.5, cycleX=8.15, cycleY=3.55, mode="明るさと乗算", n_type=3}, {type="縁取り", size=3, blur=10, col=0xffffff}, {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x0a0a0a}, {type="縁取り", size=7, blur=10, col=0x0a0a0a}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [6] = { text_col = 0x2bff2b, effects = { {type="ノイズ", pow=71, speedX=0, speedY=90.5, cycleX=8.15, cycleY=3.55, mode="明るさと乗算", n_type=3}, {type="縁取り", size=3, blur=10, col=0xffffff}, {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x0a0a0a}, {type="縁取り", size=7, blur=10, col=0x0a0a0a}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [7] = { text_col = 0x39ffff, effects = { {type="ノイズ", pow=71, speedX=0, speedY=90.5, cycleX=8.15, cycleY=3.55, mode="明るさと乗算", n_type=3}, {type="縁取り", size=3, blur=10, col=0xffffff}, {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x0a0a0a}, {type="縁取り", size=7, blur=10, col=0x0a0a0a}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [8] = { text_col = 0x2626ff, effects = { {type="ノイズ", pow=71, speedX=0, speedY=90.5, cycleX=8.15, cycleY=3.55, mode="明るさと乗算", n_type=3}, {type="縁取り", size=3, blur=10, col=0xffffff}, {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x0a0a0a}, {type="縁取り", size=7, blur=10, col=0x0a0a0a}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [9] = { text_col = 0xba26ff, effects = { {type="ノイズ", pow=71, speedX=0, speedY=90.5, cycleX=8.15, cycleY=3.55, mode="明るさと乗算", n_type=3}, {type="縁取り", size=3, blur=10, col=0xffffff}, {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x0a0a0a}, {type="縁取り", size=7, blur=10, col=0x0a0a0a}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
        [10] = { text_col = 0xff26b1, effects = { {type="ノイズ", pow=71, speedX=0, speedY=90.5, cycleX=8.15, cycleY=3.55, mode="明るさと乗算", n_type=3}, {type="縁取り", size=3, blur=10, col=0xffffff}, {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x0a0a0a}, {type="縁取り", size=7, blur=10, col=0x0a0a0a}, {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=0x0a0a0a} } },
    },
    gradation = {
        [1] = { text_col = 0x00ffffff, effects = {} },
    },
    tsukkomi = {
        [1] = { text_col = 0x00ffffff, effects = {} },
    },
    anger = {
        [1] = { text_col = 0x00ffffff, effects = {} },
    },
    laugh = {
        [1] = { text_col = 0x00ffffff, effects = {} },
    },
    sadness = {
        [1] = { text_col = 0x00ffffff, effects = {} },
    },
    shyness = {
        [1] = { text_col = 0x00ffffff, effects = {} },
    },
    moved = {
        [1] = { text_col = 0x00ffffff, effects = {} },
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

-- 文字色色変更

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