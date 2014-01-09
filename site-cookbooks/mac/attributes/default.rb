# -*- coding: utf-8 -*-
node.default["mac_os_x"]["settings"]["dock"] = {
  "domain" => "com.apple.dock",

  "autohide-delay" => 0,                 # Dockの表示・非表示の待ち時間をなくす
  "expose-animation-duration" => 0.12,   # Mission Controlのアニメーション速度変更 (0.12が最速)
  "tilesize" => 16,                      # Dockアイコンの通常表示サイズ
  "largesize" => 128,                    # Dockアイコンの拡大表示サイズ
  "orientation" => "right",               # Dockを左側に寄せる
  "autohide" => true,                    # Dockを自動的に隠す
  "mineffect" => "suck",                 # Dockにウィンドウをしまう時の隠しエフェクト
  "launchanim" => true,                  # 起動中のアプリをアニメーション表示
  "show-process-indicators" => true,     # 起動しているアプリにインジケータ・ランプ表示

  "showAppExposeGestureEnabled" => true, # 4本指スワイプでExpose

  "dashboard-in-overlay" => true,        # Dashboardを操作スペースとして表示しない
  "expose-group-by-app" => false,        # ウィンドウをアプリケーションごとにグループ化しない
  "mru-spaces" => false,                 # 操作スペースの自動並び替えをしない
}
