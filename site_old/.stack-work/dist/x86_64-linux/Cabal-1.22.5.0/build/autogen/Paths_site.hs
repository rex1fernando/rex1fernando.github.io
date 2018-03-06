module Paths_site (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/rex/fun/site/.stack-work/install/x86_64-linux/lts-6.13/7.10.3/bin"
libdir     = "/home/rex/fun/site/.stack-work/install/x86_64-linux/lts-6.13/7.10.3/lib/x86_64-linux-ghc-7.10.3/site-0.1.0.0-1HsvJ0HCW6a08lYWmVSWNe"
datadir    = "/home/rex/fun/site/.stack-work/install/x86_64-linux/lts-6.13/7.10.3/share/x86_64-linux-ghc-7.10.3/site-0.1.0.0"
libexecdir = "/home/rex/fun/site/.stack-work/install/x86_64-linux/lts-6.13/7.10.3/libexec"
sysconfdir = "/home/rex/fun/site/.stack-work/install/x86_64-linux/lts-6.13/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "site_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "site_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "site_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "site_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "site_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
