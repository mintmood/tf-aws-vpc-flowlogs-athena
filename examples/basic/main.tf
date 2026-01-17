module "flow_logs" {
  source         = "../.."
  name           = "prod-vpc-flow-logs"
  vpc_id         = "vpc-0123456789abcdef0"
  retention_days = 14
}
