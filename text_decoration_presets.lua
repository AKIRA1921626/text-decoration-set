--[[
装飾セット.anm2などで使う用の.luaファイル。
プリセットを使用すためだけに使う。
使いまわしをする予定はないが、長くなると思ったので.luaファイルに分けた。
]]

-- ============================================================
-- 装飾セット.anm2から渡された params(p) の構造・値対応表
-- ============================================================

-- 【01. 装飾プリセット (params.deco / params.deco_presets)】
-- 1:装飾なし / 2:縁取り1枠 / 3:縁取り2枠 / 4:縁取り2枠(2枠目色連動) / 5:縁取り3枠
-- 6:縁取り3枠影あり / 7:グラデ文字 / 8:グラデ文字縁取り1枠 / 9:グラデ文字縁取り2枠
-- 10:グラデ文字縁取り2枠(2枠目色連動)影あり / 11:グラデ文字縁取り3枠
-- 12:グラデ文字縁取り1枠影あり / 13:グラデ文字縁取り2枠影あり
-- 14:グラデ文字縁取り2枠(2枠目色連動)影あり / 15:グラデ文字縁取り3枠影あり
-- 16:ざぶとん / 17:ざぶとん縁取り1枠 / 18:ざぶとん縁取り2枠
-- 19:ざぶとん縁取り2枠(2枠目枠色連動) / 20:ざぶとん縁取り3枠 / 21:ざぶとんグラデ文字
-- 22:ざぶとんグラデ文字縁取り1枠 / 23:ざぶとんグラデ文字縁取り2枠
-- 24:ざぶとんグラデ文字縁取り2枠(2枠目色連動) / 25:ざぶとんグラデ文字縁取り3枠
-- 26:ざぶとん影あり / 27:ざぶとんグラデ文字影あり / 28:ざぶとんグラデ文字縁取り1枠影あり
-- 29:ざぶとんグラデ文字縁取り2枠影あり / 30:ざぶとんグラデ文字縁取り2枠(2枠目色連動)影あり
-- 31:ざぶとんグラデ文字縁取り3枠影あり

-- 【02. グラデーション設定 (params.grd_type0, params.grd_type1)】
-- 1:線形 / 2:円形 / 3:矩形 / 4:凸形

-- 【03. 合成モード (params.grd_composite0, params.grd_composite1)】
-- 1:通常 / 2:加算 / 3:減算 / 4:乗算 / 5:スクリーン / 6:オーバーレイ
-- 7:比較(明) / 8:比較(暗) / 9:輝度 / 10:色差 / 11:陰影 / 12:明暗 / 13:差分

-- 【04. 基本設定】
-- p.deco             : 装飾プリセット選択値 (1始まりの番号)
-- p.char_col0        : 文字色 (nil または 0xRRGGBB)

-- 【05. グラデーション1 (メイン)】
-- p.grd_0            : グラデーション1有効化 (0/1)
-- p.grds_col0        : 開始色 / p.grde_col0 : 終了色
-- p.grd_type0        : タイプ (1-4) / p.grd_pow0 : 強さ (0-100)
-- p.grd_x0 / p.grd_y0: 中心座標X / Y
-- p.grd_rotate0      : 角度 / p.grd_width0 : 幅
-- p.grd_composite0   : 合成モード (1-13)

-- 【06. 個別オブジェクト用グラデーション (1&2)】
-- p.grd_s0 / p.grd_e0: グラデ1開始文字 / 終了文字 (1始まりのインデックス)
-- p.grd_1            : グラデーション2有効化 (0/1)
-- p.grd_s1 / p.grd_e1: グラデ2開始文字 / 終了文字 (1始まりのインデックス)
-- p.grds_col1        : グラデ2開始色 / p.grde_col1 : グラデ2終了色
-- p.grd_type1        : グラデ2タイプ (1-4) / p.grd_pow1 : グラデ2強さ (0-100)
-- p.grd_x1 / p.grd_y1: グラデ2中心X / Y
-- p.grd_rotate1      : グラデ2角度 / p.grd_width1 : グラデ2幅
-- p.grd_composite1   : グラデ2合成モード (1-13)
-- p.grd_reverse      : グラデーション効果を逆転 (0/1)
-- p.string_integrate0: グラデーションテキスト1枚化 (0/1)

