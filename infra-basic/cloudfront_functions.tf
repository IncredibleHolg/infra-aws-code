resource "aws_cloudfront_function" "json_reply_compressed" {
    name    = "json-reply-compressed"
    runtime = "cloudfront-js-1.0"
    comment = "Reply with the json.gz objrect instead of json, for BlueMap"
    publish = true
    code    = <<EOT
function handler(event) {
    // NOTE: This example function is for a viewer request event trigger.
    // Choose viewer request for event trigger when you associate this function with a distribution.
    var response = {
        statusCode: 200,
        statusDescription: 'OK',
        headers: {
            'cloudfront-functions': { value: 'generated-by-CloudFront-Functions' }
        }
    };
    return response;
}
EOT
}
