--[[
装飾セット.anm2などで使う用の.luaファイル。
プリセットを使用すためだけに使う。
使いまわしをする予定はないが、長くなると思ったので.luaファイルに分けた。
]]

-- ============================================================
-- 装飾セット.anm2から渡された params(p) の構造・値対応表
-- ============================================================

-- 【01. 装飾プリセット (params.deco / params.deco_presets)】
-- 0:装飾なし / 1:縁取り1枠 / 2:縁取り2枠 / 3:縁取り2枠(2枠目色連動) / 4:縁取り3枠
-- 5:グラデ文字 / 6:グラデ文字縁取り1枠 / 7:グラデ文字縁取り2枠
-- 8:グラデ文字縁取り2枠(2枠目色連動)影あり / 9:縁取り3枠影あり
-- 10:グラデ文字縁取り1枠影あり / 11:グラデ文字縁取り2枠影あり
-- 12:グラデ文字縁取り2枠(2枠目色連動)影あり / 13:グラデ文字縁取り3枠影あり
-- 14:ざぶとん / 15:ざぶとん縁取り1枠 / 16:ざぶとん縁取り2枠
-- 17:ざぶとん縁取り2枠(2枠目枠色連動) / 18:ざぶとん縁取り3枠
-- 19:ざぶとんグラデ文字 / 20:ざぶとんグラデ文字縁取り1枠
-- 21:ざぶとんグラデ文字縁取り2枠 / 22:ざぶとんグラデ文字縁取り2枠(2枠目色連動)
-- 23:ざぶとんグラデ文字縁取り3枠 / 24:ざぶとん影あり / 25:ざぶとんグラデ文字影あり
-- 26:ざぶとんグラデ文字縁取り1枠影あり / 27:ざぶとんグラデ文字縁取り2枠影あり
-- 28:ざぶとんグラデ文字縁取り2枠(2枠目色連動)影あり / 29:ざぶとんグラデ文字縁取り3枠影あり

-- 【02. グラデーション設定 (params.grd_type0, params.grd_type1)】
-- 0:線形 / 1:円形 / 2:矩形 / 3:凸形

-- 【03. 合成モード (params.grd_composite0, params.grd_composite1)】
-- 1:通常 / 2:加算 / 3:減算 / 4:乗算 / 5:スクリーン / 6:オーバーレイ
-- 7:比較(明) / 8:比較(暗) / 9:輝度 / 10:色差 / 11:陰影 / 12:明暗 / 13:差分

-- 【04. 基本設定】
-- p.deco             : 装飾プリセット選択値 (番号)
-- p.char_col0        : 文字色 (nil または 0xRRGGBB)

-- 【05. グラデーション1 (メイン)】
-- p.grd_0            : グラデーション1有効化 (0/1)
-- p.grds_col0        : 開始色 / p.grde_col0 : 終了色
-- p.grd_type0        : タイプ (0-3) / p.grd_pow0 : 強さ (0-100)
-- p.grd_x0 / p.grd_y0: 中心座標X / Y
-- p.grd_rotate0      : 角度 / p.grd_width0 : 幅
-- p.grd_composite0   : 合成モード (1-13)

-- 【06. 個別オブジェクト用グラデーション (1&2)】
-- p.grd_s0 / p.grd_e0: グラデ1開始文字 / 終了文字 (インデックス)
-- p.grd_1            : グラデーション2有効化 (0/1)
-- p.grd_s1 / p.grd_e1: グラデ2開始文字 / 終了文字 (インデックス)
-- p.grds_col1        : グラデ2開始色 / p.grde_col1 : グラデ2終了色
-- p.grd_type1        : グラデ2タイプ (0-3) / p.grd_pow1 : グラデ2強さ (0-100)
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
-- p.frame_s0 / p.frame_e0 : 縁取り1開始文字 / 終了文字
-- p.frame_s1 / p.frame_e1 : 縁取り2開始文字 / 終了文字
-- p.frame_s2 / p.frame_e2 : 縁取り3開始文字 / 終了文字
-- p.string_integrate1     : 縁取りテキスト1枚化 (0/1)

-- 【10. 影】
-- p.middle_shadow    : 文字に対して影を付与 (0/1)
-- p.behind_shadow    : 全体に対して影を付与 (0/1)
-- p.shadow_col0      : 影色 / p.shadow_x0 / p.shadow_y0 : 影座標
-- p.shadow_deep0     : 影濃さ / p.shadow_diffusion0 : 影拡散

-- 【11. ざぶとん】
-- p.background0      : ざぶとん1有効化 (0/1)
-- p.background_x0 / p.background_y0 : ざぶとんサイズX / Y
-- p.background_posx0 / p.background_posy0 : ざぶとん位置X / Y
-- p.background_alpha0: 透明度 / p.background_col0 : 色
-- p.background_frame0: 枠線サイズ / p.background_frame_blur0 : 枠線ぼかし
-- p.background_framecol0 : 枠線色
-- ============================================================

function text_decoration_presets(p)

    local effect = obj.effect

    local various_settings= {
            effect("グラデーション", "強さ", grd_pow0, "中心X", grd_x0, "中心Y", grd_y0, "角度", grd_rotate0, "幅", grd_width0, "合成モード", grd_use_composite0[grd_composite0],"形状", grd_type0, "開始色", grds_col0, "no_color", noCol1, "終了色", grde_col0, "no_color2", noCol2)
            effect("")
            effect("")

    }

    local vs = various_settings


end