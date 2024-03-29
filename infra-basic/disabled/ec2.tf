# Starting & Stopping 
# aws ec2 stop-instances --instance-ids i-08004b73e218bc460
# aws ec2 start-instances --instance-ids i-08004b73e218bc460
resource "aws_instance" "overviewerworker" {
    ami = "ami-05d34d340fb1d89e5"
    #instance_type = "t2.micro"
    instance_type = var.ec2_type
    iam_instance_profile = aws_iam_instance_profile.overviewerworker_profile.name
    # user_data_replace_on_change = true
    tags = {
        "installer"   = "hdunkel"
        "installtype" = "terraform-imported"
    }
    vpc_security_group_ids =  [
            aws_security_group.overviewerworker-sg-01.id
    ]

}


resource "aws_security_group" "overviewerworker-sg-01" {
    name = "overviewerworker-sg-01"
    description = "Security group for overviewer instances"  
    egress = [
      {
        "cidr_blocks" = [
            "0.0.0.0/0"
        ],
        "description"= "",
        "from_port"= 0,
        "ipv6_cidr_blocks"= [],
        "prefix_list_ids"= [],
        "protocol"= "-1",
        "security_groups"= [],
        "self"= false,
        "to_port"= 0
      }
    ]
    ingress = [
        {
            cidr_blocks = [
                "0.0.0.0/0",
            ]
            description = "NFS for EFS"
            from_port = 2049
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol = "tcp"
            security_groups  = []
            self             = false
            to_port          = 2049
        },
        {
            "cidr_blocks"= [
                "0.0.0.0/0"
            ],
            "description"= "",
            "from_port"= 22,
            "ipv6_cidr_blocks"= [],
            "prefix_list_ids"= [],
            "protocol"= "tcp",
            "security_groups"= [],
            "self"= false,
            "to_port"= 22
        },
        {
            "cidr_blocks"= [
                "0.0.0.0/0"
            ],
            "description"= "Squid",
            "from_port"= 8765,
            "ipv6_cidr_blocks"= [],
            "prefix_list_ids"= [],
            "protocol"= "tcp",
            "security_groups"= [],
            "self"= false,
            "to_port"= 8765
        }        
    ]
    tags = {
    "installer"   = "hdunkel"
    "installtype" = "terraform-imported"
    }
}

resource "aws_iam_instance_profile" "overviewerworker_profile" {
    name = "overviewerworker_profile"
    role = aws_iam_role.overviewerworker_role.name
    tags = {
    "installer"   = "hdunkel"
    "installtype" = "terraform"
    }
}

resource "aws_iam_role" "overviewerworker_role" {
  name = "overviewerworker_role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
            Effect = "Allow"
            Principal = {
                Service = "ec2.amazonaws.com"
            }
            Action = "sts:AssumeRole"
        },
        ]
        })
    managed_policy_arns = [
        "arn:aws:iam::aws:policy/AmazonS3FullAccess",
        "arn:aws:iam::aws:policy/AmazonElasticFileSystemClientFullAccess",
    ]

    tags = {
    "installer"   = "hdunkel"
    "installtype" = "terraform"
    }
}
