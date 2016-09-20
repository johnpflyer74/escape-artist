{-# LANGUAGE ExtendedDefaultRules, NoMonomorphismRestriction #-}

import Data.Monoid ((<>))
import Text.EscapeArtist
import Data.List (intersperse)
import Text.Regex

main = do
    putStrLn "Foreground Colors"
    putStrLn "================="
    putEscLn $ BgWhite $ Black   "Foreground sould be black"
    putEscLn $ BgWhite $ Red     "Foreground sould be red"
    putEscLn $ BgWhite $ Green   "Foreground sould be Green"
    putEscLn $ BgWhite $ Yellow  "Foreground sould be yellow"
    putEscLn $ BgWhite $ Blue    "Foreground sould be blue"
    putEscLn $ BgWhite $ Magenta "Foreground sould be magenta"
    putEscLn $ BgWhite $ Cyan    "Foreground sould be cyan"
    putEscLn $ BgBlack $ White   "Foreground sould be white"
    putStrLn ""
    putStrLn "Background Colors"
    putStrLn "================="
    putEscLn $ BgBlack   $ White "Background sould be black"
    putEscLn $ BgRed     $ Black "Background sould be red"
    putEscLn $ BgGreen   $ Black "Background sould be Green"
    putEscLn $ BgYellow  $ Black "Background sould be yellow"
    putEscLn $ BgBlue    $ Black "Background sould be blue"
    putEscLn $ BgMagenta $ Black "Background sould be magenta"
    putEscLn $ BgCyan    $ Black "Background sould be cyan"
    putEscLn $ BgWhite   $ Black "Background sould be white"
    putStrLn ""
    putStrLn "Default Colors"
    putStrLn "=============="
    putEscLn $ Red "-->" <> Default   "Foreground should be the default of the terminal" <> Red "<--"
    putEscLn $ (BgBlue $ White "-->") <> BgDefault "Background should be the default of the terminal" <> (BgBlue $ White "<--")
    putStrLn ""
    putStrLn "Inherit"
    putStrLn "========="
    putEscLn $ Underline $ BgWhite $ Blue $ ((UnderlineOff $ BgBlack $ White "-->") <> Inherit "This should be underlined, white background and blue foreground" <> (UnderlineOff $ BgBlack $ White "<---"))
    putStrLn ""
    putStrLn "Normal"
    putStrLn "========="
    putEscLn $ Underline $ BgWhite $ Blue $ (Inherit "-->" <> Normal "This should not have any attributes except for those from the terminal" <> Inherit "<---")
    putStrLn ""
    putStrLn "Blink and Blink Off"
    putStrLn "====================="
    putEscLn $ Red "This should not be blinking" <> Normal " " <> Blink <| Red "This should be blinking"
    putEscLn $ Blink $ Blue $ BlinkOff "This should be not blinking from blink off" <> Normal " " <> Inherit "This should be blinking"
    putStrLn ""
    putStrLn "Bright and Bright Off"
    putStrLn "====================="
    putEscLn $ Red "This should be dim" <> Inherit " " <> Bright <| Red "This should be bright"
    putEscLn $ Bright $ Blue $ BrightOff "This should be dim from bright off" <> Inherit " This should be bright"
    putStrLn ""
    putStrLn "Underline and Underline Off"
    putStrLn "==========================="
    putEscLn $ Red "This should not be underlined" <> Inherit " " <> Underline <| Red "This should be underlined"
    putEscLn $ Underline $ Blue $ UnderlineOff "This should not be underlined from underline off" <> Normal " " <> Inherit "This should be underlined"
    putStrLn ""
    putStrLn "Inverse and Inverse Off"
    putStrLn "==========================="
    putEscLn $ Red "This should be inverse" <> Normal " " <> Inverse <| Red "This should be inverse"
    putEscLn $ Inverse $ Blue $ InverseOff "This should not be inverse from inverse off" <> Normal " " <> Inherit "This should be inverse"
