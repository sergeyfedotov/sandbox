extern crate bindgen;
extern crate cmake;

use std::env;
use std::path::PathBuf;

use cmake::Config;

fn main () {
    let dst = Config::new("capi").build_target("all").build();
    println!("cargo:rustc-link-search=native={}/build", dst.display());
    println!("cargo:rustc-link-lib=static=cgal-capi");

    println!("cargo:rustc-link-lib=stdc++");
    println!("cargo:rustc-link-lib=CGAL");

    let bindings = bindgen::Builder::default()
        .header("wrapper.hpp")
        .generate()
        .expect("Unable to generate bindings");

    let out_path = PathBuf::from(env::var("OUT_DIR").unwrap());
    bindings
        .write_to_file(out_path.join("bindings.rs"))
        .expect("Couldn't write bindings!");
}
