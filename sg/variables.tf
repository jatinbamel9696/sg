variable "security_group_name" {
  description = "Name of the security group"
}

variable "vpc_id" {
  description = "ID of the VPC to associate the security group with"
}

variable "ingress_rules_csv_path" {
  description = "Path to the CSV file containing the ingress rules"
}

variable "egress_rules_csv_path" {
  description = "Path to the CSV file containing the egress rules"
}