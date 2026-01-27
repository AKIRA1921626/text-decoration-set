--[[
装飾セット.anm2などで使う用の.luaファイル。
プリセットを使用すためだけに使う。
使いまわしをする予定はないが、長くなると思ったので.luaファイルに分けた。
]]

-- ============================================================

-- ============================================================
-- 装飾セット.anm2から渡された params(p) の構造・値対応表
-- ============================================================

-- 【01. 装飾プリセット (params.deco / params.deco_presets)】
-- 1:装飾なし / 2:縁取り1枠 / 3:縁取り2枠 / 4:縁取り2枠(2枠目枠色連動) / 5:縁取り3枠
-- 6:グラデ文字 / 7:グラデ文字縁取り1枠 / 8:グラデ文字縁取り2枠
-- 9:グラデ文字縁取り2枠(2枠目枠色連動) / 10:グラデ文字縁取り3枠 / 11:ざぶとん
-- 12:ざぶとん縁取り1枠 / 13:ざぶとん縁取り2枠 / 14:ざぶとん縁取り2枠(2枠目枠色連動)
-- 15:ざぶとん縁取り3枠 / 16:ざぶとんグラデ文字 / 17:ざぶとんグラデ文字縁取り1枠
-- 18:ざぶとんグラデ文字縁取り2枠 / 19:ざぶとんグラデ文字縁取り2枠(2枠目枠色連動)
-- 20:ざぶとんグラデ文字縁取り3枠

-- 【02. グラデーション設定 (params.grd_type0, params.grd_type1)】
-- 1:線形 / 2:円形 / 3:矩形 / 4:凸形

-- 【03. 合成モード (params.grd_composite0, params.grd_composite1)】
-- 1:通常 / 2:加算 / 3:減算 / 4:乗算 / 5:スクリーン / 6:オーバーレイ
-- 7:比較(明) / 8:比較(暗) / 9:輝度 / 10:色差 / 11:陰影 / 12:明暗 / 13:差分

-- 【04. 基本設定】
-- p.deco             : 装飾プリセット選択値 (1始まりの番号)
-- p.char_col0        : 文字色 (nil または 0xRRGGBB)
-- p.base_reset       : 装飾のサイズをすべて0
-- p.resize           : 装飾のサイズをテキストのサイズと連動

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

-- エフェクト例:effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", b.grd.w + p.grd_width0, "合成モード", p.grd_use_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", p.noCol1, "終了色", p.grde_col0, "no_color2", p.noCol2)

