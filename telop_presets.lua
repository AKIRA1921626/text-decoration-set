local M = {}
function M.telop_presets(p,b)

    local Styles = {}

    -- -----------------------------------------------------------------------------
    -- 1. カラー定義と定数
    -- -----------------------------------------------------------------------------
    local C_WHITE = 0xebebeb
    local C_BLACK = 0x141414
    local C_PALE_RED = 0xff848a
    local C_SKIN  = 0xffc084
    local C_BLOND = 0xfbff84
    local C_PALE_GREEN = 0xc0ff84
    local C_MINT_GREEN = 0x84ff8b
    local C_PALE_BLUE = 0x84fbff
    local C_SKY_BLUE = 0x8491ff
    local C_LAVENDER = 0xda84ff
    local C_PALE_PINK = 0xff84e8



    local base_colors = {
        white        = 0xebebeb, -- deco2
        black        = 0x141414, -- deco3
        red          = 0xff2b2c, -- deco4
        orange       = 0xff9632, -- deco5
        yellow       = 0xfff000, -- deco6
        yellow_green = 0xb4ff3c, -- deco7
        green        = 0x00c832, -- deco8
        light_blue   = 0x32e6ff, -- deco9
        blue         = 0x1e32e6, -- deco10
        purple       = 0x9600dc, -- deco11
        pink         = 0xff1ec8, -- deco12
    }

    -- -----------------------------------------------------------------------------
    -- 2. 標準デコレーション生成関数 (1-58)
    -- -----------------------------------------------------------------------------
    local function get_effect_template(main_col, id, color_key)
        if id == 1 then return { text_col = (color_key == "white" and C_WHITE or main_col), effects = {} } end

        local effects = {}
        local F_WHITE = {type="縁取り", size=7, blur=10, col=C_WHITE}
        local F_BLACK = {type="縁取り", size=7, blur=10, col=C_BLACK}
        local F_MAIN  = {type="縁取り", size=7, blur=10, col=main_col}
        local H_BLACK = {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=C_BLACK}
        local H_WHITE = {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=C_WHITE}
        local H_MAIN  = {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=main_col}
        local S_BLACK = {type="シャドウ", x=10, y=10, alpha=30, diff=10, col=C_BLACK}

        if id == 2 then 
            table.insert(effects, (color_key == "white") and F_BLACK or F_WHITE)
        elseif id == 3 then
            table.insert(effects, (color_key == "white") and F_BLACK or F_WHITE); table.insert(effects, S_BLACK)
        elseif id == 4 then
            table.insert(effects, (color_key == "white") and F_BLACK or F_WHITE); table.insert(effects, H_BLACK)
        elseif id == 5 then
            table.insert(effects, (color_key == "white") and F_BLACK or F_WHITE)
            if color_key == "black" then table.insert(effects, H_WHITE) else table.insert(effects, H_BLACK) end
            table.insert(effects, S_BLACK)
        elseif id == 6 then
            table.insert(effects, F_BLACK); table.insert(effects, F_WHITE)
        elseif id == 7 then
            table.insert(effects, F_BLACK); table.insert(effects, F_WHITE); table.insert(effects, S_BLACK)
        elseif id >= 8 and id <= 9 then
            table.insert(effects, F_BLACK); table.insert(effects, F_WHITE); table.insert(effects, H_BLACK)
            if id == 9 then table.insert(effects, S_BLACK) end
        elseif id >= 10 and id <= 13 then
            table.insert(effects, F_BLACK); table.insert(effects, (color_key == "white") and H_BLACK or H_WHITE); table.insert(effects, F_WHITE)
            if id == 11 or id == 13 then table.insert(effects, S_BLACK) end
        elseif id == 14 or id == 15 then
            table.insert(effects, F_BLACK)
            if id == 15 then table.insert(effects, S_BLACK) end
        elseif id == 16 or id == 17 then
            table.insert(effects, H_BLACK); table.insert(effects, F_BLACK)
            if id == 17 then table.insert(effects, S_BLACK) end
        elseif id == 18 or id == 19 then
            table.insert(effects, F_BLACK); table.insert(effects, F_WHITE)
            if id == 19 then table.insert(effects, S_BLACK) end
        elseif id == 20 or id == 21 then
            table.insert(effects, F_BLACK); table.insert(effects, H_BLACK); table.insert(effects, F_WHITE)
            if id == 21 then table.insert(effects, S_BLACK) end
        elseif id >= 22 and id <= 23 then
            table.insert(effects, F_WHITE); table.insert(effects, F_MAIN)
            if id == 23 then table.insert(effects, S_BLACK) end
        elseif id >= 24 and id <= 25 then
            table.insert(effects, F_WHITE); table.insert(effects, H_MAIN); table.insert(effects, F_MAIN)
            if id == 25 then table.insert(effects, S_BLACK) end
        elseif id >= 26 and id <= 27 then
            table.insert(effects, H_BLACK); table.insert(effects, F_WHITE); table.insert(effects, F_MAIN)
            if id == 27 then table.insert(effects, S_BLACK) end
        elseif id >= 28 and id <= 29 then
            table.insert(effects, H_BLACK); table.insert(effects, F_BLACK); table.insert(effects, F_WHITE); table.insert(effects, F_MAIN)
            if id == 29 then table.insert(effects, S_BLACK) end
        elseif id >= 30 and id <= 31 then
            table.insert(effects, F_WHITE); table.insert(effects, H_MAIN); table.insert(effects, F_BLACK); table.insert(effects, F_WHITE); table.insert(effects, F_MAIN)
            if id == 31 then table.insert(effects, S_BLACK) end
        elseif id >= 32 and id <= 33 then
            table.insert(effects, F_WHITE); table.insert(effects, H_BLACK); table.insert(effects, F_BLACK); table.insert(effects, F_WHITE)
            table.insert(effects, (color_key == "black") and F_WHITE or F_MAIN)
            if id == 33 then table.insert(effects, S_BLACK) end
        elseif id == 34 or id == 35 then
            table.insert(effects, {type="縁取り", size=14, blur=10, col=C_BLACK}); table.insert(effects, F_WHITE)
            table.insert(effects, H_BLACK); table.insert(effects, F_BLACK); table.insert(effects, F_WHITE)
            if id == 35 then table.insert(effects, S_BLACK) end
        elseif id >= 36 and id <= 37 then
            table.insert(effects, H_WHITE); table.insert(effects, F_WHITE); table.insert(effects, F_MAIN)
            if id == 37 then table.insert(effects, S_BLACK) end
        elseif id >= 38 and id <= 43 then
            table.insert(effects, H_WHITE); table.insert(effects, F_WHITE)
            if id == 38 or id == 39 then table.insert(effects, H_MAIN) end
            if id == 40 or id == 41 then table.insert(effects, H_MAIN) end
            if id == 42 or id == 43 then table.insert(effects, H_BLACK) end
            table.insert(effects, (id >= 40) and F_BLACK or F_MAIN)
            if id % 2 ~= 0 then table.insert(effects, S_BLACK) end
        elseif id == 44 or id == 45 then
            table.insert(effects, {type="縁取り", size=20, blur=10, col=C_WHITE}); table.insert(effects, F_BLACK)
            if id == 45 then table.insert(effects, S_BLACK) end
        elseif id == 46 or id == 47 then
            table.insert(effects, H_WHITE); table.insert(effects, F_WHITE); table.insert(effects, F_BLACK); table.insert(effects, F_WHITE)
            if id == 47 then table.insert(effects, S_BLACK) end
        elseif id == 48 or id == 49 then
            table.insert(effects, F_WHITE); table.insert(effects, {type="縁取り", size=30, blur=70, col=C_WHITE})
            if id == 49 then table.insert(effects, S_BLACK) end
        elseif id == 50 then
            table.insert(effects, {type="シャドウ", x=0, y=0, alpha=50, diff=10, col=C_BLACK})
        elseif id == 51 or id == 52 then
            table.insert(effects, {type="縁取り", size=50, blur=100, col=(color_key == "white" and C_WHITE or C_BLACK)})
            if id == 52 then table.insert(effects, S_BLACK) end
        elseif id >= 53 and id <= 54 then
            table.insert(effects, {type="縁取り", size=20, blur=10, col=C_WHITE}); table.insert(effects, F_BLACK); table.insert(effects, H_BLACK)
            if id == 54 then table.insert(effects, S_BLACK) end
        elseif id >= 55 and id <= 56 then
            table.insert(effects, {type="縁取り", size=20, blur=10, col=C_BLACK}); table.insert(effects, F_WHITE); table.insert(effects, H_WHITE)
            if id == 56 then table.insert(effects, S_BLACK) end
        elseif id >= 57 and id <= 74 then
            table.insert(effects, F_BLACK);
            if id >= 57 and id <= 58 then table.insert(effects, {type="縁取り", size=30, blur=70, col=C_PALE_RED}) end
            if id >= 59 and id <= 60 then table.insert(effects, {type="縁取り", size=30, blur=70, col=C_SKIN}) end
            if id >= 61 and id <= 62 then table.insert(effects, {type="縁取り", size=30, blur=70, col=C_BLOND}) end
            if id >= 63 and id <= 64 then table.insert(effects, {type="縁取り", size=30, blur=70, col=C_PALE_GREEN}) end
            if id >= 65 and id <= 66 then table.insert(effects, {type="縁取り", size=30, blur=70, col=C_MINT_GREEN}) end
            if id >= 67 and id <= 68 then table.insert(effects, {type="縁取り", size=30, blur=70, col=C_PALE_BLUE}) end
            if id >= 69 and id <= 70 then table.insert(effects, {type="縁取り", size=30, blur=70, col=C_SKY_BLUE}) end
            if id >= 71 and id <= 72 then table.insert(effects, {type="縁取り", size=30, blur=70, col=C_LAVENDER}) end
            if id >= 73 and id <= 74 then table.insert(effects, {type="縁取り", size=30, blur=70, col=C_PALE_PINK}) end
            if id % 2 == 0 then table.insert(effects, S_BLACK) end
        elseif id >= 75 and id <= 92 then
            table.insert(effects, F_BLACK); table.insert(effects, F_WHITE); table.insert(effects, F_BLACK)
            if id >= 75 and id <= 76 then table.insert(effects, {type="縁取り", size=30, blur=70, col=C_PALE_RED}) end
            if id >= 77 and id <= 78 then table.insert(effects, {type="縁取り", size=30, blur=70, col=C_SKIN}) end
            if id >= 79 and id <= 80 then table.insert(effects, {type="縁取り", size=30, blur=70, col=C_BLOND}) end
            if id >= 81 and id <= 82 then table.insert(effects, {type="縁取り", size=30, blur=70, col=C_PALE_GREEN}) end
            if id >= 83 and id <= 84 then table.insert(effects, {type="縁取り", size=30, blur=70, col=C_MINT_GREEN}) end
            if id >= 85 and id <= 86 then table.insert(effects, {type="縁取り", size=30, blur=70, col=C_PALE_BLUE}) end
            if id >= 87 and id <= 88 then table.insert(effects, {type="縁取り", size=30, blur=70, col=C_SKY_BLUE}) end
            if id >= 89 and id <= 90 then table.insert(effects, {type="縁取り", size=30, blur=70, col=C_LAVENDER}) end
            if id >= 91 and id <= 92 then table.insert(effects, {type="縁取り", size=30, blur=70, col=C_PALE_PINK}) end
            if id % 2 == 0 then table.insert(effects, S_BLACK) end
        end

        return { text_col = (color_key == "white" and C_WHITE or main_col), effects = effects }
    end

    -- -----------------------------------------------------------------------------
    -- 3. 特殊テロップの定義 (special)
    -- -----------------------------------------------------------------------------
    Styles.special = {
        [1] = { text_col = 0xebebeb, effects = {} },
        [2] = {
            text_col = 0xff9632,
            effects = {
                {type="ノイズ", pow=71, speedX=0, speedY=90.5, cycleX=8.15, cycleY=3.55, mode="明るさと乗算", n_type=2},
                {type="グラデーション", pow=100, x=0, y=0, angle=0, width=43, mode="加算", shape="線形", start_c=0xff0000, end_c=0x8e8e37},
                {type="縁取り", size=7, blur=10, col=0xebebeb}, {type="縁取り", size=7, blur=10, col=0xd50c0c},
                {type="シャドウ", x=7, y=7, alpha=100, diff=0, col=0x141414}, {type="縁取り", size=7, blur=10, col=0x141414},
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
    }

    -- -----------------------------------------------------------------------------
    -- 4. 構築
    -- -----------------------------------------------------------------------------
    for name, main_col in pairs(base_colors) do
        Styles[name] = {}
        for i = 1, 92 do
            Styles[name][i] = get_effect_template(main_col, i, name)
        end
    end

    -- データ選択ロジック
    local data = { text_col = nil, effects = {} }

    if(p.deco14 and p.deco14 ~= 1) then
        data = Styles.special[p.deco14]
    elseif(p.deco13 and p.deco13 ~= 1) then
        data = Styles.special[p.deco13] -- gradationをspecialに統合
    elseif(p.deco12 and p.deco12 ~= 1) then
        data = Styles.pink[p.deco12]
    elseif(p.deco11 and p.deco11 ~= 1) then
        data = Styles.purple[p.deco11]
    elseif(p.deco10 and p.deco10 ~= 1) then
        data = Styles.blue[p.deco10]
    elseif(p.deco9 and p.deco9 ~= 1) then
        data = Styles.light_blue[p.deco9]
    elseif(p.deco8 and p.deco8 ~= 1) then
        data = Styles.green[p.deco8]
    elseif(p.deco7 and p.deco7 ~= 1) then
        data = Styles.yellow_green[p.deco7]
    elseif(p.deco6 and p.deco6 ~= 1) then
        data = Styles.yellow[p.deco6]
    elseif(p.deco5 and p.deco5 ~= 1) then
        data = Styles.orange[p.deco5]
    elseif(p.deco4 and p.deco4 ~= 1) then
        data = Styles.red[p.deco4]
    elseif(p.deco3 and p.deco3 ~= 1) then
        data = Styles.black[p.deco3]
    elseif(p.deco2 and p.deco2 ~= 1) then
        data = Styles.white[p.deco2]
    end

    -- 描画処理
    if(data.text_col ~= nil) then
        obj.effect("単色化", "強さ", 100, "色", data.text_col, "輝度を保持する", 0)
    end

    for _, eff in ipairs(data.effects) do
        if eff == nil then break end
        
        if eff.type == "縁取り" then
            obj.effect("縁取り", "サイズ", eff.size * p.prisets_resize, "ぼかし", eff.blur, "縁色", eff.col)
        elseif eff.type == "シャドウ" then
            obj.effect("ドロップシャドウ", "X", eff.x * p.prisets_resize, "Y", eff.y * p.prisets_resize, "濃さ", eff.alpha, "拡散", eff.diff, "影色", eff.col)
        elseif eff.type == "ノイズ" then
            obj.effect("ノイズ", "強さ", eff.pow, "速度X", eff.speedX, "速度Y", eff.speedY, "周期X", eff.cycleX, "周期Y", eff.cycleY, "合成モード", eff.mode, "ノイズの種類", eff.n_type)
        elseif eff.type == "グラデーション" then
            obj.effect("グラデーション", "強さ", eff.pow, "中心X", eff.x, "中心Y", eff.y, "角度", eff.angle, "幅", eff.width * p.prisets_resize, "合成モード", eff.mode, "形状", eff.shape, "開始色", eff.start_c, "終了色", eff.end_c)
        end
    end

end

return M