import System.CPUTime
import Text.Printf

time :: IO a -> IO (a, String)
time action = do
  start <- getCPUTime
  v <- action
  end <- getCPUTime
  let diff = fromIntegral (end - start) / 10 ^ 12
  return (v, printf "Computation time: %0.3f sec\n" diff)
