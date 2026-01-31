local M = {}

function M.zabuton_shapes(b, p)
    local effect = obj.effect

    -- 背景表示条件: チェックON または deco番号が11-20
    if (p.bg_enable ~= 0 or (p.deco >= 11 and p.deco <= 20)) then

        -- 1. 現在の装飾済みテキストを一時バッファに退避
        obj.copybuffer("cache:deco_text", "obj")

        local ow, oh = obj.getpixel()
        local zw, zh = ow * obj.sx, oh * obj.sy -- テキストの実表示サイズ
        
        -- 余白（add_w, add_h）の計算
        -- 縁取りや影の広がりを考慮してバッファサイズを拡張する
        local add_w, add_h = 0, 0
        
        -- 縁取りによる拡張（各枠ごとに50px加算の論理を継承）
        if (p.frame_enable1 ~= 0 or (p.deco >= 2 and p.deco <= 20 and p.deco % 5 ~= 1)) then
            add_w, add_h = add_w + 50, add_h + 50
        end
        if (p.frame_enable2 ~= 0 or (p.deco >= 3 and p.deco <= 20 and p.deco % 5 ~= 1 and p.deco % 5 ~= 2)) then
            add_w, add_h = add_w + 50, add_h + 50
        end
        if (p.frame_enable3 ~= 0 or (p.deco % 5 == 0 and p.deco ~= 0)) then
            add_w, add_h = add_w + 50, add_h + 50
        end

        -- 影・発光による拡張
        if (p.shadow_enale1 ~= 0) then
            add_w, add_h = add_w + 150, add_h + 50
        end
        if (p.shadow_enale3 ~= 0) then
            add_w, add_h = add_w + 50, add_h + 50
        end
        if (p.glow_enable ~= 0) then
            add_w, add_h = add_w * 2 + 200, add_h * 2
        end

        -- 背景自体のサイズと縁取り・ぼかし
        local sx, sy = b.shapes.sizex + p.bg_x, b.shapes.sizey + p.bg_y
        local px, py = b.shapes.posx + p.bg_posx, b.shapes.posy + p.bg_posy
        local b_edge = (b.shapes.frames + p.bg_frame_size + b.shapes.frameb + p.bg_frame_blur) * p.resize

        -- 最終的なバッファサイズの計算（16の倍数に切り上げ）
        local max_size = 4000
        local bw = math.min(max_size, math.ceil((math.max(zw, math.abs(px * 2) + sx) + b_edge + add_w) / 16) * 16)
        local bh = math.min(max_size, math.ceil((math.max(zh, math.abs(py * 2) + sy) + b_edge + add_h) / 16) * 16)

        -- 2. 背景描画用の一時バッファを作成
        obj.setoption("drawtarget", "tempbuffer", bw, bh)
        obj.clearbuffer("tempbuffer")

        -- 3. 背景図形（ざぶとん）の生成と描画
        obj.load("figure", "四角形", p.bg_col, 100) -- サイズはリサイズで制御するため初期値100
        effect("リサイズ", "拡大率", 100, "X", sx, "Y", sy)
        
        if (p.bg_frame_size> 0) then
            effect("縁取り", "サイズ", (b.shapes.frames + p.bg_frame_size) * p.resize, "ぼかし", b.shapes.frameb + p.bg_frame_blur, "縁色", p.bg_frame_col)
        end

        -- 透明度の計算（b.shapes.alphaは0-100、p.background_alpha0も0-100想定）
        local alpha = 1 - ((b.shapes.alpha + p.bg_alpha) / 100)
        obj.draw(px, py, 0, 1, math.max(0, math.min(1, alpha)))

        -- 4. 退避していたテキストを背景の上に重ねる
        obj.copybuffer("obj", "cache:deco_text")
        obj.draw(0, 0, 0, 1, 1)

        -- 5. 結果をメインバッファに戻す
        obj.setoption("drawtarget", "framebuffer")
        obj.copybuffer("obj", "tempbuffer")
    end
end

return M