--[[
装飾セット.anm2などで使う用の.luaファイル。
プリセットを使用すためだけに使う。
使いまわしをする予定はないが、長くなると思ったので.luaファイルに分けた。
]]

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

-- 凸エッジ描画用の内部関数
    local function apply_edge(target_order)
        if (p.edge ~= 0 and p.edge_order == target_order) then
            effect("凸エッジ", "幅", p.edge_width0, "高さ", p.edge_height0, "角度", p.edge_angle0)
        end
    end

    -- 影描画1の描画タイミング用の内部関数
    local function apply_shadow(target_order)
        if (p.middle_shadow ~= 0 and p.shadow1_order == target_order) then
            effect("ドロップシャドウ", "X",( b.shadow1.x + p.shadow_x0 ) * p.resize, "Y", ( b.shadow1.y + p.shadow_y0 ) * p.resize, "濃さ", b.shadow1.deep + p.shadow_deep0, "拡散", b.shadow1.diffsion  + p.shadow_diffusion0, "影色", p.shadow_col0, "影を別オブジェクトで描画", 0)
        end
    end

--　色変更処理
local is_multi = obj.getoption("multi_object")
local idx = obj.index + 1

-- 1. まずベースとなる色（全体または指定範囲0）を適用
if (p.char_col0 ~= nil) then
    if (not is_multi) then
        -- 個別オブジェクト無効時は無条件で適用
        effect("単色化", "強さ", 100, "色", p.char_col0, "輝度を保持する", 0)
    elseif (idx >= p.char_s0 and idx <= p.char_e0) then
        -- 個別有効時は範囲内のみ適用
        effect("単色化", "強さ", 100, "色", p.char_col0, "輝度を保持する", 0)
    end
end

-- 2. 個別オブジェクト有効時のみ、追加の範囲で上書き判定を行う
if (is_multi) then
    -- 色1で上書き（範囲が重なればこちらが優先される）
    if (p.char_col1 ~= nil and idx >= p.char_s1 and idx <= p.char_e1) then
        effect("単色化", "強さ", 100, "色", p.char_col1, "輝度を保持する", 0)
    end

    -- 色2で上書き（さらに範囲が重なればこちらが最終結果になる）
    if (p.char_col2 ~= nil and idx >= p.char_s2 and idx <= p.char_e2) then
        effect("単色化", "強さ", 100, "色", p.char_col2, "輝度を保持する", 0)
    end
end

    -- グラデーションの判定フラグの初期化（全体・個別に共通して使用するスコープ）
    local isInGradationRange = false
    local isInGradationRange1 = false
    local isInGradationRange2 = false

    if (obj.num == 1) then -- オブジェクトが全体の時のグラデーション判定
    -- 全体オブジェクト時は常に全範囲を真とする
        isInGradationRange = true
        isInGradationRange1 = false
        isInGradationRange2 = false
  else -- オブジェクトが個別の時
    -- 個別オブジェクト時はインデックスに基づいて判定
    local idx = obj.index + 1
    isInGradationRange1 = ( -- グラデ1の範囲
        (p.grd_s0 <= idx and p.grd_e0 >= idx)
    )
    isInGradationRange2 = ( -- グラデ2
        (p.grd_s1 <= idx and p.grd_e1 >= idx)
    )
end

-- 3.で使う変数を宣言。
local applyGrd = false
local applyGrd1 = false
local applyGrd2 = false

-- 3. グラデーション適用ロジックの確定
if( p.grd_reverse ~= 0 ) then -- 「効果を反転」がONかOFFかで代入する値を変える。
    applyGrd1 = isInGradationRange2 -- 「効果を反転」がONなら1に2の値を代入。
    applyGrd2 = isInGradationRange1 -- 「効果を反転」がONなら2に1の値を代入。
    applyGrd = isInGradationRange -- 「効果を反転」のON/OFFにかかわらずapplyGrdにはisInGradationRangeを代入。
else
    applyGrd1 = isInGradationRange1 -- 「効果を反転」がOFFなら1に1の値を代入。
    applyGrd2 = isInGradationRange2 -- 「効果を反転」がOFFなら2に2の値を代入。
    applyGrd = isInGradationRange -- 「効果を反転」のON/OFFにかかわらずapplyGrdにはisInGradationRangeを代入。
end


-- グラデの色が未指定の時に入れる値
local noCol1 = (p.grds_col0 == nil) and 1 or 0
local noCol2 = (p.grde_col0 == nil) and 1 or 0
local noCol3 = (p.grds_col1 == nil) and 1 or 0
local noCol4 = (p.grde_col1 == nil) and 1 or 0

