local M = {}

-- 関数名: draw_with_glow (グローを伴う描画)
function M.draw_with_glow(params, b, resize)
    local resize = resize or 1

    -- 1. 現在の状態を退避
    obj.copybuffer("cache:glow_text_tmp", "obj")
    
    -- 2. バッファサイズの計算
    local ow, oh = obj.getpixel()
    local total_diff = (b.glow.diffusion + params.glow_diffusion) * resize
    -- 拡散分を考慮してバッファを確保（16の倍数に切り上げ）
    local bw = math.ceil((ow + total_diff * 2) / 16) * 16
    local bh = math.ceil((oh + total_diff * 2) / 16) * 16
    
    -- 3. 描画ターゲットを仮想バッファに変更
    obj.setoption("drawtarget", "tempbuffer", bw, bh)
    obj.clearbuffer("tempbuffer")
    
    local glow_pow = (b.glow.pow + params.glow_pow) * resize
    local glow_blur = b.glow.blur + params.glow_blur
    
    obj.effect("グロー",
        "強さ", glow_pow,
        "拡散", total_diff,
        "ぼかし", glow_blur,
        "光色", params.glow_col or 0xffffff,
        "光成分のみ", 1,
        "形状", "通常"
    )

    -- 元のオブジェクトを、グローを"光成分のみ"とした状態で(背景として）、グローのみとなったものを中央に描画
    obj.draw()

    -- 前景（元のテキスト）の描画
    obj.copybuffer("obj", "cache:glow_text_tmp")
    obj.draw()
    
    -- 4. 描画さきをフレームバッファに戻す。
    obj.setoption("drawtarget", "framebuffer")
    
    -- 背景仮想バッファのロード
    --obj.load("tempbuffer")
    obj.copybuffer("obj", "tempbuffer")
    
    -- 後片付け
    obj.clearbuffer("tempbuffer")
end

return M