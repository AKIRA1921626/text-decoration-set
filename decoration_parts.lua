local M = {}

-- 関数名: draw_underline
-- 役割: 指定されたパラメータに基づき、テキストの下にアンダーラインを描画する
function M.draw_underline(params, b, resize)
    -- underline0 が 0（オフ）なら何もしない
    if (params.underline_enable == 0) then return end

    local resize = resize or 1
    
    -- 1. 現在のオブジェクト（装飾済みテキスト）を退避
    obj.copybuffer("cache:underline_text_tmp", "obj")

    -- 2. 描画ターゲットを一時バッファに変更
    -- 安全のため画面サイズで初期化
    obj.setoption("drawtarget", "tempbuffer", obj.screen_w, obj.screen_h)
    obj.clearbuffer("tempbuffer")

    -- 3. アンダーライン（図形）の描画
    obj.load("figure", "四角形", params.underline_col or 0xffffff, 100)
    
    -- サイズと位置の計算
    local line_w = b.underline.underline_x + params.underline_x
    local line_h = b.underline.underline_y + params.underline_y
    local pos_x  = (b.underline.underline_posx + params.underline_posx) * resize
    local pos_y  = (b.underline.underline_posy + params.underline_posy) * resize
    
    -- 透明度の計算 (0.0 - 1.0)
    local alpha = 1 - ((b.underline.underline_alpha + (params.underline_alpha or 0)) / 100)
    alpha = math.max(0, math.min(1, alpha))

    -- 図形のリサイズと描画
    obj.effect("リサイズ", "拡大率", 100, "X", line_w, "Y", line_h)
    obj.draw(pos_x, pos_y, 0, 1, alpha)

    -- 4. 影の適用（underline_shadow が ON の場合）
    if (params.shadow_enable2 ~= 0) then
        obj.effect("ドロップシャドウ", 
            "X", (b.shadow2.x + params.shadow_x2) * resize,
            "Y", (b.shadow2.y + params.shadow_y2) * resize,
            "濃さ", b.shadow2.deep + params.shadow_deep2,
            "拡散", b.shadow2.diffsion + params.shadow_diffusion2,
            "影色", params.shadow_col2,
            "影を別オブジェクトで描画", 1
        )
    end

    -- 5. テキストを上に重ねる
    obj.copybuffer("obj", "cache:underline_text_tmp")
    obj.draw(0, 0, 0, 1, 1)

    -- 6. 結果をメインバッファへ戻し、一時バッファを掃除
    obj.setoption("drawtarget", "framebuffer")
    --obj.load("tempbuffer")
    obj.copybuffer("obj", "tempbuffer")
    obj.clearbuffer("tempbuffer")
end

return M