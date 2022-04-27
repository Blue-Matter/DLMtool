
#undef TMB_OBJECTIVE_PTR
#define TMB_OBJECTIVE_PTR obj

template<class Type>
Type LBSPR_test(objective_function<Type>* obj) {
  // Input Data
  DATA_SCALAR(MK);
  DATA_SCALAR(Beta);
  DATA_SCALAR(Linf);

  DATA_INTEGER(nage);
  DATA_INTEGER(nlen);

  DATA_VECTOR(CAL);
  DATA_VECTOR(LenMids);
  DATA_VECTOR(rLens);
  DATA_VECTOR(Ml);

  DATA_MATRIX(Prob);

  // // Estimated Parameters
  PARAMETER(log_sl50);
  PARAMETER(log_dsl50);
  PARAMETER(log_fm);

  // Declare derived values
  Type sl50 = exp(log_sl50) * Linf;
  Type dsl50 = exp(log_dsl50);
  Type sl95 = sl50 + sl50*dsl50;
  Type FM = exp(log_fm);

  // Declare storage
  matrix<Type> Cx(nage, nlen);
  vector<Type> Sl(nlen);
  vector<Type> Sx(nage);
  vector<Type> MSX(nage);
  vector<Type> Ns(nage);
  vector<Type> Ma(nage);
  vector<Type> Nc(nlen);

  Cx.setZero();
  Sl.setZero();
  Sx.setZero();
  MSX.setZero();
  Ns.setZero();
  Nc.setZero();
  Ma.setZero();

  Sl = 1/(1+exp(-log(19.0)*(LenMids-sl50)/(sl95-sl50)));

  for (int a=0; a<nage; a++) {
    vector<Type> val(nlen);
    val.setZero();
    val = Prob.row(a);
    Sx(a) = (val*Sl).sum();
    MSX(a) = (Sx.sum())/(a+1);
    Cx.row(a) = val * Sl;
    Ns(a) = pow((1-rLens(a)), (MK+(MK*FM)*MSX(a)));

    vector<Type> temp2(nlen);
    temp2.setZero();
    temp2 =  val * Ml;
    Ma(a) = temp2.sum();
  }

  for (int l=0; l<nlen; l++) {
    vector<Type> val = Cx.col(l);
    Nc(l) = (Ns * val).sum();
  }

  vector<Type> Nc_st(nage);
  Nc_st.setZero();
  Nc_st = Nc/Nc.sum();

  // Declare nll
  Type nll=0;
  nll = dmultinom(CAL, Nc_st, true);

  // Calculate SPR
  vector<Type> N0(nage);
  N0.setZero();

  N0 = pow((1-rLens), MK); // unfished numbers-at-age
  Type FishedEgg = (Ma * Ns * pow(rLens, Beta)).sum();
  Type UnfishedEgg = (Ma * N0 * pow(rLens, Beta)).sum();
  Type SPR = FishedEgg/UnfishedEgg;

  // Reports
  REPORT(Nc_st);
  REPORT(sl50);
  REPORT(sl95);
  REPORT(FM);
  REPORT(SPR);
  REPORT(-nll);
  return(-nll);
}

#undef TMB_OBJECTIVE_PTR
#define TMB_OBJECTIVE_PTR this




