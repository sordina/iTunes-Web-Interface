{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Control.Applicative
import           Snap.Types
import           Text.Templating.Heist
import           Text.Templating.Heist.TemplateDirectory
import qualified Data.ByteString as B
import           Control.Monad.Trans (liftIO)
import           System.Cmd (system)

import           Glue
import           Server

type BS = B.ByteString
type S  = Snap ()

main :: IO ()
main = do
    td <- newTemplateDirectory' "templates" emptyTemplateState
    quickServer $ templateHandler td defaultReloadHandler $ \ts ->
        ifTop (help ts) <|>
        route [("/:action", remote_control)] >> help ts <|>
        notFound ts

help :: TemplateState Snap -> S
help = tryTemplate "help"

notFound :: TemplateState Snap -> S
notFound = tryTemplate "404"

tryTemplate :: BS -> TemplateState Snap -> S
tryTemplate location ts = maybe default_text writeBS =<< renderTemplate ts location

default_text :: S
default_text = writeBS "An error occured while rendering a Snap template."

remote_control :: S
remote_control = do
    param <- getParam "action"
    maybe (writeBS "must specify echo/param in URL") control param

control :: BS -> S
control action = liftIO $ perform (lookup action actions)

perform :: Maybe String -> IO ()
perform (Just action) = iTunes action
perform Nothing       = return ()

iTunes :: String -> IO ()
iTunes argument = system command >> return ()
  where command = "osascript -e 'tell app \"iTunes\" to " ++ argument ++ "'"

actions :: [(BS,String)]
actions = [
  ("play",     "play"),
  ("stop",     "stop"),
  ("pause",    "pause"),
  ("playpause","playpause"),
  ("next",     "next track"),
  ("previous", "previous track"),
  ("up",       "set sound volume to sound volume + 5"),
  ("down",     "set sound volume to sound volume - 5")
  ]
