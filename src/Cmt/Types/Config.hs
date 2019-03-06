{-# LANGUAGE NoImplicitPrelude #-}

module Cmt.Types.Config where

import ClassyPrelude (Eq, Maybe (..), Show, Text)

type Output = (Name, Text)

type Name = Text

data FormatPart
    = Named Name
    | Literal Text
    deriving (Show, Eq)

type Format = [FormatPart]

data PartType
    = Options [Text]
    | Line
    | Lines
    deriving (Show, Eq)

data Part =
    Part Name
         PartType
    deriving (Show, Eq)

data Config =
    Config [Part]
           Format
    deriving (Show, Eq)

partName :: Part -> Name
partName (Part name _) = name

formatName :: FormatPart -> Maybe Name
formatName (Named name) = Just name
formatName _            = Nothing
