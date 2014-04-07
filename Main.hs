import Network.HTTP.Conduit
import Network.HTTP.Client (defaultManagerSettings)
import System.Console.Haskeline
import qualified Data.ByteString.Char8 as B
import qualified Data.ByteString.Lazy.Char8 as BL
import Control.Monad.IO.Class
import System.Environment

main :: IO ()
main = do 
    args <- getArgs
    manager <- newManager defaultManagerSettings
    let loop :: InputT IO ()
        loop = do
           minput <- getInputLine "% "
           case minput of
               Nothing -> return ()
               Just "quit" -> return ()
               Just input -> do 
                    output <- liftIO (foo input (rootUrl args) manager)
                    outputStrLn output 
                    loop
    runInputT defaultSettings loop

foo :: String -> String -> Manager -> IO String
foo str url mgr = do
    response <- httpLbs (makeRequest str url) mgr
    return $ BL.unpack (responseBody response)

rootUrl :: [String] -> String
rootUrl [] = "http://127.0.0.1:8080/run"
rootUrl (url:_) = url ++ "/run"

makeRequest :: String -> String -> Request
makeRequest str url = request { queryString = B.pack str  }
    where Just request = parseUrl $ url
