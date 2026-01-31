local M = {}
local join = require("Individual_object_join") -- テキスト一枚化用のモジュール

function M.text_decoration_presets(p, b)
    local effect = obj.effect
    local is_multi = obj.getoption("multi_object")
    local idx = obj.index + 1

-- 1. 影の設定更新（内部関数）
local function update_shadow_table(target_b, is_clear, x, y)
    -- is_clear が 0 以外（チェックON）のとき、テーブルの値を直接書き換える
    if is_clear ~= 0 then
        target_b.x = x
        target_b.y = y
        target_b.deep = 100
        target_b.diffsion = 0
    end
    -- target_b は参照なので、戻り値を代入しなくても元のテーブルが更新される
end

    -- 呼び出し側（引数名を params の定義と一致させる）
    update_shadow_table(b.shadow1, p.shadow_clear1, 3, 5)
    update_shadow_table(b.shadow2, p.shadow_clear2, 3, 54)
    update_shadow_table(b.shadow3, p.shadow_clear3, 3, 5)

    -- 2. 内部関数の定義（エッジ・影）
    local function apply_edge(target_order)
        if (p.edge_enable ~= 0 and p.edge_order == target_order) then
            effect("凸エッジ", "幅", p.edge_width, "高さ", p.edge_height, "角度", p.edge_angle)
        end
    end

    local function apply_shadow(target_order)
        local s_idx = target_order -- 描画順に応じた影設定の参照（必要に応じて調整）
        if (p.shadow_enable1 ~= 0 and p.shadow_order1 == target_order) then
            effect("ドロップシャドウ", 
                "X", (b.shadow1.x + p.shadow_x1) * p.resize, 
                "Y", (b.shadow1.y + p.shadow_y1) * p.resize, 
                "濃さ", b.shadow1.deep + p.shadow_deep1, 
                "拡散", b.shadow1.diffsion + p.shadow_diffusion1, 
                "影色", p.shadow_col1, 
                "影を別オブジェクトで描画", 0
            )
        end
    end

    -- 3. 色変更（単色化）
    if (p.char_col1 ~= nil) then
        if (not is_multi or (idx >= p.char_start1 and idx <= p.char_end1)) then
            effect("単色化", "強さ", 100, "色", p.char_col1, "輝度を保持する", 0)
        end
    end
    -- 以降のcol2, col3, reset処理は元のロジックを維持 --
    if (is_multi) then
        if (p.char_col2 ~= nil and idx >= p.char_start2 and idx <= p.char_end2) then
            effect("単色化", "強さ", 100, "色", p.char_col2, "輝度を保持する", 0)
        end
        if (p.char_col3 ~= nil and idx >= p.char_start3 and idx <= p.char_end3) then
            effect("単色化", "強さ", 100, "色", p.char_col3, "輝度を保持する", 0)
        end
    end
    if(p.char_reset1 ~= 0) then p.char_col1 = nil end
    if(p.char_reset2 ~= 0) then p.char_col2 = nil end
    if(p.char_reset3 ~= 0) then p.char_col3 = nil end

    -- 4. グラデーション
    local GRD_TYPES = { "線形", "円形", "矩形", "凸形" }
    local GRD_COMPOSITES = { "通常", "加算", "減算", "乗算", "スクリーン", "オーバーレイ", "比較(明)", "比較(暗)", "輝度", "色差", "陰影", "明暗", "差分" }
    
    local deco_t1 = (p.deco >= 6 and p.deco <= 10) or (p.deco >= 16 and p.deco <= 20)
    
    for i = 2, 1, -1 do
        local g_en = p["grd_enable"..i] ~= 0
        local in_r = (idx >= p["grd_start"..i] and idx <= p["grd_end"..i])
        if (g_en or deco_t1) and (not is_multi or in_r) then
            local g_type = GRD_TYPES[p["grd_type"..i]] or "線形"
            local g_comp = GRD_COMPOSITES[p["grd_composite"..i]] or "通常"
            local noC1 = (p["grd_start_col"..i] == nil) and 1 or 0
            local noC2 = (p["grd_end_col"..i] == nil) and 1 or 0
            
            effect("グラデーション", "強さ", b.grd.pow + p["grd_pow"..i], "中心X", b.grd.x + p["grd_x"..i], "中心Y", b.grd.y + p["grd_y"..i], "角度", b.grd.r + p["grd_rotate"..i], "幅", (b.grd.w + p["grd_width"..i]) * p.resize, "合成モード", g_comp, "形状", g_type, "開始色", p["grd_start_col"..i], "no_color", noC1, "終了色", p["grd_end_col"..i], "no_color2", noC2)
        end
    end

    local grd_string_integrate = 0

    -- テキスト一枚化処理 (グラデーション用)
    local w, h = 0, 0
    local succes_grd_integrate = 0
    local succes_frame_integrate = 0
    if(is_multi and ( p.grd_integrate1 ~= 0 or p.grd_integrate2 ~= 0 ) and not ( succes_frame_integrate ~= 0 ) ) then
        for i=0, obj.num do
            local aw, ah = obj.getpixel()
         w, h = (w+aw) * obj.sx * obj.sy * obj.sz, (h+ah) * obj.sx * obj.sy * obj.sz
        end
        join.object_join(w, h)
        succes_grd_integrate = 1
