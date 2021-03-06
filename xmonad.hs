import XMonad
import XMonad.Actions.CycleWS
import qualified XMonad.StackSet as W -- to shift and float windows
import qualified Data.Map as M
 
main = xmonad defaultConfig
    { manageHook = manageHook defaultConfig <+> myManageHook
    , terminal = "gnome-terminal"
    , borderWidth = 4
    , keys = newKeys
    }
 
myManageHook = composeAll . concat $
    [ [ className   =? c --> doFloat           | c <- myFloats]
    , [ title       =? t --> doFloat           | t <- myOtherFloats]
    , [ className   =? c --> doF (W.shift "2") | c <- webApps]
    , [ className   =? c --> doF (W.shift "3") | c <- ircApps]
    ]
  where myFloats      = ["MPlayer", "Gimp", "Plasma-desktop"]
        myOtherFloats = ["alsamixer"]
        webApps       = ["Firefox-bin", "Opera"] -- open on desktop 2
        ircApps       = ["Ksirc"]                -- open on desktop 3

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList
    [ ((modm .|. shiftMask, xK_l), nextWS)
    , ((modm .|. shiftMask, xK_h), prevWS)
    ]

newKeys x = myKeys x `M.union` keys defaultConfig x
