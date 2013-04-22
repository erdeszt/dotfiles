import XMonad
import XMonad.Actions.Volume
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)

main = do
  xmonad $ defaultConfig
    { modMask = mod4Mask
    , borderWidth = 1
    , normalBorderColor = "#6699FF"
    , focusedBorderColor = "#66FF99"
    } `additionalKeys`
    [ ((mod4Mask .|. shiftMask, xK_l), spawn "xscreensaver-command -lock")
    , ((mod4Mask .|. shiftMask, xK_b), spawn "google-chrome")
    , ((mod4Mask .|. shiftMask, xK_e), spawn "subl")
    , ((mod4Mask, xK_F11), lowerVolume 4 >> return ())
    , ((mod4Mask, xK_F12), raiseVolume 4 >> return ())
    , ((0, xK_Print), spawn "scrot")
    ]