-- 【07. 凸エッジ・縁取り共通】
-- p.edge             : 凸エッジ有効化 (0/1)
-- p.edge_width0      : 凸エッジ幅 / p.edge_height0 : 高さ / p.edge_angle0 : 角度
-- p.frame_size_common: 縁取り共通サイズ
-- p.frame_blur_common: 縁取り共通ぼかし

-- 【08. 縁取り詳細 (1〜3)】
-- p.frame0           : 縁取り1有効化 (0/1) / p.frame_col0 : 色 / p.frame_size0 : サイズ / p.frame_blur0 : ぼかし
-- p.frame1           : 縁取り2有効化 (0/1) / p.frame_col1 : 色 / p.frame_size1 : サイズ / p.frame_blur1 : ぼかし
-- p.frame2           : 縁取り3有効化 (0/1) / p.frame_col2 : 色 / p.frame_size2 : サイズ / p.frame_blur2 : ぼかし

-- 【09. 個別オブジェクト用縁取り範囲】
-- p.frame_s0 / p.frame_e0 : 縁取り1開始文字 / 終了文字 (1始まりのインデックス)
-- p.frame_s1 / p.frame_e1 : 縁取り2開始文字 / 終了文字 (1始まりのインデックス)
-- p.frame_s2 / p.frame_e2 : 縁取り3開始文字 / 終了文字 (1始まりのインデックス)
-- p.string_integrate1     : 縁取りテキスト1枚化 (0/1)

-- 【10. 影】
-- p.middle_shadow    : 文字に対して影を付与 (0/1)
-- p.behind_shadow    : 全体に対して影を付与 (0/1)
-- p.shadow_x0        : 影座標x
-- p.shadow_y0        : 影座標y
-- p.shadow_col0      : 影色 
-- p.shadow_deep0     : 影濃さ
-- p.shadow_diffusion0: 影拡散

-- 【11. ざぶとん】
-- p.background0      : ざぶとん1有効化 (0/1)
-- p.background_x0 / p.background_y0 : ざぶとんサイズX / Y
-- p.background_posx0 / p.background_posy0 : ざぶとん位置X / Y
-- p.background_alpha0: 透明度 / p.background_col0 : 色
-- p.background_frame0: 枠線サイズ / p.background_frame_blur0 : 枠線ぼかし
-- p.background_framecol0 : 枠線色
-- ============================================================

-- エフェクト例:effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", b.grd.w + p.grd_width0, "合成モード", p.grd_use_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", p.noCol1, "終了色", p.grde_col0, "no_color2", p.noCol2)