end

    -- 5. 描画（縁取り・エッジ・シャドウ）
    apply_edge(1)
    apply_shadow(1)

    -- プリセットに基づく縁取り判定用フラグ
    local deco_table = {
        (p.deco >= 2 and p.deco <= 5) or (p.deco >= 7 and p.deco <= 10) or (p.deco >= 12 and p.deco <= 15) or (p.deco >= 16 and p.deco <= 20),
        (p.deco >= 3 and p.deco <= 5) or (p.deco >= 8 and p.deco <= 10) or (p.deco >= 13 and p.deco <= 15) or (p.deco >= 17 and p.deco <= 20),
        (p.deco == 5) or (p.deco == 10) or (p.deco == 15) or (p.deco == 20)
    }

    for i = 1, 3 do
        local frame_en = p["frame_enable"..i] ~= 0
        local in_range
        if( not is_multi or succes_grd_integrate ~= 0) then
           in_range = true -- 全体オブジェクトの時、または、グラデーションの時のテキスト一枚化が有効な時、trueを代入。
        elseif( is_multi and succes_grd_integrate == 0 ) then
           in_range = (idx >= p["frame_start"..i] and idx <= p["frame_end"..i]) -- 個別オブジェクトの時であり、なおかつ、グラデーションの時のテキスト一枚化が無効な時、縁取り開始文字～終了文字の値を代入。
        end

        if (frame_en or deco_table[i]) and in_range then
            local f_col = p["frame_col"..i]
            -- 特殊プリセット時の色上書き（旧deco 4, 9, 14, 19の処理）
            if i == 2 and p.deco % 5 == 4 then
                f_col = p.char_col1 or p.grd_start_col1 or 0xffffff
            end

            effect("縁取り", 
                "サイズ", (b.frame.size + p["frame_size"..i] + p.frame_size_common) * p.resize,
                "ぼかし", b.frame.blur + p["frame_blur"..i] + p.frame_blur_common,
                "縁色", f_col
            )
        end
        apply_edge(i + 1)
        apply_shadow(i + 1)
    end

    local frame_string_integrate0 = 0
    if(p.frame_integrate ~= 0) then
        frame_string_integrate0 = 1
    end

    -- テキスト一枚化処理 (縁取り用)
    if(is_multi and frame_string_integrate0 ~= 0 and not ( succes_grd_integrate ~= 0 )) then
        for i=0, obj.num do
            local aw, ah = obj.getpixel()
            w, h = (w+aw) * obj.sx * obj.sy * obj.sz, (h+ah) * obj.sx * obj.sy * obj.sz
        end
        if(frame_string_integrate ~= 0) then
            join.object_join(w, h)
            succes_frame_integrate = 1
        end
    end
end

return M