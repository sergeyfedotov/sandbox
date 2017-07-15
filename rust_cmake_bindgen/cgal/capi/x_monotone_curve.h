#ifdef __cplusplus
extern "C" {
#endif

typedef struct X_monotone_curve_2 X_monotone_curve_2;

X_monotone_curve_2* x_monotone_curve_create();

void x_monotone_curve_destroy(X_monotone_curve_2*);

bool x_monotone_curve_is_linear(X_monotone_curve_2*);

#ifdef __cplusplus
}
#endif
