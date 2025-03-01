{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_t3 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/Users/saratrasv/Developer/haskell/t3/.stack-work/install/aarch64-osx/e41791df4bc74c8dc13ebd3ed66b228b72d5cbb0d07c7984e63b8e7f1d91f8de/9.8.4/bin"
libdir     = "/Users/saratrasv/Developer/haskell/t3/.stack-work/install/aarch64-osx/e41791df4bc74c8dc13ebd3ed66b228b72d5cbb0d07c7984e63b8e7f1d91f8de/9.8.4/lib/aarch64-osx-ghc-9.8.4/t3-0.1.0.0-1kEgd89uLJ4Bj2oI0tYJVk-t3"
dynlibdir  = "/Users/saratrasv/Developer/haskell/t3/.stack-work/install/aarch64-osx/e41791df4bc74c8dc13ebd3ed66b228b72d5cbb0d07c7984e63b8e7f1d91f8de/9.8.4/lib/aarch64-osx-ghc-9.8.4"
datadir    = "/Users/saratrasv/Developer/haskell/t3/.stack-work/install/aarch64-osx/e41791df4bc74c8dc13ebd3ed66b228b72d5cbb0d07c7984e63b8e7f1d91f8de/9.8.4/share/aarch64-osx-ghc-9.8.4/t3-0.1.0.0"
libexecdir = "/Users/saratrasv/Developer/haskell/t3/.stack-work/install/aarch64-osx/e41791df4bc74c8dc13ebd3ed66b228b72d5cbb0d07c7984e63b8e7f1d91f8de/9.8.4/libexec/aarch64-osx-ghc-9.8.4/t3-0.1.0.0"
sysconfdir = "/Users/saratrasv/Developer/haskell/t3/.stack-work/install/aarch64-osx/e41791df4bc74c8dc13ebd3ed66b228b72d5cbb0d07c7984e63b8e7f1d91f8de/9.8.4/etc"

getBinDir     = catchIO (getEnv "t3_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "t3_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "t3_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "t3_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "t3_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "t3_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
