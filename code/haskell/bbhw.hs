#! /usr/bin/env runghc
-- Ignoring the shebang line above is a GHC extension 
-- (see 6.19.6. Whitespace)

-- LANGUAGE here is a pragma, not a comment!
{-# LANGUAGE Haskell2010, NumericUnderscores #-}
-- The NumericUnderscores extension is enabled by default in
-- GHC2021 or GHC2024, it got switched off by Haskell2010. 

-- GHC specific delay. 
-- There is no standard delay, and the POSIX ones may be interrupted.
import Control.Concurrent (threadDelay)

import Control.Monad (forM_)
import Numeric (readDec)
import System.Environment (getArgs)
import System.IO (stdout, hSetBuffering, BufferMode(NoBuffering))

-- Sequential do style; this program is heavily IO centric.
main = do
  let   -- could move these functions out of main
    ensureCount s = case readDec s of
      [(n,"")] -> return n
      _ -> do
        putStrLn ("Invalid countdown "++s++", try again...")
        demandCount
    demandCount = do
      putStr "Count? "
      s <- getLine
      ensureCount s
  args <- getArgs
  hSetBuffering stdout NoBuffering
  count <- case args of
    [arg] -> ensureCount arg
    _     -> demandCount
  putStr "World, Hello..."
  forM_ [count, count-1 .. 1] $ \i -> do
    putStr (show i ++ "...")
    threadDelay 1_000_000  -- Here are our two extensions.
  putStrLn "Bye Bye."
