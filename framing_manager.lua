local M = {}

-- 内部関数：特定の縁取り（index 0～2）をプリセット等に基づき描画すべきか判定
local function should_apply_by_deco(p, index)
    local d = p.deco
    -- 0: 縁取り1枠目, 1: 2枠目, 2: 3枠目
    if index == 0 then
        -- 2-5, 7-10, 12-15, 17-20番以外（1, 6, 11, 16番など）で真
        return not (d >= 2 and d <= 20 and d % 5 ~= 1)
    elseif index == 1 then
        -- 3-5, 8-10, 13-15, 18-20番以外で真
        return not (d >= 3 and d <= 20 and d % 5 ~= 1 and d % 5 ~= 2)
    elseif index == 2 then
        -- 5, 10, 15, 20番以外で真
        return not (d % 5 == 0 and d ~= 0)
    end
    return false
end

-- 外部関数：実行
function M.execute(p, b)
    local effect = obj.effect
    local resize = p.resize or 1
    local is_multi = obj.getoption("multi_object")

    -- 1. 範囲判定フラグの準備
    local apply_flags = {}
    if (not is_multi) then
        apply_flags = { true, true, true }
    else
        local idx = obj.index + 1
        -- パラメータ名が p.frame_s0 ... の形式であることを想定
        apply_flags[1] = (p.frame_start1 <= idx and p.frame_end1 >= idx)
        apply_flags[2] = (p.frame_start2 <= idx and p.frame_end2 >= idx)
        apply_flags[3] = (p.frame_start3 <= idx and p.frame_end3 >= idx)
    end

    -- 2. 縁取り実行ループ (0～2 の 3枠分)
    for i = 0, 2 do
        local check = p["frame" .. i]
        
        -- 「チェックがON」かつ「描画範囲内」かつ「プリセットで除外されていない」場合
        if (check ~= 0 and apply_flags[i+1] and should_apply_by_deco(p, i)) then
            
            local f_size = p["frame_size" .. i] or 0
            local f_blur = p["frame_blur" .. i] or 0
            local f_col  = p["frame_col" .. i] or 0xffffff

            -- エフェクト実行
            effect("縁取り", 
                "サイズ", (b.frame.size + f_size + p.frame_size_common) * resize, 
                "ぼかし", b.frame.blur + f_blur + p.frame_blur_common, 
                "縁色",   f_col
            )

            -- 関連する描画関数の呼び出し（順序: 2, 3, 4）
            -- 呼び出し側で p.apply_edge = M.apply_edge のように格納しておく必要があります
            if type(p.apply_edge) == "function" then 
                p.apply_edge(i + 2) 
            end
            if type(p.apply_shadow) == "function" then 
                p.apply_shadow(i + 2) 
            end
        end
    end
end

return M