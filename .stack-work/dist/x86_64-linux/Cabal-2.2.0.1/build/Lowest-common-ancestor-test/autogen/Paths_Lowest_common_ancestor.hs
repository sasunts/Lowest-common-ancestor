{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_Lowest_common_ancestor (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
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
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/mnt/c/Users/vahes/sweng/Lowest-common-ancestor/.stack-work/install/x86_64-linux/lts-12.10/8.4.3/bin"
libdir     = "/mnt/c/Users/vahes/sweng/Lowest-common-ancestor/.stack-work/install/x86_64-linux/lts-12.10/8.4.3/lib/x86_64-linux-ghc-8.4.3/Lowest-common-ancestor-0.1.0.0-C0m0oX6FHSsJI59z032nIL-Lowest-common-ancestor-test"
dynlibdir  = "/mnt/c/Users/vahes/sweng/Lowest-common-ancestor/.stack-work/install/x86_64-linux/lts-12.10/8.4.3/lib/x86_64-linux-ghc-8.4.3"
datadir    = "/mnt/c/Users/vahes/sweng/Lowest-common-ancestor/.stack-work/install/x86_64-linux/lts-12.10/8.4.3/share/x86_64-linux-ghc-8.4.3/Lowest-common-ancestor-0.1.0.0"
libexecdir = "/mnt/c/Users/vahes/sweng/Lowest-common-ancestor/.stack-work/install/x86_64-linux/lts-12.10/8.4.3/libexec/x86_64-linux-ghc-8.4.3/Lowest-common-ancestor-0.1.0.0"
sysconfdir = "/mnt/c/Users/vahes/sweng/Lowest-common-ancestor/.stack-work/install/x86_64-linux/lts-12.10/8.4.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Lowest_common_ancestor_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Lowest_common_ancestor_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "Lowest_common_ancestor_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "Lowest_common_ancestor_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Lowest_common_ancestor_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Lowest_common_ancestor_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
