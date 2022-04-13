//! src/routes/admin/newsletter/get.rs
use actix_web::http::header::ContentType;
use actix_web::HttpResponse;

pub async fn publish_newsletter_form() -> Result<HttpResponse, actix_web::Error> {
    let idempotency_key = uuid::Uuid::new_v4();
    Ok(HttpResponse::Ok()
        .content_type(ContentType::html())
        .body(format!(
            r#"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <title>Change Password</title>
</head>
<body>
    <form action="/admin/newsletter" method="post">
        <label>News letter
            <input
                type="text"
                placeholder="new newsletter text"
                name="newsletter"
            >
        </label>
        <input hidden type="text" name="idempotency_key" value="{idempotency_key}">
        <button type="submit">Publish</button>
    </form>
    <p><a href="/admin/dashboard">&lt;- Back</a></p>
</body>
</html>
            "#
        )))
}
