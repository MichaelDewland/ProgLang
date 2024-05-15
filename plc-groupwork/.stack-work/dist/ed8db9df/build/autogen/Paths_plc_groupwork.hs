{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_plc_groupwork (
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

bindir     = "C:\\Users\\micha\\ProgLang\\plc-groupwork\\.stack-work\\install\\e17031a5\\bin"
libdir     = "C:\\Users\\micha\\ProgLang\\plc-groupwork\\.stack-work\\install\\e17031a5\\lib\\x86_64-windows-ghc-8.10.7\\plc-groupwork-0.1.0.0-IJYBKVULftEHY4AhjPffA"
dynlibdir  = "C:\\Users\\micha\\ProgLang\\plc-groupwork\\.stack-work\\install\\e17031a5\\lib\\x86_64-windows-ghc-8.10.7"
datadir    = "C:\\Users\\micha\\ProgLang\\plc-groupwork\\.stack-work\\install\\e17031a5\\share\\x86_64-windows-ghc-8.10.7\\plc-groupwork-0.1.0.0"
libexecdir = "C:\\Users\\micha\\ProgLang\\plc-groupwork\\.stack-work\\install\\e17031a5\\libexec\\x86_64-windows-ghc-8.10.7\\plc-groupwork-0.1.0.0"
sysconfdir = "C:\\Users\\micha\\ProgLang\\plc-groupwork\\.stack-work\\install\\e17031a5\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "plc_groupwork_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "plc_groupwork_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "plc_groupwork_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "plc_groupwork_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "plc_groupwork_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "plc_groupwork_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