-- ============================================================
-- プログラムB：プリセット適用ロジック
-- ============================================================
function text_decoration_presets(p,b)

    local effect = obj.effect -- obj,effectはよく使うためeffect変数に代入している。
    
    --[[
    テーブル変数(b)の値
    b.grd.pow = 100 -- グラデーション強さ
    b.grd.w = 0 -- グラデーション中心x
    b.grd.y = 0 -- グラデーション中心y
    b.grd.r = 0 -- グラデーション角度
    b.grd.w = 100 -- グラデーション幅
    b.frame.size = 7 -- 縁取りサイズ 
    b.frame.blur = 5 -- 縁取りぼかし
    b.shadow.x = 10 -- 影X
    b.shadow.y = 10 -- 影Y
    b.shadow.deep = 70 -- 影濃さ
    b.shadow.diffsion = 15 -- 影拡散
    b.shapes.sizex = 100 -- ざぶとんサイズX
    b.shapes.sizey = 200 -- ざぶとんサイズY
    b.shapes.posx = 0 -- ざぶとん位置X
    b.shapes.posy = 0 -- ざぶとん位置Y 
    b.shapes.alpha = 0 -- ざぶとん透明度
    b.shapes.frames = 0 -- ざぶとん枠線サイズ
    b.shapes.frameb = 0 -- ざぶとん枠線ぼかし
]]

    -- プリセット番号 p.deco に基づく条件分岐
    -- 1: 装飾なし の場合は色だけ適用
    if(p.char_col0 ~= nil) then
        -- 文字色変更
        effect("単色化","強さ",100,"色",p.char_col0,"輝度を保持する",0)
    end

    -- 2: 縁取り1枠
    if( p.deco == 2 ) then
        -- 縁取り1
        effect("縁取り", "サイズ", b.frame.size + p.frame_size0 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)

    -- 3: 縁取り2枠
    elseif( p.deco == 3 ) then
        -- 縁取り1
        effect("縁取り", "サイズ", b.frame.size + p.frame_size0 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
        -- 縁取り2
        effect("縁取り", "サイズ", b.frame.size + p.frame_size1 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur1 + p.frame_blur_common, "縁色", p.frame_col1)

    -- 4: 縁取り2枠(2枠目文字色と連動)
    elseif( p.deco == 4 ) then
        if(p.char_col0 ~= nil) then
            -- 文字色変更(char_col0)
            effect("単色化","強さ",100,"色",p.char_col0,"輝度を保持する",0)
            -- 縁取り1
            effect("縁取り", "サイズ", b.frame.size + p.frame_size0 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
            -- 縁取り2(char_col0色と連動)
            effect("縁取り", "サイズ", b.frame.size + p.frame_size1 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur1 + p.frame_blur_common, "縁色", p.char_col0)
        else
            -- 文字色変更(frame_col1)
            effect("単色化","強さ",100,"色",p.frame_col1,"輝度を保持する",0)
            -- 縁取り1
            effect("縁取り", "サイズ", b.frame.size + p.frame_size0 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
            -- 縁取り2(frame_col1色と連動)
            effect("縁取り", "サイズ", b.frame.size + p.frame_size1 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur1 + p.frame_blur_common, "縁色", p.frame_col1)
        end

    -- 5: 縁取り3枠
    elseif( p.deco == 5 ) then
        -- 縁取り1
        effect("縁取り", "サイズ", b.frame.size + p.frame_size0 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
        -- 縁取り2
        effect("縁取り", "サイズ", b.frame.size + p.frame_size1 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur1 + p.frame_blur_common, "縁色", p.frame_col1)
        -- 縁取り3
        effect("縁取り", "サイズ", b.frame.size + p.frame_size2 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur2 + p.frame_blur_common, "縁色", p.frame_col2)

    -- 6: 縁取り3枠影あり
    elseif( p.deco == 6 ) then
        -- 縁取り1
        effect("縁取り", "サイズ", b.frame.size + p.frame_size0 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
        -- 縁取り2
        effect("縁取り", "サイズ", b.frame.size + p.frame_size1 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur1 + p.frame_blur_common, "縁色", p.frame_col1)
        -- 縁取り3
        effect("縁取り", "サイズ", b.frame.size + p.frame_size2 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur2 + p.frame_blur_common, "縁色", p.frame_col2)
        -- 影
        effect("ドロップシャドウ", "X", b.shadow.x + p.shadow_x0, "Y", b.shadow.y + p.shadow_y0, "濃さ", b.shadow.deep + p.shadow_deep0, "拡散", b.shadow.deep + p.shadow_diffusion0, "影色", p.shadow_col0, "影を別オブジェクトで描画", 0)

    -- 7: グラデ文字
    elseif( p.deco == 7 ) then
        -- グラデ1
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", b.grd.w + p.grd_width0, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", p.noCol1, "終了色", p.grde_col0, "no_color2", p.noCol2)

    -- 8: グラデ文字縁取り1枠
    elseif( p.deco == 8 ) then
        -- グラデ1
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", b.grd.w + p.grd_width0, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", p.noCol1, "終了色", p.grde_col0, "no_color2", p.noCol2)
        -- 縁取り1
        effect("縁取り", "サイズ", b.frame.size + p.frame_size0 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)

    -- 9: グラデ文字縁取り2枠
    elseif( p.deco == 9 ) then
        -- グラデ1
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", b.grd.w + p.grd_width0, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", p.noCol1, "終了色", p.grde_col0, "no_color2", p.noCol2)
        -- 縁取り1
        effect("縁取り", "サイズ", b.frame.size + p.frame_size0 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
        -- 縁取り2
        effect("縁取り", "サイズ", b.frame.size + p.frame_size1 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur1 + p.frame_blur_common, "縁色", p.frame_col1)


    -- 10: グラデ文字縁取り2枠(2枠目グラデ文字開始色と連動)影あり
    elseif( p.deco == 10 ) then
        -- グラデ1
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", b.grd.w + p.grd_width0, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", p.noCol1, "終了色", p.grde_col0, "no_color2", p.noCol2)
        if(p.grds_col0 ~= nil) then
            -- 縁取り1
            effect("縁取り", "サイズ", b.frame.size + p.frame_size0 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
            -- 縁取り2(p.grds_col0色と連動)
            effect("縁取り", "サイズ", b.frame.size + p.frame_size1 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur1 + p.frame_blur_common, "縁色", p.grds_col0)
        end
        -- 影
        effect("ドロップシャドウ", "X", b.shadow.x + p.shadow_x0, "Y", b.shadow.y + p.shadow_y0, "濃さ", b.shadow.deep + p.shadow_deep0, "拡散", b.shadow.deep + p.shadow_diffusion0, "影色", p.shadow_col0, "影を別オブジェクトで描画", 0)

    -- 11: グラデ文字縁取り3枠
    elseif( p.deco == 11 ) then
        -- グラデ1
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", b.grd.w + p.grd_width0, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", p.noCol1, "終了色", p.grde_col0, "no_color2", p.noCol2)
        -- 縁取り1
        effect("縁取り", "サイズ", b.frame.size + p.frame_size0 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
        -- 縁取り2
        effect("縁取り", "サイズ", b.frame.size + p.frame_size1 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur1 + p.frame_blur_common, "縁色", p.frame_col1)
        -- 縁取り3
        effect("縁取り", "サイズ", b.frame.size + p.frame_size2 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur2 + p.frame_blur_common, "縁色", p.frame_col2)

    -- 12: グラデ文字縁取り1枠影あり
    elseif( p.deco == 12 ) then
        -- グラデ1
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", b.grd.w + p.grd_width0, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", p.noCol1, "終了色", p.grde_col0, "no_color2", p.noCol2)
        -- 縁取り1
        effect("縁取り", "サイズ", b.frame.size + p.frame_size0 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
        -- 影
        effect("ドロップシャドウ", "X", b.shadow.x + p.shadow_x0, "Y", b.shadow.y + p.shadow_y0, "濃さ", b.shadow.deep + p.shadow_deep0, "拡散", b.shadow.deep + p.shadow_diffusion0, "影色", p.shadow_col0, "影を別オブジェクトで描画", 0)

    -- 13: グラデ文字縁取り2枠影あり
    elseif( p.deco == 13 ) then
        -- グラデ1
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", b.grd.w + p.grd_width0, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", p.noCol1, "終了色", p.grde_col0, "no_color2", p.noCol2)
        -- 縁取り1
        effect("縁取り", "サイズ", b.frame.size + p.frame_size0 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
        -- 縁取り2
        effect("縁取り", "サイズ", b.frame.size + p.frame_size1 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur1 + p.frame_blur_common, "縁色", p.frame_col1)
        -- 影
        effect("ドロップシャドウ", "X", b.shadow.x + p.shadow_x0, "Y", b.shadow.y + p.shadow_y0, "濃さ", b.shadow.deep + p.shadow_deep0, "拡散", b.shadow.deep + p.shadow_diffusion0, "影色", p.shadow_col0, "影を別オブジェクトで描画", 0)


    -- 14: グラデ文字縁取り2枠(2枠目色連動)影あり
    elseif( p.deco == 14 ) then
        -- グラデ1
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", b.grd.w + p.grd_width0, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", p.noCol1, "終了色", p.grde_col0, "no_color2", p.noCol2)
        if(p.grds_col0 ~= nil) then
            -- 縁取り1
            effect("縁取り", "サイズ", b.frame.size + p.frame_size0 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
            -- 縁取り2(p.grds_col0色と連動)
            effect("縁取り", "サイズ", b.frame.size + p.frame_size1 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur1 + p.frame_blur_common, "縁色", p.grds_col0)
        end
        -- 影
        effect("ドロップシャドウ", "X", b.shadow.x + p.shadow_x0, "Y", b.shadow.y + p.shadow_y0, "濃さ", b.shadow.deep + p.shadow_deep0, "拡散", b.shadow.deep + p.shadow_diffusion0, "影色", p.shadow_col0, "影を別オブジェクトで描画", 0)

    -- 15: グラデ文字縁取り3枠影あり
    elseif( p.deco == 15 ) then
        -- グラデ1
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", b.grd.w + p.grd_width0, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", p.noCol1, "終了色", p.grde_col0, "no_color2", p.noCol2)
        -- 縁取り1
        effect("縁取り", "サイズ", b.frame.size + p.frame_size0 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
        -- 縁取り2
        effect("縁取り", "サイズ", b.frame.size + p.frame_size1 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur1 + p.frame_blur_common, "縁色", p.frame_col1)
        -- 縁取り3
        effect("縁取り", "サイズ", b.frame.size + p.frame_size2 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur2 + p.frame_blur_common, "縁色", p.frame_col2)
        -- 影
        effect("ドロップシャドウ", "X", b.shadow.x + p.shadow_x0, "Y", b.shadow.y + p.shadow_y0, "濃さ", b.shadow.deep + p.shadow_deep0, "拡散", b.shadow.deep + p.shadow_diffusion0, "影色", p.shadow_col0, "影を別オブジェクトで描画", 0)
    end

    require("zabuton_shapes") -- ここで座布団処理用の.luaを呼び出す。

    -- 16: ざぶとん
    if( p.deco == 16 ) then
        -- ざぶとん
        zabuton_shapes(b,p)

    -- 17: ざぶとん縁取り1枠
    elseif( p.deco == 17 ) then
        -- 縁取り1
        effect("縁取り", "サイズ", b.frame.size + p.frame_size0 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
        -- ざぶとん
        zabuton_shapes(b,p)

    -- 18: ざぶとん縁取り2枠
    elseif( p.deco == 18 ) then
        -- 縁取り1
        effect("縁取り", "サイズ", b.frame.size + p.frame_size0 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
        -- 縁取り2
        effect("縁取り", "サイズ", b.frame.size + p.frame_size1 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur1 + p.frame_blur_common, "縁色", p.frame_col1)
        -- ざぶとん
        zabuton_shapes(b,p)

    -- 19: ざぶとん縁取り2枠(2枠目枠色連動)
    elseif( p.deco == 19 ) then
        if(p.char_col0 ~= nil) then
            -- 文字色変更(char_col0)
            effect("単色化","強さ",100,"色",p.char_col0,"輝度を保持する",0)
            -- 縁取り1
            effect("縁取り", "サイズ", b.frame.size + p.frame_size0 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
            -- 縁取り2(char_col0色と連動)
            effect("縁取り", "サイズ", b.frame.size + p.frame_size1 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur1 + p.frame_blur_common, "縁色", p.char_col0)
        else
            -- 文字色変更(frame_col1)
            effect("単色化","強さ",100,"色",p.frame_col1,"輝度を保持する",0)
            -- 縁取り1
            effect("縁取り", "サイズ", b.frame.size + p.frame_size0 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
            -- 縁取り2(frame_col1色と連動)
            effect("縁取り", "サイズ", b.frame.size + p.frame_size1 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur1 + p.frame_blur_common, "縁色", p.frame_col1)
        end
        -- ざぶとん
        zabuton_shapes(b,p)

    -- 20: ざぶとん縁取り3枠
    elseif( p.deco == 20 ) then
        -- 縁取り1
        effect("縁取り", "サイズ", b.frame.size + p.frame_size0 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
        -- 縁取り2
        effect("縁取り", "サイズ", b.frame.size + p.frame_size1 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur1 + p.frame_blur_common, "縁色", p.frame_col1)
        -- 縁取り3
        effect("縁取り", "サイズ", b.frame.size + p.frame_size2 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur2 + p.frame_blur_common, "縁色", p.frame_col2)
        -- ざぶとん
        zabuton_shapes(b,p)

    -- 21: ざぶとんグラデ文字
    elseif( p.deco == 21 ) then
        -- グラデ1
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", b.grd.w + p.grd_width0, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", p.noCol1, "終了色", p.grde_col0, "no_color2", p.noCol2)
        -- ざぶとん
        zabuton_shapes(b,p)

    -- 22: ざぶとんグラデ文字縁取り1枠
    elseif( p.deco == 22 ) then
        -- グラデ1
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", b.grd.w + p.grd_width0, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", p.noCol1, "終了色", p.grde_col0, "no_color2", p.noCol2)
        -- 縁取り1
        effect("縁取り", "サイズ", b.frame.size + p.frame_size0 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
        -- ざぶとん
        zabuton_shapes(b,p)

    -- 23: ざぶとんグラデ文字縁取り2枠
    elseif( p.deco == 23 ) then
        -- グラデ1
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", b.grd.w + p.grd_width0, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", p.noCol1, "終了色", p.grde_col0, "no_color2", p.noCol2)
        -- 縁取り1
        effect("縁取り", "サイズ", b.frame.size + p.frame_size0 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
        -- 縁取り2
        effect("縁取り", "サイズ", b.frame.size + p.frame_size1 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur1 + p.frame_blur_common, "縁色", p.frame_col1)
        -- ざぶとん
        zabuton_shapes(b,p)

    -- 24: ざぶとんグラデ文字縁取り2枠(2枠目色連動)
    elseif( p.deco == 24 ) then
        -- グラデ1
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", b.grd.w + p.grd_width0, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", p.noCol1, "終了色", p.grde_col0, "no_color2", p.noCol2)
        if(p.grds_col0 ~= nil) then
            -- 縁取り1
            effect("縁取り", "サイズ", b.frame.size + p.frame_size0 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
            -- 縁取り2(p.grds_col0色と連動)
            effect("縁取り", "サイズ", b.frame.size + p.frame_size1 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur1 + p.frame_blur_common, "縁色", p.grds_col0)
        end
        -- ざぶとん
        zabuton_shapes(b,p)

    -- 25: ざぶとんグラデ文字縁取り3枠
    elseif( p.deco == 25 ) then
        -- グラデ1
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", b.grd.w + p.grd_width0, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", p.noCol1, "終了色", p.grde_col0, "no_color2", p.noCol2)
        -- 縁取り1
        effect("縁取り", "サイズ", b.frame.size + p.frame_size0 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
        -- 縁取り2
        effect("縁取り", "サイズ", b.frame.size + p.frame_size1 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur1 + p.frame_blur_common, "縁色", p.frame_col1)
        -- 縁取り3
        effect("縁取り", "サイズ", b.frame.size + p.frame_size2 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur2 + p.frame_blur_common, "縁色", p.frame_col2)
        -- ざぶとん
        zabuton_shapes(b,p)

    -- 26: ざぶとん影あり
    elseif( p.deco == 26 ) then
        -- ざぶとん
        zabuton_shapes(b,p)
        -- 影
        effect("ドロップシャドウ", "X", b.shadow.x + p.shadow_x0, "Y", b.shadow.y + p.shadow_y0, "濃さ", b.shadow.deep + p.shadow_deep0, "拡散", b.shadow.deep + p.shadow_diffusion0, "影色", p.shadow_col0, "影を別オブジェクトで描画", 0)

    -- 27: ざぶとんグラデ文字影あり
    elseif( p.deco == 27 ) then
        -- グラデ1
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", b.grd.w + p.grd_width0, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", p.noCol1, "終了色", p.grde_col0, "no_color2", p.noCol2)
        -- ざぶとん
        zabuton_shapes(b,p)
        -- 影
        effect("ドロップシャドウ", "X", b.shadow.x + p.shadow_x0, "Y", b.shadow.y + p.shadow_y0, "濃さ", b.shadow.deep + p.shadow_deep0, "拡散", b.shadow.deep + p.shadow_diffusion0, "影色", p.shadow_col0, "影を別オブジェクトで描画", 0)

    -- 28: ざぶとんグラデ文字縁取り1枠影あり
    elseif( p.deco == 28 ) then
        -- グラデ1
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", b.grd.w + p.grd_width0, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", p.noCol1, "終了色", p.grde_col0, "no_color2", p.noCol2)
        -- 縁取り1
        effect("縁取り", "サイズ", b.frame.size + p.frame_size0 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
        -- ざぶとん
        zabuton_shapes(b,p)
        -- 影
        effect("ドロップシャドウ", "X", b.shadow.x + p.shadow_x0, "Y", b.shadow.y + p.shadow_y0, "濃さ", b.shadow.deep + p.shadow_deep0, "拡散", b.shadow.deep + p.shadow_diffusion0, "影色", p.shadow_col0, "影を別オブジェクトで描画", 0)

    -- 29: ざぶとんグラデ文字縁取り2枠影あり
    elseif( p.deco == 29 ) then
        -- グラデ1
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", b.grd.w + p.grd_width0, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", p.noCol1, "終了色", p.grde_col0, "no_color2", p.noCol2)
        -- 縁取り1
        effect("縁取り", "サイズ", b.frame.size + p.frame_size0 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
        -- 縁取り2
        effect("縁取り", "サイズ", b.frame.size + p.frame_size1 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur1 + p.frame_blur_common, "縁色", p.frame_col1)
        -- ざぶとん
        zabuton_shapes(b,p)
        -- 影
        effect("ドロップシャドウ", "X", b.shadow.x + p.shadow_x0, "Y", b.shadow.y + p.shadow_y0, "濃さ", b.shadow.deep + p.shadow_deep0, "拡散", b.shadow.deep + p.shadow_diffusion0, "影色", p.shadow_col0, "影を別オブジェクトで描画", 0)

    -- 30: ざぶとんグラデ文字縁取り2枠(2枠目色連動)影あり
    elseif( p.deco == 30 ) then
        -- グラデ1
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", b.grd.w + p.grd_width0, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", p.noCol1, "終了色", p.grde_col0, "no_color2", p.noCol2)
        if(p.grds_col0 ~= nil) then
            -- 縁取り1
            effect("縁取り", "サイズ", b.frame.size + p.frame_size0 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
            -- 縁取り2(p.grds_col0色と連動)
            effect("縁取り", "サイズ", b.frame.size + p.frame_size1 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur1 + p.frame_blur_common, "縁色", p.grds_col0)
        end
        -- ざぶとん
        zabuton_shapes(b,p)
        -- 影
        effect("ドロップシャドウ", "X", b.shadow.x + p.shadow_x0, "Y", b.shadow.y + p.shadow_y0, "濃さ", b.shadow.deep + p.shadow_deep0, "拡散", b.shadow.deep + p.shadow_diffusion0, "影色", p.shadow_col0, "影を別オブジェクトで描画", 0)

    -- 31: ざぶとんグラデ文字縁取り3枠影あり
    elseif( p.deco == 31 ) then
        -- グラデ1
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", b.grd.w + p.grd_width0, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", p.noCol1, "終了色", p.grde_col0, "no_color2", p.noCol2)
        -- 縁取り1
        effect("縁取り", "サイズ", b.frame.size + p.frame_size0 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
        -- 縁取り2
        effect("縁取り", "サイズ", b.frame.size + p.frame_size1 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur1 + p.frame_blur_common, "縁色", p.frame_col1)
        -- 縁取り3
        effect("縁取り", "サイズ", b.frame.size + p.frame_size2 + p.frame_size_common, "ぼかし", b.frame.blur + p.frame_blur2 + p.frame_blur_common, "縁色", p.frame_col2)
        -- ざぶとん
        zabuton_shapes(b,p)
        -- 影
        effect("ドロップシャドウ", "X", b.shadow.x + p.shadow_x0, "Y", b.shadow.y + p.shadow_y0, "濃さ", b.shadow.deep + p.shadow_deep0, "拡散", b.shadow.deep + p.shadow_diffusion0, "影色", p.shadow_col0, "影を別オブジェクトで描画", 0)
    end
end