#Requires AutoHotkey v2.0
#SingleInstance Force
#UseHook true

; Insertキーの長押し制御（0.4秒以上で有効化）
SC152:: ; Insertキー
{
    if KeyWait("SC152", "T0.4") {
        ToolTip("Insertキーを有効にするには長押ししてください。")
    } else {
        Send("{Insert}")
        ToolTip("Insert Mode ON.")
    }
    SetTimer(() => ToolTip(), -2000)
    KeyWait("SC152")
}

; 無変換キー + vi風カーソル移動
SC07B & j::Send("{Blind}{Left}")
SC07B & k::Send("{Blind}{Down}")
SC07B & i::Send("{Blind}{Up}")
SC07B & l::Send("{Blind}{Right}")

SC07B & n::Send("{Blind}{Home}")
SC07B & m::Send("{Blind}{End}")
SC07B & ,::Send("{Blind}{PgUp}")
SC07B & .::Send("{Blind}{PgDn}")

; 無変換 + ファンクションキー割り当て
SC07B & 1::Run("explorer")
SC07B & 2::Send("{Blind}{F2}")
SC07B & 3::Send("{Blind}{F3}")
SC07B & 4::Send("{Blind}{F4}")
SC07B & 5::Send("{Blind}{F5}")
SC07B & 6::Send("{Blind}{F6}")
SC07B & 7::Send("{Blind}{F7}")
SC07B & 8::Send("{Blind}{F8}")
SC07B & 9::Send("{Blind}{F9}")
SC07B & 0::Send("{Blind}{F10}")
SC07B & -::Send("{Blind}{F11}")
SC07B & ^::Send("{Blind}{F12}")

; IME制御
SC07B::Send("{vkF3}") ; 無変換 → IMEオフ
SC079::Send("{vkF2}") ; 変換 → IMEオン

; Alt(SC038) + テンキー割り当て
SC038 & j::Send("{Numpad1}")
SC038 & k::Send("{Numpad2}")
SC038 & l::Send("{Numpad3}")
SC038 & u::Send("{Numpad4}")
SC038 & i::Send("{Numpad5}")
SC038 & o::Send("{Numpad6}")
SC038 & 7::Send("{Numpad7}")
SC038 & 8::Send("{Numpad8}")
SC038 & 9::Send("{Numpad9}")
SC038 & m::Send("{Numpad0}")
SC038 & n::Send("{NumpadDot}")
SC038 & h::Send("{NumpadEnter}")

; Altキー単独押しの無効化（テンキー割り当ての後に配置）
SC038::Return