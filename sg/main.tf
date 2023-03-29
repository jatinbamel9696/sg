locals {
    ingress_rules = csvdecode(file(var.ingress_rules_csv_path))
    egress_rules = csvdecode(file(var.egress_rules_csv_path))
  }
resource "aws_security_group" "this" {
  name = var.security_group_name
  vpc_id = var.vpc_id

  

  dynamic "ingress" {
    for_each = local.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = split(",", ingress.value.cidr_blocks)
      description = ingress.value.description
    }
  }

  dynamic "egress" {
    for_each = local.egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = split(",", egress.value.cidr_blocks)
      description = egress.value.description
    }
  }
}
