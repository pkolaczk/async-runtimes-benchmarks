import Control.Concurrent
import Text.Read (readMaybe)
import System.Environment
import Control.Monad
import Data.Maybe
import Safe
import Control.Concurrent.Async

main :: IO ()
main = do
  args <- getArgs
  let numRoutines = fromMaybe 100_000 (args `atMay` 0 >>= readMaybe)
  forConcurrently_ [1 .. numRoutines] \_ -> threadDelay 10_000_000
  print "All finished."
