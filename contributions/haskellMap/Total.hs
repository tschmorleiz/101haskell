module Total where

import Company

-- Total all salaries in a company
total :: Company -> Float
total (n, es) = sum (map totalE es)
  where
    -- Extract the salary from an employee
    totalE :: Employee -> Float
    totalE (_, _, s) = s
