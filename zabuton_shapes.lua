--[[
装飾セット.anm2などで使う用の.luaファイル。
プリセットを使用すためだけに使う。
使いまわしをする予定はないが、長くなると思ったので.luaファイルに分けた。
]]

-- ============================================================

-- エフェクト例:effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", b.grd.w + p.grd_width0, "合成モード", p.grd_use_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", p.noCol1, "終了色", p.grde_col0, "no_color2", p.noCol2)

-- ============================================================
-- プログラムC:ざぶとん描画
-- ============================================================
function zabuton_shapes(b,p)

    local effect = obj.effect

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
    ]]

    local ow,oh = obj.getpixel() -- obj.getpixeは引数を渡さなければ素の縦と横を戻りとして返す。
    local zw,zh = ow * obj.sx, oh * obj.sy -- 拡大率適用（szは2D描画に影響しないため除外）
    local sx,sy = b.shapes.sizex + p.background_x0,  b.shapes.sizey + p.background_y0
    local px,py = b.shapes.posx + p.background_posx0, b.shapes.posy + p.background_posy0
    local b_edge = b.shapes.frames + p.background_frame0 + b.shapes.frameb + p.background_frame_blur0 -- 縁とぼかしの幅
    
    -- 必要な分だけのサイズを計算し、4000pxで制限（クランプ）
    local max_size = 4000
    local bw = math.min(max_size, math.ceil((math.max(zw, math.abs(px*2) + sx) + b_edge * 2 + 400) / 16) * 16)
    local bh = math.min(max_size, math.ceil((math.max(zh, math.abs(py*2) + sy) + b_edge * 2 + 400) / 16) * 16)

    -- 2. 一時バッファ(tempbuffer)をクリアし、背景を作成する
    obj.setoption("drawtarget", "tempbuffer", bw, bh)
    obj.clearbuffer("tempbuffer") -- バッファを一旦透明にする

    -- 3. 四角形をロードしてバッファに描画
    obj.load("figure", "四角形", p.background_col0, zh)
    effect("リサイズ", "拡大率", 50, "X", b.shapes.sizex + p.background_x0, "Y", b.shapes.sizey + p.background_y0)
    if(p.background_frame0 > 0) then
        effect("縁取り", "サイズ", b.shapes.frames + p.background_frame0, "ぼかし", b.shapes.frameb + p.background_frame_blur0, "縁色", p.background_framecol0)
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