import XMonad
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)

main = do
  xmonad $ defaultConfig
    { borderWidth = 1
    , normalBorderColor = "#6699FF"
    , focusedBorderColor = "#66FF99"
    } `additionalKeys`
    [ ((mod4Mask, xK_l), spawn "xscreensaver-command -lock")
    , ((0, xK_Print), spawn "scrot")
    ]