-- 実際に(4)で使用する変数。"grd_composite"で、grd_use_composite[]配列の値を指定する。
local grd_use_composite0 = {"通常","加算","減算","乗算","スクリーン","オーバーレイ","比較(明)","比較(暗)","輝度","色差","陰影","明暗","差分"}
local grd_use_composite1 = {"通常","加算","減算","乗算","スクリーン","オーバーレイ","比較(明)","比較(暗)","輝度","色差","陰影","明暗","差分"}

if (applyGrd and obj.num == 1) then -- 個別オブジェクトがOFFの時、applyGrdは「効果を反転」のON/OFFにかかわらずtrueが代入される。
    -- 共通グラデーション判定　個別オブジェクトがOFFの時であり、グラデ2のチェックがONであり、decoが (1-5, 11-15番用)の時、そこにグラデ2を適用。
    if (p.grd_1 ~= 0 and not is_multi and ( (p.deco >= 0 and p.deco <= 5) or (p.deco >= 11 and p.deco <= 15) )) then
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow1, "中心X", b.grd.x + p.grd_x1, "中心Y", b.grd.y + p.grd_y1, "角度", b.grd.r + p.grd_rotate1, "幅", ( b.grd.w + p.grd_width1 ) * p.resize, "合成モード", p.grd_composite1,"形状", p.grd_type1, "開始色", p.grds_col1, "no_color", noCol3, "終了色", p.grde_col1, "no_color2", noCol4)
    -- 個別オブジェクトがOFFの時であり、グラデ1のチェックがONであり、decoが (1-5, 11-15番用)の時、そこにグラデ1を適用。
    elseif (p.grd_0 ~= 0 and ( (p.deco >= 0 and p.deco <= 5) or (p.deco >= 11 and p.deco <= 15) )) then
        if (not is_multi) then -- 条件整理
             effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", ( b.grd.w + p.grd_width0 ) * p.resize, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", noCol1, "終了色", p.grde_col0, "no_color2", noCol2)
        end
    end
    -- 16-20番用の強制グラデーション。個別オブジェクトがOFFであり、チェックの有無に関わらず、decoが16-20の時、そこにグラデ1を適用。
    if (p.deco >= 16 and p.deco <= 20) then
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", ( b.grd.w + p.grd_width0 ) * p.resize, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", noCol1, "終了色", p.grde_col0, "no_color2", noCol2)
    -- 個別オブジェクトがOFFであり、チェックの有無に関わらず、decoが6-10の時、そこにグラデ1を適用。
    elseif (p.deco >= 6 and p.deco <= 10) then 
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", ( b.grd.w + p.grd_width0 ) * p.resize, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", noCol1, "終了色", p.grde_col0, "no_color2", noCol2)
    end
end

if (applyGrd1 and obj.num ~= 1) then -- 個別オブジェクトがONの時。-- 個別オブジェクトがONの時、applyGrd1はisInGradationRange1が代入される。「効果を反転」のチェックでisInGradationRange2となる。
    -- 共通グラデーション判定 (1-5, 11-15番用) 個別オブジェクトがONの時であり、グラデ1のチェックがONであり、decoが (1-5, 11-15番用)
    if (p.grd_0 ~= 0 and ( (p.deco >= 0 and p.deco <= 5) or (p.deco >= 11 and p.deco <= 15) )) then
        if (is_multi) then -- 条件整理
             effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", ( b.grd.w + p.grd_width0 ) * p.resize, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", noCol1, "終了色", p.grde_col0, "no_color2", noCol2)
        end
    end

    -- 16-20番用の強制グラデーション 個別オブジェクトがONであり、チェックの有無に関わらず、decoが16-20の時、そこにグラデ1を適用。
    if (p.deco >= 16 and p.deco <= 20) then
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", ( b.grd.w + p.grd_width0 ) * p.resize, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", noCol1, "終了色", p.grde_col0, "no_color2", noCol2)
    -- 個別オブジェクトがONであり、チェックの有無に関わらず、decoが6-10の時、そこにグラデ1を適用。
    elseif (p.deco >= 6 and p.deco <= 10) then
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", ( b.grd.w + p.grd_width0 ) * p.resize, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", noCol1, "終了色", p.grde_col0, "no_color2", noCol2)
    end
end

