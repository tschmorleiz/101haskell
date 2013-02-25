module Cut where

import Company

-- Cut all salaries in a company
cut :: Company -> Company
cut (n, es) = (n, map cutE es)
  where
    -- Cut the salary of an employee in half
    cutE :: Employee -> Employee
    cutE (n, a, s) = (n, a, s/2)
