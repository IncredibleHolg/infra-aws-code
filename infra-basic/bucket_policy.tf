## mc_resources

resource "aws_s3_bucket_policy" "allow_public_mc_resources" {
    bucket = aws_s3_bucket.s3_mc_resources.id
    policy = data.aws_iam_policy_document.allow_public_access_mc_resources.json
}


data "aws_iam_policy_document" "allow_public_access_mc_resources" {
  statement {

    sid = "PublicReadGetObject"
      
    principals {
      type        = "*"
      identifiers = ["*"]
    }	
    
    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]
    resources = [
        aws_s3_bucket.s3_mc_resources.arn,
      "${aws_s3_bucket.s3_mc_resources.arn}/*",
    ]
  }

}

## s3_vanilla18

resource "aws_s3_bucket_policy" "allow_public_s3_vanilla18" {
    bucket = aws_s3_bucket.s3_vanilla18.id
    policy = data.aws_iam_policy_document.allow_public_access_s3_vanilla18.json
}


data "aws_iam_policy_document" "allow_public_access_s3_vanilla18" {
  statement {

    sid = "PublicReadGetObject"
      
    principals {
      type        = "*"
      identifiers = ["*"]
    }	
    
    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]
    resources = [
        aws_s3_bucket.s3_vanilla18.arn,
      "${aws_s3_bucket.s3_vanilla18.arn}/*",
    ]
  }

}

## s3_haulaway

resource "aws_s3_bucket_policy" "allow_public_s3_haulaway" {
    bucket = aws_s3_bucket.s3_haulaway.id
    policy = data.aws_iam_policy_document.allow_public_access_s3_haulaway.json
}


data "aws_iam_policy_document" "allow_public_access_s3_haulaway" {
  statement {

    sid = "PublicReadGetObject01"
      
    principals {
      type        = "*"
      identifiers = ["*"]
    }	
    
    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]
    resources = [
        aws_s3_bucket.s3_haulaway.arn,
      "${aws_s3_bucket.s3_haulaway.arn}/*",
    ]
  }

}
