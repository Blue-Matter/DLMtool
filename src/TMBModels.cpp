#include <TMB.hpp>
#include "LBSPR.h"

// Register the objective
template<class Type>
Type objective_function<Type>::operator() ()
{
  return LBSPR(this);
}