-- ============================================================
-- プログラムC:ざぶとん描画
-- ============================================================
function zabuton_shapes(b,p)

    local effect = obj.effect

    --[[
-- 11: ざぶとん
    if( p.deco == 11 ) then
        -- ざぶとん
        

    -- 12: ざぶとん縁取り1枠
    elseif( p.deco == 12 ) then
        -- 縁取り1
        effect("縁取り", "サイズ", ( b.frame.size + p.frame_size0 + p.frame_size_common ) * p.resize, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
        -- ざぶとん
        

    -- 13: ざぶとん縁取り2枠
    elseif( p.deco == 13 ) then
        -- 縁取り1
        effect("縁取り", "サイズ", ( b.frame.size + p.frame_size0 + p.frame_size_common ) * p.resize, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
        -- 縁取り2
        effect("縁取り", "サイズ", ( b.frame.size + p.frame_size1 + p.frame_size_common ) * p.resize, "ぼかし", b.frame.blur + p.frame_blur1 + p.frame_blur_common, "縁色", p.frame_col1)
        -- ざぶとん
        

    -- 14: ざぶとん縁取り2枠(2枠目枠色連動)
    elseif( p.deco == 14 ) then
        local target_col = p.char_col0 or p.frame_col1
        -- 縁取り1
        effect("縁取り", "サイズ", ( b.frame.size + p.frame_size0 + p.frame_size_common ) * p.resize, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
        -- 縁取り2(枠色連動)
        effect("縁取り", "サイズ", ( b.frame.size + p.frame_size1 + p.frame_size_common ) * p.resize, "ぼかし", b.frame.blur + p.frame_blur1 + p.frame_blur_common, "縁色", target_col)
       -- ざぶとん
        

    -- 15: ざぶとん縁取り3枠
    elseif( p.deco == 15 ) then
        -- 縁取り1
        effect("縁取り", "サイズ", ( b.frame.size + p.frame_size0 + p.frame_size_common ) * p.resize, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
        -- 縁取り2
        effect("縁取り", "サイズ", ( b.frame.size + p.frame_size1 + p.frame_size_common ) * p.resize, "ぼかし", b.frame.blur + p.frame_blur1 + p.frame_blur_common, "縁色", p.frame_col1)
        -- 縁取り3
        effect("縁取り", "サイズ", ( b.frame.size + p.frame_size2 + p.frame_size_common ) * p.resize, "ぼかし", b.frame.blur + p.frame_blur2 + p.frame_blur_common, "縁色", p.frame_col2)
        -- ざぶとん
        

    -- 16: ざぶとんグラデ文字
    elseif( p.deco == 16 ) then
        -- グラデ1
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", ( b.grd.w + p.grd_width0 ) * p.resize, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", p.noCol1, "終了色", p.grde_col0, "no_color2", p.noCol2)
        -- ざぶとん
        

    -- 17: ざぶとんグラデ文字縁取り1枠
    elseif( p.deco == 17 ) then
        -- グラデ1
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", ( b.grd.w + p.grd_width0 ) * p.resize, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", p.noCol1, "終了色", p.grde_col0, "no_color2", p.noCol2)
        -- 縁取り1
        effect("縁取り", "サイズ", ( b.frame.size + p.frame_size0 + p.frame_size_common ) * p.resize, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
        -- ざぶとん
        

    -- 18: ざぶとんグラデ文字縁取り2枠
    elseif( p.deco == 18 ) then
        -- グラデ1
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", ( b.grd.w + p.grd_width0 ) * p.resize, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", p.noCol1, "終了色", p.grde_col0, "no_color2", p.noCol2)
        -- 縁取り1
        effect("縁取り", "サイズ", ( b.frame.size + p.frame_size0 + p.frame_size_common ) * p.resize, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
        -- 縁取り2
        effect("縁取り", "サイズ", ( b.frame.size + p.frame_size1 + p.frame_size_common ) * p.resize, "ぼかし", b.frame.blur + p.frame_blur1 + p.frame_blur_common, "縁色", p.frame_col1)
        -- ざぶとん
        

    -- 19: ざぶとんグラデ文字縁取り2枠(2枠目枠色連動)
    elseif( p.deco == 19 ) then
        -- グラデ1
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", ( b.grd.w + p.grd_width0 ) * p.resize, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", p.noCol1, "終了色", p.grde_col0, "no_color2", p.noCol2)
        if(p.grds_col0 ~= nil) then
            -- 縁取り1
            effect("縁取り", "サイズ", ( b.frame.size + p.frame_size0 + p.frame_size_common ) * p.resize, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
            -- 縁取り2(p.grds_col0色と連動)
            effect("縁取り", "サイズ", ( b.frame.size + p.frame_size1 + p.frame_size_common ) * p.resize, "ぼかし", b.frame.blur + p.frame_blur1 + p.frame_blur_common, "縁色", p.grds_col0)
            -- ざぶとん
            
        end
        

    -- 20: ざぶとんグラデ文字縁取り3枠
    elseif( p.deco == 20 ) then
        -- グラデ1
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", ( b.grd.w + p.grd_width0 ) * p.resize, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", p.noCol1, "終了色", p.grde_col0, "no_color2", p.noCol2)
        -- 縁取り1
        effect("縁取り", "サイズ", ( b.frame.size + p.frame_size0 + p.frame_size_common ) * p.resize, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
        -- 縁取り2
        effect("縁取り", "サイズ", ( b.frame.size + p.frame_size1 + p.frame_size_common ) * p.resize, "ぼかし", b.frame.blur + p.frame_blur1 + p.frame_blur_common, "縁色", p.frame_col1)
        -- 縁取り3
        effect("縁取り", "サイズ", ( b.frame.size + p.frame_size2 + p.frame_size_common ) * p.resize, "ぼかし", b.frame.blur + p.frame_blur2 + p.frame_blur_common, "縁色", p.frame_col2)
        -- ざぶとん
        
    end
    ]]

if(p.background0 ~= 0 or (p.deco >=11 and p.deco <= 20 ) ) then

    -- 1. 現在の装飾済みテキストを cache:deco_text に退避
    obj.copybuffer("cache:deco_text", "obj")

    --[[
    ざぶとんのテーブル変数(b)の値
    b.shapes.sizex = 100 -- ざぶとんサイズX
    b.shapes.sizey = 200 -- ざぶとんサイズY
    b.shapes.posx = 0 -- ざぶとん位置X
    b.shapes.posy = 0 -- ざぶとん位置Y 
    b.shapes.alpha = 0 -- ざぶとん透明度
    b.shapes.frames = 0 -- ざぶとん枠線サイズ
    b.shapes.frameb = 0 -- ざぶとん枠線ぼかし
    ]]

    --[[
    ざぶとんのテーブル変数(p)の値
    p.background0      : ざぶとん1有効化 (0/1)
    p.background_x0 / p.background_y0 : ざぶとんサイズX / Y
    p.background_posx0 / p.background_posy0 : ざぶとん位置X / Y
    p.background_alpha0: 透明度 / p.background_col0 : 色
    p.background_frame0: 枠線サイズ / p.background_frame_blur0 : 枠線ぼかし
    p.background_framecol0 : 枠線色
    p.resize : 装飾のサイズをテキストのサイズと連動
    ]]

    local ow,oh = obj.getpixel() -- obj.getpixeは引数を渡さなければ素の縦と横を戻りとして返す。
    local zw,zh = ow * obj.sx, oh * obj.sy -- 拡大率適用（szは2D描画に影響しないため除外）
    local sx,sy = b.shapes.sizex + p.background_x0,  b.shapes.sizey + p.background_y0
    local px,py = b.shapes.posx + p.background_posx0, b.shapes.posy + p.background_posy0
    local b_edge = b.shapes.frames + p.background_frame0 + b.shapes.frameb + p.background_frame_blur0 -- 縁とぼかしの幅
    local add_w ,add_h = 0,0
    if( p.frame0 ~= 0 or (p.deco >= 2 and p.deco <= 5) or (p.deco >= 7 and p.deco <= 10) or (p.deco >= 12 and p.deco <= 15) or (p.deco >= 17 and p.deco <= 20) )then
        add_w = add_w + 50
        add_h = add_h + 50
    end
    if( p.frame1 ~= 0 or (p.deco >= 3 and p.deco <= 5) or (p.deco >= 8 and p.deco <= 10) or (p.deco >= 13 and p.deco <= 15) or (p.deco >= 18 and p.deco <= 20) )then
        add_w = add_w + 50
        add_h = add_h + 50
    end
    if( p.frame2 ~= 0 or ( p.deco == 5 or p.deco == 10 or p.deco == 15 or p.deco == 20 ) )then
        add_w = add_w + 50
        add_h = add_h + 50
    end
    if( p.middle_shadow ~= 0 )then
        add_w = add_w + 150
        add_h = add_h + 50
    end
    if( p.behind_shadow ~= 0 )then
        add_w = add_w + 50
        add_h = add_h + 50
    end
    if( p.subtitle_glow ~= 0 )then
        add_w = add_w * 2 + 200
        add_h = add_h * 2
    end


    -- 必要な分だけのサイズを計算し、4000pxで制限（クランプ）
    local max_size = 4000
    local bw = math.min(max_size, math.ceil((math.max(zw, math.abs(px*2) + sx) + b_edge * p.resize + add_w ) / 16) * 16)
    local bh = math.min(max_size, math.ceil((math.max(zh, math.abs(py*2) + sy) + b_edge * p.resize + add_h ) / 16) * 16)

    -- 2. 一時バッファ(tempbuffer)をクリアし、背景を作成する
    obj.setoption("drawtarget", "tempbuffer", bw, bh)
    obj.clearbuffer("tempbuffer") -- バッファを一旦透明にする

    -- 3. 四角形をロードしてバッファに描画
    obj.load("figure", "四角形", p.background_col0, zh)
    effect("リサイズ", "拡大率", 50, "X", b.shapes.sizex + p.background_x0 , "Y", b.shapes.sizey + p.background_y0 )
    if(p.background_frame0 > 0) then
        effect("縁取り", "サイズ", ( b.shapes.frames + p.background_frame0 ) * p.resize, "ぼかし", b.shapes.frameb + p.background_frame_blur0, "縁色", p.background_framecol0)
    end
    -- 一時バッファの中央（または指定位置）に背景を描画
    obj.draw(b.shapes.posx + p.background_posx0, b.shapes.posy + p.background_posy0, 0, 1,math.max(0, 1 - (b.shapes.alpha + p.background_alpha0 / 100)))

    -- 4. 退避していたテキストを背景の上に描画する
    -- 描画ターゲットが tempbuffer のまま、cache からテクスチャをロードして draw する
    obj.copybuffer("obj", "cache:deco_text")
    obj.draw(0, 0, 0, 1, 1) -- テキストを座標(0,0)に重ねる

    -- 5. 完成した「背景+テキスト」をメインの描画領域に戻す
    obj.setoption("drawtarget", "framebuffer") -- ターゲットを戻す
    obj.copybuffer("obj", "tempbuffer") -- tempbuffer の内容を現在の obj にコピー
    end  
end