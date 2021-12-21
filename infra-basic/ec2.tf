resource "aws_instance" "overviewerworker" {
    ami = "ami-05d34d340fb1d89e5"
    instance_type = "t2.micro"
    tags = {
        "installer"   = "hdunkel"
        "installtype" = "terraform-imported"
    }
    vpc_security_group_ids =  [
            aws_security_group.overviewerworker-sg-01.id
    ]

}

# resource "aws_security_group" "overviewerworker-sg" {
#     name = "launch-wizard-1"
#     description = "launch-wizard-1 created 2021-12-21T08:33:22.945+01:00"  
#     tags = {
#         "installer"   = "hdunkel"
#         "installtype" = "terraform-imported"
#     } 
#     egress = [
#       {
#         "cidr_blocks" = [
#             "0.0.0.0/0"
#         ],
#         "description"= "",
#         "from_port"= 0,
#         "ipv6_cidr_blocks"= [],
#         "prefix_list_ids"= [],
#         "protocol"= "-1",
#         "security_groups"= [],
#         "self"= false,
#         "to_port"= 0
#       }
#     ]
#     ingress = [
#         {
#         "cidr_blocks"= [
#             "0.0.0.0/0"
#         ],
#         "description"= "",
#         "from_port"= 22,
#         "ipv6_cidr_blocks"= [],
#         "prefix_list_ids"= [],
#         "protocol"= "tcp",
#         "security_groups"= [],
#         "self"= false,
#         "to_port"= 22
#         }
#     ]
# }

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
        }
    ]
    tags = {
    "installer"   = "hdunkel"
    "installtype" = "terraform-imported"
    }
}


