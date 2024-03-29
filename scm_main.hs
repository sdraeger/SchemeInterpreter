module Main where

import System.Environment
import Control.Monad

import ScmParser (readExpr, extractValue, trapError)
import ScmEval

main :: IO ()
main = do
    args <- getArgs
    evaled <- return $ liftM show $ readExpr (args !! 0) >>= eval
    putStrLn $ extractValue $ trapError evaled
