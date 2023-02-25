# Imported cloudfront settings


resource "aws_cloudfront_distribution" "minecraf_tmap_distribution" {

    enabled = true
    is_ipv6_enabled = true
    price_class = "PriceClass_100"
    default_root_object = "index.html"

   origin {
    domain_name = aws_s3_bucket.s3_vanilla18.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.s3_vanilla18.bucket_regional_domain_name    
   }


   

  default_cache_behavior {
    compress = true
    cache_policy_id   = local.minecraft_map_policy_id
    allowed_methods  = ["GET", "HEAD",]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = aws_s3_bucket.s3_vanilla18.bucket_regional_domain_name
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
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
  }


}

# Copy of AWS resource
# resource "aws_cloudfront_cache_policy" "minecraft_map_policy"{
#     name = "Managed-CachingOptimized"
#     comment = "Default policy when CF compression is enabled"
#     min_ttl = 1
#     parameters_in_cache_key_and_forwarded_to_origin {
#         enable_accept_encoding_brotli = true
#         enable_accept_encoding_gzip   = true
#         cookies_config {
#             cookie_behavior = "none"
#         }
#         headers_config {
#             header_behavior = "none"
#         }
#         query_strings_config {
#             query_string_behavior = "none"
#         }
#     }
# }