if (applyGrd2 and obj.num ~= 1) then -- 個別オブジェクトがONの時。-- 個別オブジェクトがONの時、applyGrd2はisInGradationRange2が代入される。「効果を反転」のチェックでisInGradationRange1となる。
    -- 共通グラデーション判定 (1-5, 11-15番用) 個別オブジェクトがONの時であり、グラデ2のチェックがONであり、decoが (1-5, 11-15番用)の時、そこにグラデ2を適用。
    if (p.grd_1 ~= 0 and ( (p.deco >= 0 and p.deco <= 5) or (p.deco >= 11 and p.deco <= 15) )) then
        if (is_multi) then -- 条件整理
             effect("グラデーション", "強さ", b.grd.pow + p.grd_pow1, "中心X", b.grd.x + p.grd_x1, "中心Y", b.grd.y + p.grd_y1, "角度", b.grd.r + p.grd_rotate1, "幅", ( b.grd.w + p.grd_width1 ) * p.resize, "合成モード", p.grd_composite1,"形状", p.grd_type1, "開始色", p.grds_col1, "no_color", noCol1, "終了色", p.grde_col1, "no_color2", noCol2)
        end
    end

    -- 16-20番用の強制グラデーション 個別オブジェクトがONであり、チェックの有無に関わらず、decoが16-20の時、そこにグラデ1を適用。
    if (p.deco >= 16 and p.deco <= 20) then
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", ( b.grd.w + p.grd_width0 ) * p.resize, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", noCol1, "終了色", p.grde_col0, "no_color2", noCol2)
    -- 個別オブジェクトがONであり、チェックの有無に関わらず、decoが6-10の時、そこにグラデ1を適用。
    elseif (p.deco >= 6 and p.deco <= 10) then
        effect("グラデーション", "強さ", b.grd.pow + p.grd_pow0, "中心X", b.grd.x + p.grd_x0, "中心Y", b.grd.y + p.grd_y0, "角度", b.grd.r + p.grd_rotate0, "幅", ( b.grd.w + p.grd_width0 ) * p.resize, "合成モード", p.grd_composite0,"形状", p.grd_type0, "開始色", p.grds_col0, "no_color", noCol1, "終了色", p.grde_col0, "no_color2", noCol2)
    end
end

    -- 【タイミング1】文字（色付け）の直後
    if(p.edge_order == 1) then
        apply_edge(1)
    end

    if(p.shadow1_order == 1) then
        apply_shadow(1)
    end

    -- 【2】各プリセットの縁取り処理
    -- 縁取り1枠目
    if ( (p.deco >= 2 and p.deco <= 5) or (p.deco >= 7 and p.deco <= 10) or (p.deco >= 12 and p.deco <= 15) or (p.deco >= 17 and p.deco <= 20) ) then
        effect("縁取り", "サイズ", ( b.frame.size + p.frame_size0 + p.frame_size_common ) * p.resize, "ぼかし", b.frame.blur + p.frame_blur0 + p.frame_blur_common, "縁色", p.frame_col0)
        if(p.edge_order == 2) then
            apply_edge(2) -- 【タイミング2】縁取り1の後
            apply_shadow(2)
        end
        if(p.shadow1_order == 2) then
            apply_shadow(2)
        end
    end

    -- 縁取り2枠目
    if ( (p.deco >= 3 and p.deco <= 5) or (p.deco >= 8 and p.deco <= 10) or (p.deco >= 13 and p.deco <= 15) or (p.deco >= 18 and p.deco <= 20) ) then
        local f_col1 = p.frame_col1
        -- 色連動判定 (4, 9, 14, 19番)
        if (p.deco == 4 or p.deco == 9 or p.deco == 14 or p.deco == 19) then
            f_col1 = p.char_col0 or p.grds_col0 or 0xffffff
        end
        effect("縁取り", "サイズ", ( b.frame.size + p.frame_size1 + p.frame_size_common ) * p.resize, "ぼかし", b.frame.blur + p.frame_blur1 + p.frame_blur_common, "縁色", f_col1)
        if(p.edge_order == 3) then
            apply_edge(3) -- 【タイミング3】縁取り2の後
        end
        if(p.shadow1_order == 3) then
            apply_shadow(3)
        end
    end

    -- 縁取り3枠目
    if ( p.deco == 5 or p.deco == 10 or p.deco == 15 or p.deco == 20 ) then
        effect("縁取り", "サイズ", ( b.frame.size + p.frame_size2 + p.frame_size_common ) * p.resize, "ぼかし", b.frame.blur + p.frame_blur2 + p.frame_blur_common, "縁色", p.frame_col2)
        if(p.edge_order == 4) then
            apply_edge(4) -- 【タイミング4】縁取り3の後
        end
        if(p.shadow1_order == 4) then
            apply_shadow(4)
        end
    end
end