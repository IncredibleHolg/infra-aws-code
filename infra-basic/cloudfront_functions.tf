resource "aws_cloudfront_function" "json_reply_compressed" {
    name    = "json-reply-compressed"
    runtime = "cloudfront-js-1.0"
    comment = "Reply with the json.gz objrect instead of json, for BlueMap"
    publish = true
    code    = <<EOT
function handler(event) {
    var request = event.request;
    request.uri = request.uri + ".gz"
    return request;
}
EOT
}
