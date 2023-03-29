module "security_group" {
  source = "./sg"
  security_group_name = "my-security-group"
  vpc_id = "vpc-018f5b0c62692b327"
  ingress_rules_csv_path = "./sg-test-in.csv"
  egress_rules_csv_path = "./sg-test-ou.csv"
}