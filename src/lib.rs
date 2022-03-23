//! src/lib.rs

use std::fs::Metadata;

pub mod configuration;
pub mod domain;
pub mod routes;
pub mod startup;
pub mod telemetry;
pub trait Log: Sync + Send {
    fn enabled(&self, metadata: &Metadata) -> bool;

    // fn log(&self, record: &Record);

    fn flush(&self);
}
