module Company.Data where

data Company = Company Name [Department]
 deriving (Eq, Read, Show)
data Department = Department Name Manager [Department] [Employee]
 deriving (Eq, Read, Show)
data Employee = Employee Name Address Salary
 deriving (Eq, Read, Show)
type Manager = Employee
type Name = String
type Address = String
type Salary = Float
