#include <CGAL/Exact_predicates_inexact_constructions_kernel.h>
#include <CGAL/Gps_circle_segment_traits_2.h>

#include "x_monotone_curve.h"

typedef CGAL::Exact_predicates_inexact_constructions_kernel Kernel;
typedef CGAL::Gps_circle_segment_traits_2<Kernel> Traits_2;

extern "C" X_monotone_curve_2* x_monotone_curve_create()
{
    return reinterpret_cast<X_monotone_curve_2*>(new Traits_2::X_monotone_curve_2());
}

extern "C" void x_monotone_curve_destroy(X_monotone_curve_2* obj)
{
    delete reinterpret_cast<Traits_2::X_monotone_curve_2*>(obj);
}

extern "C" bool x_monotone_curve_is_linear(X_monotone_curve_2* obj)
{
    return reinterpret_cast<Traits_2::X_monotone_curve_2*>(obj)->is_linear();
}
