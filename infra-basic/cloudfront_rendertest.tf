# Cloudfront settings


resource "aws_cloudfront_distribution" "minecraf_rendertest_distribution" {

  enabled = true
  is_ipv6_enabled = true
  price_class = "PriceClass_100"
  default_root_object = "index.html"

  origin {
  domain_name = aws_s3_bucket.s3_rendertest.bucket_regional_domain_name
  origin_id   = aws_s3_bucket.s3_rendertest.bucket_regional_domain_name    
  }

  ordered_cache_behavior {
    path_pattern = "/*.json"
    allowed_methods  = [
      "GET",
      "HEAD",
    ]
    target_origin_id       = aws_s3_bucket.s3_rendertest.bucket_regional_domain_name
    viewer_protocol_policy = "redirect-to-https"
    cache_policy_id   = local.minecraft_map_policy_id
    cached_methods = [
      "GET",
      "HEAD",
    ]
    compress = true
    function_association {
      event_type   = "viewer-request"
      function_arn = aws_cloudfront_function.json_reply_compressed.arn
    }
  }


  default_cache_behavior {
    compress = true
    cache_policy_id   = local.minecraft_map_policy_id
    allowed_methods  = ["GET", "HEAD",]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = aws_s3_bucket.s3_rendertest.bucket_regional_domain_name
    # not working with cache_policy
    # forwarded_values {
    #     query_string = false

    #     cookies {
    #         forward = "none"
    #     }
    # }
    viewer_protocol_policy = "redirect-to-https"
    # min_ttl                = 0
    # default_ttl            = 3600
    # max_ttl                = 86400
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

# resource "aws_cloudfront_response_headers_policy" "minecraft_rendertest" {
#   name = "minecraft-rendertest-compression"

#   custom_headers_config {
#     items {
#       header   = "X-Content-Encoding"
#       override = true
#       value    = "gzip"
#     }
#   }
# }