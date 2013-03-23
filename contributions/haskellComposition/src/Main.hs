module Main where

import Company.Data
import Company.Sample
import Company.Align
import Company.Total
import Company.Cut
import Company.Depth
import Test.HUnit
import System.Exit

-- A company that violates the alignment constraint
failCorp = Company
  "Fail Industries"
  [ Department "Failure"
      (Employee "Advice Dog" "Memebase" 100)
      []
      [Employee "Philosoraptor" "/b/" 1000]
  ]

-- Compare salary total with baseline
totalTest = 399747.0 ~=? total sampleCompany

-- Compare total after cut with baseline
cutTest = 199873.5 ~=? total (cut sampleCompany)

-- Test for round-tripping of de-/serialization
serializationTest = sampleCompany ~=? read (show sampleCompany)

-- Check alignment constraint for salaries
alignmentSuccessTest =  True ~=? align sampleCompany

-- Negative test case for alignment constraint
alignmentFailureTest = False ~=? align failCorp

tests =
  TestList [
    TestLabel "total" totalTest,
    TestLabel "cut" cutTest,
    TestLabel "serialization" serializationTest,
    TestLabel "alignmentSuccess" alignmentSuccessTest,
    TestLabel "alignmentFailure" alignmentFailureTest
  ]

main = do
 counts <- runTestTT tests
 if (errors counts > 0 || failures counts > 0)
   then exitFailure
   else exitSuccess
