#![allow(non_upper_case_globals)]
#![allow(non_camel_case_types)]
#![allow(non_snake_case)]

include!(concat!(env!("OUT_DIR"), "/bindings.rs"));

pub struct XMonotoneCurve2(*mut X_monotone_curve_2);

impl XMonotoneCurve2 {
    pub fn new() -> Self {
        XMonotoneCurve2(unsafe { x_monotone_curve_create() })
    }

    pub fn is_linear(&self) -> bool {
        unsafe { x_monotone_curve_is_linear(self.0) }
    }
}

impl Drop for XMonotoneCurve2 {
    fn drop(&mut self) {
        unsafe { x_monotone_curve_destroy(self.0); }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_is_linear() {
        let cv1 = XMonotoneCurve2::new();
        assert!(cv1.is_linear());
    }
}
