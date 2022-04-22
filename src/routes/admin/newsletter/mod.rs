//! src/routes/admin/newsletter/mod.rs
mod post;
pub use post::publish_newsletter;

mod get;
pub use get::publish_newsletter_form;
