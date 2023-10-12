// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// IPD
IntegerMatrix IPD(IntegerVector pos1, IntegerMatrix internal_pos, IntegerVector posm);
RcppExport SEXP _GenomicTuples_IPD(SEXP pos1SEXP, SEXP internal_posSEXP, SEXP posmSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< IntegerVector >::type pos1(pos1SEXP);
    Rcpp::traits::input_parameter< IntegerMatrix >::type internal_pos(internal_posSEXP);
    Rcpp::traits::input_parameter< IntegerVector >::type posm(posmSEXP);
    rcpp_result_gen = Rcpp::wrap(IPD(pos1, internal_pos, posm));
    return rcpp_result_gen;
END_RCPP
}
// allTuplesSorted
bool allTuplesSorted(IntegerVector pos1, IntegerMatrix internal_pos, IntegerVector posm);
RcppExport SEXP _GenomicTuples_allTuplesSorted(SEXP pos1SEXP, SEXP internal_posSEXP, SEXP posmSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< IntegerVector >::type pos1(pos1SEXP);
    Rcpp::traits::input_parameter< IntegerMatrix >::type internal_pos(internal_posSEXP);
    Rcpp::traits::input_parameter< IntegerVector >::type posm(posmSEXP);
    rcpp_result_gen = Rcpp::wrap(allTuplesSorted(pos1, internal_pos, posm));
    return rcpp_result_gen;
END_RCPP
}
// pcompareGTuples
IntegerVector pcompareGTuples(IntegerVector int_seqnames, IntegerVector int_strand, IntegerMatrix int_pos);
RcppExport SEXP _GenomicTuples_pcompareGTuples(SEXP int_seqnamesSEXP, SEXP int_strandSEXP, SEXP int_posSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< IntegerVector >::type int_seqnames(int_seqnamesSEXP);
    Rcpp::traits::input_parameter< IntegerVector >::type int_strand(int_strandSEXP);
    Rcpp::traits::input_parameter< IntegerMatrix >::type int_pos(int_posSEXP);
    rcpp_result_gen = Rcpp::wrap(pcompareGTuples(int_seqnames, int_strand, int_pos));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_GenomicTuples_IPD", (DL_FUNC) &_GenomicTuples_IPD, 3},
    {"_GenomicTuples_allTuplesSorted", (DL_FUNC) &_GenomicTuples_allTuplesSorted, 3},
    {"_GenomicTuples_pcompareGTuples", (DL_FUNC) &_GenomicTuples_pcompareGTuples, 3},
    {NULL, NULL, 0}
};

RcppExport void R_init_GenomicTuples(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
